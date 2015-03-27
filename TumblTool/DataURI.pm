use strict;
use warnings;
package TumblTool::DataURI;
use MIME::Base64;
use TumblTool::Slurp;
use base 'Exporter';
our @EXPORT=('dataURI', 'dataURIFromFile');
my $mimeTypes={
	jpg=>"image/jpeg",
	jpeg=>"image/jpeg",
	png=>"image/png",
	gif=>"image/gif",
	bmp=>"image/bmp",
};
sub dataURI
{
	(my $mime, my $data)=@_;
	return "data:$mime;base64," . encode_base64($data, "");
}
sub dataURIFromFile
{
	(my $file)=@_;
	$file=~/.+\.([A-z]{1,5})/;
	my $extension=$1;
	return dataURI($mimeTypes->{$extension}, slurp($file));
}
