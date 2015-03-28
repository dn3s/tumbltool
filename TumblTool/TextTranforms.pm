use strict;
#use warnings;
package TumblTool::TextTransforms;
use CSS::Minifier;
use JavaScript::Minifier;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use base 'Exporter';
our @EXPORT=('collapseLines', 'removeHTMLComments', 'minifyCSS', 'minifyJS', 'jsQuote', 'stripHTML', 'encodeURIComponent');

sub collapseLines
{
	my $txt=shift();
	$txt=~s/[\r\n\t]//g;#remove newlines, tabs
	return $txt;
}
sub removeHTMLComments
{
	(my $html, my $preserveConditionals)=@_;
	my $conditional=$preserveConditionals?"(?!if )":"";
	$html=~s/<!--$conditional.*?-->//g;
	return $html;
}
sub minifyCSS
{
	my $css=shift();
	$css=~s/[\r\n\s]/ /g;
	return CSS::Minifier::minify(input=>$css);
}
sub minifyJS
{
	my $js=shift();
	return JavaScript::Minifier::minify(input=>$js);
}
sub jsQuote
{
	my $text=shift();
	$text=~s/\\/\\\\/g;
	$text=~s/'/\\'/g;
	return "'$text'";
}
sub stripHTML
{
	my $text=shift();
	my $hs=HTML::Strip->new(emit_spaces=>0);
	return $hs->parse(encode_entities($text));
}
sub encodeURIComponent
{
	return uri_escape_utf8(shift());
}
1;
