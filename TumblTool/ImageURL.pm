use strict;
#use warnings;
package TumblTool::ImageURL;
use TumblTool::DataURI;
use TumblTool::PathUtils;
use base 'Exporter';
our @EXPORT=('imageURL');
my $contentRoot="";
my $dataURI=0;
sub configure
{
	my $options=shift();
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
	$dataURI     = $options->{"dataURI"    } // $dataURI;
}
sub dumpConfig
{
	return "TumblTool::ImageURL Config:\ncontentRoot='$contentRoot'\ndataURI='$dataURI'\n\n";
}
sub imageURL
{
	(my $image, my $res)=@_;
	return $image if($image=~/^http:\/\//);
	if($image=~/^(.+)\.(gif|png|jpg|jpeg|bmp|tiff|svg)$/) {
		my $name=$1;
		my $extension=$2;
		$res=~s/^(?:HighRes|Panorama)$//; #if it's a HighRes or Panorama photo, just return the file with no suffix
		my $suffix=$res?"_$res":"";
		my $filename="$contentRoot/${name}$suffix.$extension";
		return dataURIFromFile($filename) if $dataURI;
		return getLinkToFile($filename);
	}
	return "";
}
1;
