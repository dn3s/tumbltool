use strict;
#use warnings;
package TumblTool::TumblrSource;
use Data::Dumper;
use TumblTool::ImageURL;
sub printVar
{
	(my $var, my $content)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	my $src=$content->{"ContentSource"};
	return if(!$src);
	return $src->{"url"} if($name eq "SourceURL");
	return $src->{"title"} if($name eq "SourceTitle");
	return if(!$src->{"logo"});
	return imageURL($src->{"logo"}->{"file"}) if($name eq "BlackLogoURL");
	return $src->{"logo"}->{"width"} if($name eq "LogoWidth");
	return $src->{"logo"}->{"height"} if($name eq "LogoHeight");
	return;
}
sub processContent
{
	(my $content)=@_;
	my $posts=$content->{"blog"}->{"Posts"};
	my $sources=$content->{"sources"};
	for my $post (@{$posts}) {
		if($post->{"ContentSource"}) {
			my $source=$sources->{$post->{"ContentSource"}};
			$post->{"SourceLogo"}=$source->{"logo"};
			$post->{"NoSourceLogo"}=!$source->{"logo"};
			$source->{"title"}=$post->{"ContentSource"};
			$post->{"ContentSource"}=$source;
		}
	}
}
1;
