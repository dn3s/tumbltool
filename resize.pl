#!/usr/bin/perl
use Getopt::Long;
my $width=1280;
my $file="";
GetOptions(
	"width|w=i" => \$width,
	"file|f=s"  => \$file,
	"portrait|p"=> \$portrait
) or die();
if(!($file)) {
	print "No file specified! --file\n";
	exit(1);
}
(my $name, my $extension)=$file=~/(.+)\.(png|jpg|jpeg|gif)/;
if($portrait) {
	foreach my $res (128, 96, 64, 48, 40, 30, 24, 16) {
		resize($name, $extension, $res, 1);
	}
}
else {
	foreach my $res (1280, 500, 400, 250, 100) {
		if($res<$width) {
			resize($name, $extension, $res);
		}
	}
	resize($name, $extension, $res, 1, "sq");
}
print("All operations complete.\n");
exit(0);

sub resize
{
	(my $name, my $extension, my $res, my $square, my $suffix)=@_;
	my $suf=$suffix||"";
	print("Resizing to ");
	if($square) {
		print("${name}_${res}$suf.$extension...");
		`convert '$name.$extension' -resize '${res}x${res}^' -gravity center -crop ${res}x$res+0+0 +repage ${name}_${res}$suf.$extension`;
	}
	else {
		print("${name}_${res}$suf.$extension...");
		`convert '$name.$extension' -resize '${res}x$res' ${name}_${res}$suf.$extension`;
	}
	print(" Done.\n");
}
