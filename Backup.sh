#!/bin/bash

#Author:		Shawn (fitz24)
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

# Set the source directory to the home drive. Replace "~/*" with "/home/homedrivename/*"
Source="~/*"

# Set the destination directory to the truecrypt directory "/media/truecrypt1" which is its default mount point
Dest="/media/truecrypt1"

# Set what directories to exclude from the backup
ExcludeDirs=("~/ExcludeDir1" "~/ExcludeDir2")

Backup="True"

# Inform of what we are doing
echo "Starting backup of $Source to $Dest"
echo "This may take a very long time"

# Set the start time of the backup
echo "Started backup: $(date)" >> Backup.log

# Loop the directories and files in the source directory
for myFile in $Source

	do

		Backup="True"

		#Loop the ExcludeDirs array
		for myExclude in "${ExcludeDirs[@]}"

			do

				if [ "$myFile" = "$myExclude" ]; then

					#Folder matched, do not backup this file/folder
					Backup="False"

					echo "	Skipping " $myFile >> Backup.log

					break

				fi
				
			done

			#if the folder did not match in the exclude list, Backup will = true
			if [ $Backup = "True" ]; then

				echo "	Backup " $myFile >> Backup.log
				cp "$myFile" "$Dest" -r -u -p -v

			fi

	done

# Set the completion time of the backup
echo "Backup completed: $(date)" >> Backup.log
echo " " >> Backup.log
