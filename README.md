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
Print an example page using the theme specified in FILE, filled with
example material from a JSON file (see -content)

bundle
Bundle up a theme with any needed assets into a single file to be pasted
into Tumblr. Useful for a sort of ghetto deployment system.

help
Show this help text and exit.

Options:
Some options can be prepended with -no, negating their effect. Specific
options override more general ones (for example, -no-inline-css will
override the more general -inline)

-p -pipe
Generate output for piping into a browser through xargs. Shortcut for
-tiny -inline -data-uri

-l -[no-]inline
Smush everything into a single file. Shortcut for -inline-css -inline-js
-inline-img

-y -[no-]tiny
Shrink everything as much as possible. Shortcut for -minify-css -minify-js
-minify-html

-mh -[no-]minifyHTML
Shrink the HTML as much as possible. Shortcut for -collapse-html-lines
-strip-html-comments -no-keep-ie-comments

-c -[no-]content <FILE>
Specify content to populate the rendered preview page, either as an
absolute or relative path to a JSON file, or the name of one of the
bundled content packages (currently only "default" is available).

-d -data-uri
Format output as a base64-encoded data URI

-i -include <FILES>
specify CSS or Javscript file(s) to add to the theme, included at the
special {tumbltool_includes} tag in your theme file (so make sure to add
it, presumably at the end of your theme's <head>. Multiple files can
be specified as a space-separated list, or this argument can be added
multiple times. You can supply absolute paths, relative paths, or URIs.

-lc -[no-]inline-css
Print all local (non-URL) stylesheets inline, using <style> tags

-li -[no-]inline-img
Print all local (non-URL) images inline, using base64-encoded data URIs

-lj -[no-]inline-js
Print all local (non-URL) scripts inline, using <script> tags

-mc -[no-]minify-css
Minify all inline stylesheets

-mj -[no-]minify-js
Minify all inline scripts

-hl -[no-]collapse-html-lines
Collapse all HTML code into a single line (for ease of copy/pasting)

-hc -[no-]strip-html-comments
Strip out all HTML comments

-ie -[no-]keep-ie-comments
When stripping out HTML comments, don't remove IE-style conditional
comments

-t -theme FILE
Specify the theme file to preview/bundle.

-v -var ATTRIBUTE=VALUE
Specify custom variables you may have in your theme. (Not yet implemented)
```

##Examples

Tumbltool provides a several "shortcut" options that should cover a number of common use cases. Here are some examples, some using the "shortcuts", some not:

- Preview a theme in your browser using a data URI: `tumbltool preview -pipe -theme theme.html -include typography.css colors.css layout.css interaction.js | xargs firefox`
- If your theme uses large images or really long stylesheets or something, it's probably a bad idea to smush them into data URIs. In this example, we inline everything except images: `tumbltool preview -inline -no-inline-img -theme theme.html -include typograhpy.css colors.css layout.css interaction.js > preview.html; firefox preview.html`
- Combine and minify all your files and load the result into your clipboard for pasting into Tumblr's theme editor: `tumbltool bundle -tiny -inline -theme theme.html -include typography.css colors.css layout.css interaction.js | xclip`
- Note that this works if some of your includes are URIs; it detects it's a URI and doesn't try to link to it: `tumbltool bundle -tiny -inline -theme theme.html -include typography.css colors.css layout.css interaction.js http://example.com/jquery_xx.min.js | xclip`

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
