#Tumbltool

Test and deploy tumblr themes with ease! _WARNING: Work in progress. Refer to the [issues page](https://github.com/dn3s/tumbltool/issues) for current problems._

##Installation

You will need perl 5 installed, as well as the `JSON:PP` module [from CPAN](http://search.cpan.org/~makamaka/JSON-PP-2.27300/lib/JSON/PP.pm) (your distribution should also provide a package). Then just put `tumbltool` somewhere in your `$PATH` and fire away. For more convenient previews, put `content.json` in the same directory as your theme (although this behavior will change soon; see [issues](https://github.com/dn3s/tumbltool/issues)).

##Usage

`Usage: tumbltool <COMMAND> [OPTIONS]`

###Commands:

`preview:`

Print an example page using the theme specified in FILE, filled with example material from a JSON file (see -content)

`bundle:`

Bundle up a theme with any needed assets into a single file to be pasted into Tumblr. Useful for a sort of ghetto deployment system.

`help`

Show this help text and exit.

###Options:

`-c --content: <FILE>`

specify content to populate the rendered preview page.

`-d --dataURI`

Format output as a base64-encoded data URI, meant for piping into a browser (or sending a link to clients I guess)

`-i --include: <FILES>`

specify CSS or Javscript file(s) to add to the theme, included at the special {tumbltool_includes} tag in your theme file (so make sure to add it, presumably at the end of your theme's &lt;head>. Multiple files can be specified as a space-separated list, or this argument can be added multiple times. You can supply absolute paths, relative paths, or URIs.

`-l --inline:`

Include all local files (not URIs though) inline, using &lt;script> or &lt;style> tags, so the preview or bundle is a single, self-contained file. Handy for one-step deployment, but may hurt performance since browsers won't cache stylesheets.

`-s --strip`

Remove unnecessary whitespace. Useful for keeping file sizes down and ease of sharing.

`-v --var ATTRIBUTE=VALUE`

Specify custom variables you may have in your theme. (Not yet implemented)

`-t --theme FILE`

Specify the theme file to preview/bundle.
