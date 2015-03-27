use strict;
use warnings;
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
sub getContentDir
{
	return dirname(shift());
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
