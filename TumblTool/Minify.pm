use strict;
#use warnings;
package TumblTool::Minify;
use CSS::Minifier;
use JavaScript::Minifier;
use base 'Exporter';
our @EXPORT=('collapseLines', 'removeHTMLComments', 'minifyCSS', 'minifyJS');

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
	return CSS::Minifier::minify(shift());
}
sub minifyJS
{
	return JavaScript::Minifier::minify(shift());
}
1;
