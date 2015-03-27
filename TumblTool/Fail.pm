use strict;
#use warnings;
package TumblTool::Fail;
use TumblTool::Slurp;
use File::Basename;
use base 'Exporter';
our @EXPORT=('fail');
sub fail
{
	my $message=shift();
	if($message){
		print("Error: $message\n\n");
	}
	my $dir=dirname(__FILE__);
	print(TumblTool::Slurp::slurp("$dir/usage.txt"));
	exit(1);
}
