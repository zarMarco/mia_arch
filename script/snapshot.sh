#!/bin/bash

mount -t btrfs -o compress=lzo,subvol=/ /dev/nvme0n1p3 /mnt/snaps
mount -t btrfs -o compress=lzo,subvol=/ /dev/sda3 /mnt/snaps-home
btrfs subvolume snapshot -r /mnt/snaps/@arch /mnt/snaps/root_arch--$(date +%b.%d.%y)
btrfs subvolume snapshot -r /mnt/snaps-home/@home-arch /mnt/snaps-home/home_arch--$(date +%b.%d.%y)
mount -t btrfs -o compress=lzo,subvol=/ /dev/sda7 /mnt/backup &&
./send.sh
