use strict;
#use warnings;
package TumblTool::TumblrSettings;
use JSON;
use TumblTool::Slurp;
my $settingsFile="";
my $collapseHTML=0;
my $settings={};
sub configure
{
	(my $options)=@_;
	$settingsFile=$options->{"settingsFile"} // $settingsFile;
	$collapseHTML=$options->{"collapseHTML"} // $collapseHTML;
	$settings=decode_json(slurp($settingsFile));
}
sub settingsTags
{
	my $n=$collapseHTML?"":"\n";
	my $out="$n";
	foreach my $setting (keys %{$settings}) {
		my $type=$settings->{$setting}->{"type"};
		my $default=$settings->{$setting}->{"default"};
		$default="0" if(!$default and $type eq "if");
		$out.=("<meta name=\"$type:$setting\" content=\"$default\" />$n");
	}
}
1;
