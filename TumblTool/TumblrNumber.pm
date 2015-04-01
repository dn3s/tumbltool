use strict;
#use warnings;
package TumblTool::TumblrNumber;
use TumblTool::TextTransforms;
my $labels={
	"PlayCount"=>["play", "plays"],
	"NoteCount"=>["note", "notes"],
};
sub printVar
{
	(my $var, my $content)=@_;
	if($var->{"name"}=~/^([A-z]+)WithLabel$/) {
		my $name=$1;
		my $number=$content->{$1};
		return formatNumber($number, $labels->{$name}[0], $labels->{$name}[1]);
	}
	return;
}
