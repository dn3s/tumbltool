use strict;
#use warnings;
package TumblTool::TumblrChat;

sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"blog"}->{"Posts"}})
	{
		if($post->{"PostType"} and $post->{"PostType"} eq "chat" and $post->{"Lines"}) {
			processLines($post->{"Lines"}, $post->{"PostAuthor"});
		}
	}
}

sub processLines
{
	(my $lines, my $name)=@_;
	my $users={}; #a hash of usernames to IDs
	my $nextId=1;
	my $odd=1;
	for my $line (@{$lines}) {
		$line->{"Alt"}=$odd?"odd":"even";
		$odd=!$odd;
		my $label=$line->{"Label"};
		$line->{"Label"}=$label.": ";
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
