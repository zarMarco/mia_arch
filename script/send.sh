#!/bin/bash

btrfs send  /mnt/snaps/root_arch--$(date +%b.%d.%y) | btrfs receive /mnt/backup
btrfs send /mnt/snaps-home/home_arch--$(date +%b.%d.%y) | btrfs receive /mnt/backup
btrfs subvolume delete /mnt/snaps/root_arch--$(date +%b.%d.%y)
btrfs subvolume delete /mnt/snaps-home/home_arch--$(date +%b.%d.%y)
