#!/bin/bash

function show_help() {
	echo "Usage: $0 [TYPE] NAME [DESTINATION]"
	echo "      [TYPE]         is either plugin or theme"
	echo "       NAME          is the plugin's or theme's name (if in current path, $(pwd))"
	echo "                     or the path to it"
	echo "      [DESTINATION]  optional destination that differs from NAME"
	echo ""
	echo "This script will generate a .pot file. If the TYPE is not specified it will use generic"
	echo "generator. If the DESTINATION file is not specified the file name and location will be"
	echo "derived from the specified NAME, using the provided NAME as the path and its basename"
	echo "as file name."
}

if [[ ("$1" == "help") || ("$#" -eq "0") ]]; then
	show_help

	exit 0;
fi

if [[ "$#" -ge "3" ]]; then
	DESTINATION="$3"
elif [[ "$#" -ge "2" ]]; then
	DESTINATION="$2/$(basename $2).pot"
elif [[ -d $1 ]]; then
	DESTINATION="$1/$(basename $1).pot"
fi

if [[ "$1" == "theme" ]]; then
	php "$I18N_TARGET_DIR/makepot.php" wp-theme "$2" "$DESTINATION"
elif [[ "$1" == "plugin" ]]; then
	php "$I18N_TARGET_DIR/makepot.php" wp-plugin "$2" "$DESTINATION"
else
	if [[ -d $1 ]]; then
		php "$I18N_TARGET_DIR/makepot.php" generic "$1" "$DESTINATION"
	else
		exec "$@";
	fi
fi

exit 0
