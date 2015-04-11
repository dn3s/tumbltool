use strict;
#use warnings;
package TumblTool::TumblrLink;
use TumblTool::ImageURL;
my $newWindow=0;
sub configure
{
	my $options=shift();
	$newWindow = $options->{"newWindow"} // $newWindow;
}
sub dumpConfig
{
	return "TumblTool::TumblrLink Config:\nnewWindow='$newWindow'\n\n";
}
sub printVar
{
	(my $var, my $content, my $root)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	return $content->{"Name"} or $content->{"URL"} if($name eq "Name");
	return target() if($name eq "Target");
	return host($content->{"URL"}) if($name eq "Host");
	return imageURL($content->{"Thumbnail"}) if($content->{"Thumbnail"} and $name eq "Thumbnail");
	return;
}
sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"Posts"}}) {
		if($post->{"URL"}) {
			$post->{"Host"}=1;
		}
	}
}
sub host
{
	(my $url)=@_;
	$url=~/^https?:\/\/(?:www\.)?([^\/:#\?]+)/;
	return $1;
}
sub target
{
	return "target=\"_blank\"" if $newWindow;
}
1;
