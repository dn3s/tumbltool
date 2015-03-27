use strict;
use warnings;
package TumblTool::Fail;
use base 'Exporter';
our @EXPORT=('fail');
sub fail
{
	my $message=shift();
	if($message){
		print("Error: $message\n");
	}
	print qq{
USAGE
};
die;
}
