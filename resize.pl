#!/usr/bin/perl
my $file=@ARGV[0];
(my $name, my $extension)=$file=~/(.+)\.(png|jpg|jpeg|gif)/;
foreach my $res (1280, 500, 400, 250, 100) {
	if($res<@ARGV[1]) {
		print("Resizing to $res...");
		`convert '$name.$extension' -resize '${res}x$res' ${name}_$res.$extension`;
		print(" Done. Filename: ${name}_$res.$extension\n");
	}
}
print("Resizing and Cropping to 75x75...");
`convert '$name.$extension' -resize '75x75^' -gravity center -crop 75x75+0+0 +repage ${name}_75sq.$extension`;
print(" Done. Filename: ${name}_75sq.$extension\n");
print("All operations complete.\n");
