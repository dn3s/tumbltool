use strict;
#use warnings;
package TumblTool::TumblrSettings;
use JSON;
use TumblTool::Slurp;
use TumblTool::HtmlInteraction;
use Data::Dumper;
my $settingsFile="";
my $collapseHTML=0;
my $settings={};
my $theme={};
sub configure
{
	(my $options)=@_;
	$theme=$options->{"theme"} // $theme;
	$collapseHTML=$options->{"collapseHTML"} // $collapseHTML;
	parseSettings() if($options->{"theme"});
}
sub parseSettings
{
	$settings={};
	my $tags=TumblTool::HtmlInteraction::extract(
"<meta\\s*name=\"([a-z]+:[A-z_ -]+)\"(?:\\s*content=\"([^\">]*?)\")?\\s?/?>"
);
	foreach my $tag (@{$tags}) {
		shift(@{$tag});#get rid of first entry which is just the whole match
		(my $name, my $default)=@{$tag};
		$name=~s/ //g if($name=~/^if:/);
		$name=~s/^if://;
		$settings->{$name}=$default;
	}
}
sub printVar
{
	(my $var, my $content)=@_;
	if((my $type, my $name)=$var->{"name"}=~/^(color|image|font|text|select):(.+)$/) {
		return $settings->{"$type:$name"};
	}
	return;
}
sub ifBlockEnabled
{
	(my $var)=@_;
	if($var=~s/^IfNot//) {
		return !$settings->{blockify($var)};
	}
	elsif($var=~s/^If//) {
		return $settings->{blockify($var)};
	}
	return 0;
}
sub blockify
{
	(my $in)=@_;
	if(( my $name, my $type)=$in=~/^(.+)(Image|Text)$/) {
		return lc($type).":$name";
	}
	return $in;
}
1;
