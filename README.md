#Tumbltool

Test and deploy tumblr themes with ease! Preview your theme offline, or pack it up into a single file, optionally inlining and minifying stylesheets and scripts for easy deployment to Tumblr.

##Caveats

The preview feature works by providing a quick and dirty re-implementation of Tumblr's whole Theme API, which is a lot of work. At this point only a small portion of the API is actually implemented. This will change over time, though. [This file](https://github.com/dn3s/tumbltool/blob/master/vars.html) should roughly track what's supported.

Also, this has only been tested on Linux (Specifically ArchLinux). Theoretically it shouldn't be too hard to port to Windows/OSX, but I don't have the time to do that. Pull requests welcome though!

##Installation

You will need perl 5 installed, as well as the `JSON::PP`, `CSS::Minify`, `JavaScript::Minify`, `HTML::Entities`, `HTML::Escape`, and `URI::Escape` modules from CPAN (your distribution should also provide packages). Put the `TumblTool` directory in your perl installation's `@INC` path. Then just put `tumbltool` somewhere in your `$PATH`, and rename the `example_content` directory either to `/etc/tumbltool` or `$HOME/.tumbltool` (or just keep it in your working directory, but that's messy)

##Usage

```
Usage: tumbltool <COMMAND> [OPTIONS]

Commands:

preview
Print an example page using the theme specified in FILE, filled with example material from a JSON file (see -content)

bundle
Bundle up a theme with any needed assets into a single file to be pasted into Tumblr. Useful for a sort of ghetto deployment system.

help
Show this help text and exit.

Options:

-c --content <FILE>
Specify content to populate the rendered preview page, either as an absolute or relative path to a JSON file, or the name of one of the bundled content packages (currently only "default" is available).

-d --dataURI
Format output as a base64-encoded data URI, meant for piping into a browser (or sending a link to clients I guess). Example: tumbltool preview --theme your_file_here -dataURI | xargs firefox

-i --include <FILES>
specify CSS or Javscript file(s) to add to the theme, included at the special {tumbltool_includes} tag in your theme file (so make sure to add it, presumably at the end of your theme's <head>. Multiple files can be specified as a space-separated list, or this argument can be added multiple times. You can supply absolute paths, relative paths, or URIs.

-l --inline
Include all local files (not URIs though) inline, using <script> or <style> tags, so the preview or bundle is a single, self-contained file. Also inlines images as Data URIs. Handy for one-step deployment and easy previews, but may hurt performance since browsers won't cache stylesheets, images, or scripts.

-s --strip
Remove unnecessary whitespace, and minify scripts and stylesheets. Useful for keeping file sizes down and ease of sharing.

-v --var ATTRIBUTE=VALUE
Specify custom variables you may have in your theme. (Not yet implemented)

-t --theme FILE
Specify the theme file to preview/bundle.
```

##Contributing

I am new to Github, as well as Git in general, so apologies if I fumble the process up a bit at first, but contributions are welcome! The main thing left to do is make the previews richer. There are two main ways you can contribute:

- The first way doesn't even require knowledge of perl; just adding more material to the `data.json` file helps improve the quality of previews we render. Either add to the current one (`example_content/default/data.json`), or create a new fictional blog (perhaps `example_content/hipster`, `example_content/cat_enthusiast`, `example_content/tech_startup`, for example). Just make sure any content used is original, public domain, or otherwise appropriately licensed for use in this project. The JSON schema should be fairly straightforward, but I will answer any questions.
- The other way is to help implement the API. Take a look at [vars.html](https://github.com/dn3s/tumbltool/blob/master/vars.html) to get a sense of what's left to implement. Take a look at [TumblTool/TumblrDate.pm](https://github.com/dn3s/tumbltool/blob/master/TumblTool/TumblrDate.pm) for an example. The essentials are:
	- Make a perl module, named `TumblrX` (in CamelCase), where X is a word that describes the portion of the Tumblr Theme API it will implement.
	- Export a single subroutine, named similarly to the module, but with the first letter lowercase (you are allowed globals, other subs, etc, but don't export them)
	- The subroutine will accept two parameters:
		- The first one, `$varName`, is a scalar containing the name of the Tumblr Theme variable
		- The second one, `$content`, is a hash reference to the content object being rendered.
	- The subroutine will either return nothing (`return;`), or, if appropriate, a string containing the text to be substituted for the theme variable.
	- `use` the module in `TumblTool/Preview.pm`, and add your sub to the `//`-separated "list" of subs in `renderVar`.
