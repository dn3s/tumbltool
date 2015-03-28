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
	my $css=shift();
	$css=~s/[\r\n\s]/ /g;
	return CSS::Minifier::minify(input=>$css);
}
sub minifyJS
{
	my $js=shift();
	return JavaScript::Minifier::minify(input=>$js);
}
1;
