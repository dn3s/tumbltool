use strict;
#use warnings;
package TumblTool::TumblrChat;
use Data::Dumper;

sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"Posts"}})
	{
		if($post->{"PostType"} and $post->{"PostType"} eq "chat" and $post->{"Lines"}) {
			processLines($post->{"Lines"});
		}
	}
}

sub processLines
{
	(my $lines)=@_;
	my $users={};
	my $nextId=1;
	my $odd=1;
	for my $line (@{$lines}) {
		$line->{"Alt"}=$odd?"odd":"even";
		$odd=!$odd;
		my $label=$line->{"Label"};
		if($label) {
			if(!$users->{$label}) {
				$users->{$label}="$nextId";
				$nextId++;
			}
			$line->{"UserNumber"}=$users->{$label};
		}
	}
	print(Dumper($lines));
}

1;
