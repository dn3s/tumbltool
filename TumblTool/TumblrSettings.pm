use strict;
#use warnings;
package TumblTool::TumblrSettings;
use JSON;
use TumblTool::Slurp;
use Data::Dumper;
my $settingsFile="";
my $collapseHTML=0;
my $settings={};
sub configure
{
	(my $options)=@_;
	$settingsFile=$options->{"settingsFile"} // $settingsFile;
	$collapseHTML=$options->{"collapseHTML"} // $collapseHTML;
	$settings=parseSettings($settingsFile);
}
sub parseSettings
{
	(my $settingsFile)=@_;
	my $in=decode_json(slurp($settingsFile));
	return $in;
}
sub settingsTags
{
	my $n=$collapseHTML?"":"\n";
	my $out="$n";
	foreach my $setting (keys %{$settings}) {
		my $label=$settings->{$setting};
		my $default=$settings->{$setting};
		$default="0" if(!$default and $default=~/^if/);
		$out.=("<meta name=\"$label\" content=\"$default\" />$n");
	}
	return $out;
}
sub printVar
{
	(my $var, my $content)=@_;
	if((my $type, my $name)=$var->{"name"}=~/^(color|image|font|text|select):(.+)$/) {
		return $settings->{"$type:$name"};
	}
	return;
}
1;
