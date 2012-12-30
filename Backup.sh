#!/bin/bash

#Author:		fitz24
#Date:			9-apr-2012
#
#
#Purpose:		Home computer back up script
#				Backup home folder to mounted truecrypt volume
# 				cp (copy) command switches
#				-r recursive
#				-u update, only newer or non backed up files
#				-p preserve=mode,ownership,timestamps
#				-v verbose
#				-i interactive 

# Set the source directory to the home drive. 
Source="~/*"

# Set the destination directory to the truecrypt directory which always mounts to "/media/truecrypt1"
Dest="/media/truecrypt1"

# Inform of what we are doing
echo "Starting backup of $Source to $Dest"

# Etc.
echo "This may take a very long time"

# Set the start time of the backup
echo "Started backup: $(date)" >> Backup.log

# Loop the files in the source directory
for myFile in $Source

	do
		# Exclude the Backup directory because this is mounted to the remote backup drive and we have a recursive reference if we leave it in
		if [ "$myFile" = "~/BackupDrive" ]; then
		
			echo "	no backup of " $myFile >> Backup.log
			
		else
		
			echo "	backup " $myFile >> Backup.log
			#cp "$myFile" "$Dest" -r -u -p -v
			
		fi
		
	done

# Set the completion time of the backup
echo "Backup completed: $(date)" >> Backup.log
echo " " >> Backup.log
