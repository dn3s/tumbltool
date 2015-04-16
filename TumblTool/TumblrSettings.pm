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
	my $out={};
	foreach my $label (keys %{$in}) {
		my $varname=$label;
		$varname=~s/ //g;
		$out->{$varname}=$in->{$label};
		$out->{$varname}->{"label"}=$label; #unused at the moment, but maybe it'll render a "settings panel" at some point
	}
	return $out;
}
sub settingsTags
{
	my $n=$collapseHTML?"":"\n";
	my $out="$n";
	foreach my $setting (keys %{$settings}) {
		my $type=$settings->{$setting}->{"type"};
		my $label=$settings->{$setting}->{"label"};
		my $default=$settings->{$setting}->{"default"};
		$default="0" if(!$default and $type eq "if");
		$out.=("<meta name=\"$type:$label\" content=\"$default\" />$n");
	}
	return $out;
}
sub printVar
{
	(my $var, my $content)=@_;
	if((my $type, my $name)=$var->{"name"}=~/^(color|image|font|text|select):(.+)$/) {
		print("$type, $name\n");
	}
	print ("$settings->{$var->{name}}->{varname}");
}
1;
