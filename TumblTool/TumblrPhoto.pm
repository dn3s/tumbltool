use strict;
#use warnings;
package TumblTool::TumblrPortrait;
use TumblTool::ImageURL;
sub printVar
{
	(my $var, my $content, my $root)=@_;
	my $name=$var->{"name"};
	if($name=~/^Photo(URL|Width|Height)-(1280|500|400|250|100|75sq|HighRes|Panorama)$/) {
		my $type=$1 || "";
		my $res =$2;
		my $photo=$content->{"Photo"};
		return imageURL($photo->{"file"}, $res);
		my $width=$photo->{"width"};
		my $height=$photo->{"height"};
		my $aspect=$width/$height;
	}
	return;
}
1;
