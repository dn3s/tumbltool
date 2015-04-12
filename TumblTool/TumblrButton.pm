use strict;
#use warnings;
package TumblTool::TumblrButton;
use TumblTool::DataURI;
use TumblTool::Slurp;
use TumblTool::TextTransforms;
use File::Spec;
use File::Basename;
my $dir=dirname(__FILE__);
my $collapseHTML=0;
my $stripHTMLComments=0;
sub configure
{
	my $options=shift();
	$collapseHTML                = $options->{"collapse"     } // $collapseHTML;
	$stripHTMLComments           = $options->{"stripComments"} // $stripHTMLComments;
}
sub dumpConfig
{
	return "TumblTool::TumblrButton Config:\ncollapseHTML='$collapseHTML'\nstripHTMLComments='$stripHTMLComments'\n\n";
}
sub printVar
{
	(my $var, my $content)=@_;
	if($var->{"name"}=~/^(Like|Reblog)Button$/) {
		my $type=$1;
		return button($type, $var->{"params"}->{"size"} || 20, $var->{"params"}->{"color"} || "#ccc", "")
	}
	return;
}
sub button
{
	(my $type, my $size, my $color, my $iframe)=@_;
	my $file=File::Spec->catfile($dir, "${type}Button.html");
	my $iframe=File::Spec->catfile($dir, "${type}Button_iframe.html");
	my $txt=readButtonFile($file, $collapseHTML, $stripHTMLComments);
	$txt=applyParams($txt, $size, $color, $iframe);
	return $txt;
}
sub applyParams
{
	(my $txt, my $size, my $color, my $iframe)=@_;
	$txt=~s/{size}/$size/g;
	$txt=~s/{color}/$color/g;
	if($txt=~/{iframe}/) {
		my $t=readButtonFile($iframe, 1, 1);
		my $content=dataURI("text/html",applyParams($t, $size, $color, 0));
		$txt=~s/{iframe}/$content/;
	}
	return $txt;
}
sub readButtonFile
{
	(my $file, my $collapse, my $stripComments)=@_;
	my $txt=slurp($file);
	$txt=collapseLines($txt) if($collapse);
	$txt=removeHTMLComments($txt, 1) if($stripComments);
	return $txt;
}
1;
