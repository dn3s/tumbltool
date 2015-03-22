#Tumbltool

Test and deploy tumblr themes with ease! _WARNING: Work in progress. Refer to the [issues page](https://github.com/dn3s/tumbltool/issues) for current, major problems._

##Installation

You will need perl 5 installed, as well as the `JSON:PP` module [from CPAN])http://search.cpan.org/~makamaka/JSON-PP-2.27300/lib/JSON/PP.pm) (your distribution should also provide a package). Then just put `tumbltool` somewhere in your `$PATH` and fire away. For more convenient previews, put `content.json` in the same directory as your theme (although this behavior will change soon; see [issues](https://github.com/dn3s/tumbltool/issues)).

##Usage

`Usage: tumbltool <COMMAND> [OPTIONS] FILE`

###Commands:

`preview:`

Print an example page using the theme specified in FILE, filled with example material from a JSON file (see -content)

`bundle:`

Bundle up a theme with any needed assets into a single file to be pasted into Tumblr. Useful for a sort of ghetto deployment system.

###Options:

`-assets=file1[,file2...fileN]`

Specify stylesheets and/or scripts to include in the document, in the form of a comma-separated list of local paths or URIs. Local paths are relative to the current working directory. Files will be included either inline or linked, depending on the -inline option, while URIs will be linked always. They will be included at the special `{tumbltool_assets}` tag in your theme file, so make sure to add that tag (probably at the end of your theme's `<head>`). You are responsible for keeping your shell from breaking up this list into multiple arguments; I recommend putting the whole list in quotes.

`-content=file.json`

Specify the JSON file to provide the example content. Defaults to `content.json` in your current directory.

`-dataURI`

Output your test page as a data URI, handy for previewing in a browser really easily- for example: `tumbltool -dataURI theme.html | xargs firefox`

`-inline`

Include all local files specified in -assets inline, using inline `<script>` or `<style>` tags, instead of the default behavior of linking to them with `<script>` or `<link>` tags. Handy for a nice one-step deploy, but hurts performance as users can't cache your stylesheets/scripts, since they are transmitted with every page load.

`-strip`

Remove unnecessary whitespace. Useful for keeping file sizes down (for marginal performance boost?)

`-theme=FILE`

Alternate syntax for specifying the theme file.
