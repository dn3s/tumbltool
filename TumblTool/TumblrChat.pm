use strict;
#use warnings;
package TumblTool::TumblrChat;

sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"Posts"}})
	{
		if($post->{"PostType"} and $post->{"PostType"} eq "chat" and $post->{"Lines"}) {
			processLines($post->{"Lines"}, $post->{"PostAuthor"});
		}
	}
}

sub processLines
{
	(my $lines, my $name)=@_;
	my $users={};
	my $nextId=1;
	my $odd=1;
	for my $line (@{$lines}) {
		$line->{"Alt"}=$odd?"odd":"even";
		$odd=!$odd;
		my $label=$line->{"Label"};
		$line->{"name"}=$name;
		if($label) {
			if(!$users->{$label}) {
				$users->{$label}=$nextId++;
			}
			$line->{"UserNumber"}=$users->{$label};
		}
	}
}

1;
