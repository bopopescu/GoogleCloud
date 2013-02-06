#!/usr/bin/perl 

use strict;
use warnings;


sub mount_ephemeral_disk {

	my @DiskList = `ls -al /dev/disk/by-id/google-ephemeral-disk-* | cut -d ' ' --fields=10`;
	my $Num_Disk = @DiskList;
	my $disk = "";

	for (my $i = 0; $i < $Num_Disk; $i++) {
		$disk = $DiskList[$i];
		system("sudo mkdir -p /mnt/scratch$i/");
		system("sudo /usr/share/google/safe_format_and_mount -m \"mkfs.ext4 -F\" $disk /mnt/scratch$i");
		system("sudo chmod a+w /mnt/scratch$i");
	}
}

mount_ephemeral_disk;