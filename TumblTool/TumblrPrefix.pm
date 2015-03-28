use strict;
#use warnings;
package TumblTool::TumblrPrefix;
use TumblTool::TextTransforms;
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
	return encodeURIComponent($val) if($varName=~/^URLEncoded/ );
	return $val;
}
