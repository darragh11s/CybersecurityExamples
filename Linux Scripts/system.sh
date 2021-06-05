#!/bin/bash

#Free memory to output file
free -h > /home/sysadmin/backups/freemem/free_mem.txt

#disk usage to output file
du -h > /home/sysadmin/backups/diskuse/disk_usage.txt

#list open files to output file
lsof > /home/sysadmin/backups/openlist/open_list.txt

#list file system disk space statistics
df -h > /home/sysadmin/backups/freedisk/free_disk.txt
