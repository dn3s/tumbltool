use strict;
#use warnings;
package TumblTool::TumblrAnswer;

my $answerBlock=0; #THIS IS RIDICULOUS TUMBLR IS TRYING TO BE TOO SMART ITS LIKE "STOP, UR A THEMING API NOT A ROCKETSHIP SUPERCOMPUTER"

sub config
{
	(my $options)=@_;
	$answerBlock=$options->{"answerBlock"} // $answerBlock;
}
sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"Posts"}}) {

	}
}
sub printVar
{
	(my $var, my $content)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	
	return;
}
1;
