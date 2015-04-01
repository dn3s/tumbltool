use strict;
#use warnings;
package TumblTool::PathUtils;
use base 'Exporter';
our @EXPORT=('setContentName', 'getContentFile', 'getFile', 'getLinkToFile', 'setOutputFile');
use Cwd;
use File::Basename;
use File::Spec;

my $home=$ENV{HOME};
my $cwd=cwd();
my $contentPath=[
	"/etc/tumbltool",
	File::Spec->catdir($home, ".tumbltool"),
	File::Spec->rel2abs(".tumbltool"),
	File::Spec->rel2abs("example_content"),
	File::Spec->curdir()
];
my $outputFile;
my $outputRoot;
my $contentFile;
my $contentRoot;
sub configure
{
	my $options=shift();
	$outputRoot  = $options->{"outputRoot" } // $outputRoot;
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
}
sub dumpConfig
{
	return "TumblTool::PathUtils Config:\noutputFile='$outputFile'\noutputRoot='$outputRoot'\ncontentFile='$contentFile'\ncontentRoot='$contentRoot'\n\n";
}
sub setOutputFile
{
	(my $filename)=@_;
	$outputRoot=$filename?dirname($filename):File::Spec->curdir();
	return $outputRoot;
}
sub setContentName
{
	(my $filename)=@_;
	$contentRoot=dirname(getContentFile($filename));
	return $contentRoot;
}
sub getContentFile
{
	return $contentFile if($contentFile);
	(my $name)=@_;
	return $name if(File::Spec->file_name_is_absolute($name));
	return rel2abs($name) if($name=~/\.json$/);
	my $file="";
	foreach my $dir (@{$contentPath}) {
		$file=File::Spec->catfile($dir, "$name.json");
		return $contentFile=$file if(-e $file);
		$file=File::Spec->catfile($dir, $name, "data.json");
		return $contentFile=$file if(-e $file);
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
	return File::Spec->abs2rel($file, $outputRoot); #TODO: Figure out symlinking or copything
}
1;
