WordPress translation helper
============================

This helper can generate a _pot_ for your WordPress themes and plugins. It makes use of the [WordPress i18n helpers](https://develop.svn.wordpress.org/trunk/tools/i18n/) and the ubuntu [gettext package](http://packages.ubuntu.com/search?keywords=gettext).

Usage
-----

The usage is very simple. In simple terms you have to bind a volume to the image and point the generator to it.
You can either specify if it is a theme or a plugin or let the generic generator do its work. The destination file can
be specified. However it will be derived from the specified name if you don't provide one.

### Example

```bash
docker run --rm -v /path/to/wp-theme:/var/www/html/wp-theme sebwas/wp-i18n wp-theme
```

For help text, run

```bash
docker run --rm sebwas/wp-i18n help
```
