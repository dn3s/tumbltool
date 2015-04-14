use strict;
#use warnings;
package TumblTool::TumblrAnswer;
use TumblTool::TumblrUser;

my $answerBlock=0; #THIS IS RIDICULOUS TUMBLR IS TRYING TO BE TOO SMART ITS LIKE "STOP, UR A THEMING API NOT A ROCKETSHIP SUPERCOMPUTER"

sub config
{
	(my $options)=@_;
	$answerBlock=$options->{"answerBlock"} // $answerBlock;
}
sub printVar
{
	(my $var, my $content)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	if($name=~/^(?:Asker|Answerer)$/) {
		my $username=$content->{$name};
		return "Anonymous" if($username eq "Anonymous");
		my $class=lc($name);
		my $url=TumblTool::TumblrUser::getUser($username)->{"URL"};
		return "<a class=\"$class\" href=\"$url\">$username</a>";
	}
	return;
}
1;
