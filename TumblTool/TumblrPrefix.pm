use strict;
use warnings;
package TumblTool::TumblrPrefix;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use base 'Exporter';
our @EXPORT=('tumblrPrefix');
sub tumblrPrefix
{
	(my $varName, my $val)=@_;
	if($varName=~/^RGB/) {
		$val=~/#?(..)(..)(..)/;
		return ("$1,$2,$3");
	}
	return stripHTML($val)          if($varName=~/^Plaintext/  );
	return jsQuote($val)            if($varName=~/^JS/         );
	return jsQuote(stripHTML($val)) if($varName=~/^JSPlaintext/);
	return uri_escape_utf8($val)    if($varName=~/^URLEncoded/ );
	return $val;
}
sub jsQuote
{
	my $text=shift();
	$text=~s/\\/\\\\/g;
	$text=~s/'/\\'/g;
	return "'$text'";
}
sub stripHTML
{
	my $text=shift();
	my $hs=HTML::Strip->new(emit_spaces=>0);
	return $hs->parse(encode_entities($text));
}
