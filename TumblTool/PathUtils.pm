use strict;
#use warnings;
package TumblTool::PathUtils;
use base 'Exporter';
our @EXPORT=('getContentDir', 'getContentFile', 'getFile');
use Cwd;
use File::Basename;

my $home=$ENV{HOME};
my $cwd=cwd();
my $contentPath=[
	"/etc/tumbltool",
	"$home/.tumbltool",
	"$cwd/.tumbltool",
	"$cwd/example_content",
	"$cwd"
];
my $outputRoot;
my $contentRoot;
sub configure
{
	my $options=shift();
	$outputRoot  = $options->{"outputRoot" } // $outputRoot;
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
}
sub getContentDir
{
	return dirname(getContentFile(shift()));
}
sub getContentFile
{
	(my $name)=@_;
	return $name if($name=~/^\//);
	return "$cwd/$name" if($name=~/\.json$/);
	foreach my $dir (@{$contentPath}) {
		if(-e "$dir/$name.json") {
			return "$dir/$name.json";
		}
		elsif(-e "$dir/$name/data.json") {
			return "$dir/$name/data.json";
		}
	}
	return;
}
sub getFile
{
	my $name=shift();
	return ($name=~/^\//)?$name:"$cwd/$name";
}
sub getLinkToFile
{
	(my $file)=@_;
	#turn it into a relative path
	#if that involves traversing upward, copy/symlink it in??
	return $file; #TODO: implement
}
