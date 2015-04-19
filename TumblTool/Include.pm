use strict;
#use warnings;
package TumblTool::Include;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use TumblTool::TextTransforms;
use TumblTool::TumblrDate;
use TumblTool::PathUtils;
use TumblTool::Slurp;
use base 'Exporter';
our @EXPORT=('processIncludes');
my $headIncludes=[];
my $tailIncludes=[];
my $inlineCSS=0;
my $inlineJS=0;
my $minifyCSS=0;
my $minifyJS=0;
my $collapseHTML=0;
sub configure
{
	my $options=shift();
	$headIncludes     = $options->{"headIncludes"} // $headIncludes;
	$tailIncludes     = $options->{"tailIncludes"} // $tailIncludes;
	$inlineCSS    = $options->{"inlineCSS"   } // $inlineCSS;
	$inlineJS     = $options->{"inlineJS"    } // $inlineJS;
	$minifyCSS    = $options->{"minifyCSS"   } // $minifyCSS;
	$minifyJS     = $options->{"minifyJS"    } // $minifyJS;
	$collapseHTML = $options->{"collapseHTML"} // $collapseHTML;
}
sub dumpConfig
{
	my $hinc=$headIncludes?"['".join("', '",@{$headIncludes})."']":"[]";
	my $tinc=$tailIncludes?"['".join("', '",@{$tailIncludes})."']":"[]";
	return "TumblTool::Include Config:\nheadIncludes=$hinc\ntailIncludes=$tinc\ninlineCSS='$inlineCSS'\ninlineJS='$inlineJS'\nminifyCSS='$minifyCSS'\nminifyJS='$minifyJS'\ncollapseHTML='$collapseHTML'\n\n";
}
sub processIncludes
{
	(my $tail)=@_;
	my $result="";
	foreach my $name (@{($tail?$tailIncludes:$headIncludes)}) {
		$result.=include($name);
	}
	return $result;
}
sub include
{
	(my $file)=@_;
	$file=~/\.(css|js)$/;
	my $type=$1;
	my $isURI=($file=~/^http:\/\/.+$/);
	my $inline=(($type eq "css" and $inlineCSS) or ($type eq "js" and $inlineJS)) and !$isURI;
	my $n=$collapseHTML?"":"\n";
	my $before="";
	my $include="";
	my $after="";
	if($inline){
		$include=slurp(getFile($file))
	}
	else{
		$include=getLinkToFile(getFile($file));
	}
	if($type eq "css"){
		$before=$inline?"<style>$n":"<link rel=\"stylesheet\" type=\"text/css\" href=\"";
		$include=minifyCSS($include) if($inline and $minifyCSS);
		$after=$inline?"$n</style>":"\" />";
	}
	elsif($type eq "js"){
		$before=$inline?"<script>$n":"<script src=\"";
		$include=minifyJS($include) if($inline and $minifyJS);
		$after=$inline?"$n</script>":"\"></script>";
	}
	return "${n}${before}${include}${after}${n}";
}
1;
