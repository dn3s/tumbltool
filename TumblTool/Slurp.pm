use strict;
use warnings;
package TumblTool::Slurp;
use base 'Exporter';
use TumblTool::Fail;
our @EXPORT=('slurp');
sub slurp #yum. needed both by parseTheme and parseContent (unless there's a way to make the JSON parser work without slurping)
{
	(my $filename, my $strip)=@_;
	open(my $fh, "<", $filename) or fail("Cannot open file \"$filename\"");
	$/ = undef;
	my $result=readline($fh) or fail("Cannot read file \"$filename\"");
	close($fh);
	$result=shrinkHTML($result) if($strip);
	return $result;
}
sub shrinkHTML
{
	my $html=shift();
	$html=~s/[\r\n\t]//g;#remove newlines, tabs
	$html=~s/<!--(?!if ).*?-->//g;#remove comments, unless they start with "if" because it might then be an IE conditional comment
	return $html;
}
