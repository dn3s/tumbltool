use strict;
#use warnings;
package TumblTool::TumblrDate;
use Time::Piece;
my $formats={
	"DayOfMonth"          => "%e",
	"DayOfMonthWithZero"  => "%d",
	"DayOfWeek"           => "%A",
	"ShortDayOfWeek"      => "%a",
	"DayOfWeekNumber"     => "%u",
	"DayOfMonthSuffix"    => "th",
	"DayOfYear"           => "%j",
	"WeekOfYear"          => "%W",
	"Month"               => "%B",
	"ShortMonth"          => "%b",
	"MonthNumber"         => "%e",
	"MonthNumberWithZero" => "%m",
	"Year"                => "%Y",
	"ShortYear"           => "%y",
	"AmPm"                => "%P",
	"CapitalAmPm"         => "%p",
	"12Hour"              => "%I",
	"24Hour"              => "%k",
	"12HourWithZero"      => "%l",
	"24HourWithZero"      => "%H",
	"Minutes"             => "%M",
	"Seconds"             => "%S",
	"Timestamp"           => "%s",
	"TimeAgo"             => "100 years ago",
};
sub printVar
{
	(my $var, my $content)=@_;
	my $name=$var->{"name"};
	my $date=$content->{"date"};
	return rand(1000) if($name eq "Beats");
	return ordinalSuffix($date) if($name eq "DayOfMonthSuffix");
	return localtime($date)->strftime($formats->{$name}) if($formats->{$name});
	return;
}
sub ordinalSuffix
{
	(my $val)=@_;
	my $d=localtime($val)->strftime("%e");
	return "th" if($d>=11 and $d<=13);
	return "st" if($d % 10 == 1);
	return "nd" if($d % 10 == 2);
	return "rd" if($d % 10 == 3);
	return "th";
}
1;
