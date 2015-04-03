use strict;
#use warnings;
package TumblTool::TumblrPhoto;
use TumblTool::ImageURL;
use Data::Dumper;
my $resolutions=[1280,500,400,250,100,75];
sub printVar
{
	(my $var, my $content, my $root)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	if($name=~/^Photo(URL|Width|Height)-(1280|500|400|250|100|75sq|HighRes|Panorama)$/) {
		my $type=$1 || "";
		my $res =$2;
		my $photo=$content->{"Image"};
		my $width=$photo->{"width"};
		my $height=$photo->{"height"};
		my $aspect=$width/$height;
		my $highestRes=highestRes($width);
		$res=$highestRes if ($highestRes<$res);#don't try to make a bigger image than the original
		return imageURL($photo->{"file"}, ($res==$width)?0:$res) if($type eq "URL");
		return $res                                              if($type eq "Width");
		return $height*$res/$width                               if($type eq "Height");
	}
	return;
}
sub highestRes
{
	(my $width)=@_;
	return $width if($width>=$resolutions->[0]);
	foreach my $res (@{$resolutions}) {
		return $res if($res<=$width);
	}
	return;
}
1;
