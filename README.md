#Tumbltool

Test and deploy tumblr themes with ease! Preview your theme offline, or pack it up into a single file, optionally inlining and minifying stylesheets and scripts for easy deployment to Tumblr.

##Caveats

The preview feature works by providing a quick and dirty re-implementation of Tumblr's whole Theme API, which is a lot of work. At this point only a small portion of the API is actually implemented. This will change over time, though. [This file](https://github.com/dn3s/tumbltool/blob/master/vars.html) should roughly track what's supported.

Also, this has only been tested on Linux (Specifically ArchLinux). Theoretically it shouldn't be too hard to port to Windows/OSX, but I don't have the time to do that. Pull requests welcome though!

##Installation

You will need perl 5 installed, as well as the `JSON::PP`, `CSS::Minify`, `JavaScript::Minify`, `HTML::Entities`, `HTML::Escape`, and `URI::Escape` modules from CPAN (your distribution should also provide packages). Then just put `tumbltool` somewhere in your `$PATH`, and rename the `example_content` directory either to `/etc/tumbltool` or `$HOME/.tumbltool` (or just keep it in your working directory, but that's messy)

##Usage

`Usage: tumbltool <COMMAND> [OPTIONS]`

###Commands:

`preview:`

Print an example page using the theme specified in FILE, filled with example material from a JSON file (see `-content`)

`bundle:`

Bundle up a theme with any needed assets into a single file to be pasted into Tumblr. Useful for a sort of ghetto deployment system.

`help`

Show this help text and exit.

###Options:

`-c --content: <FILE>`

specify content to populate the rendered preview page, either as an absolute or relative path to a JSON file, or the name of one of the bundled content packages (currently only "default" is available).

`-d --dataURI`

Format output as a base64-encoded data URI, meant for piping into a browser (or sending a link to clients I guess). Example: `tumbltool preview --theme your_file_here -dataURI | xargs firefox`

`-i --include: <FILES>`

specify CSS or Javscript file(s) to add to the theme, included at the special {tumbltool_includes} tag in your theme file (so make sure to add it, presumably at the end of your theme's `&lt;head>`. Multiple files can be specified as a space-separated list, or this argument can be added multiple times. You can supply absolute paths, relative paths, or URIs.

`-l --inline:`

Include all local files (not URIs though) inline, using &lt;script> or &lt;style> tags, so the preview or bundle is a single, self-contained file. Handy for one-step deployment, but may hurt performance since browsers won't cache stylesheets.

`-s --strip`

Remove unnecessary whitespace, and minify scripts and stylesheets. Useful for keeping file sizes down and ease of sharing.

`-v --var ATTRIBUTE=VALUE`

Specify custom variables you may have in your theme. (Not yet implemented)

`-t --theme FILE`

Specify the theme file to preview/bundle.
