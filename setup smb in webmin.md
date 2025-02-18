# Reconfigure a RAID array / drop current storage, and remake RAID

1. If you have the RAID array setup for Samba/SMB, remove the current SMB config by go to "SAMBA Windows File Sharing" > select current samba config > Delete.
2. Unmount the drive by going to "Disk and Network Filesystems" > Save mount? = Don't save, Mount now? = Unmount.
3. Reboot the whole system, at "Bootup and Shutdown" > Scroll to bottom > "Reboot system" > confirm.
4. Relogin to Webmin, go to "Linux RAID" > Select current RAID > "Delete" > Confirm.

### Now RAID array has been deleted, let's say u have added new disk, let's configure the new disk/ wipe existing disk.
###### This situation given that you have initialized samba to grab the same folder name. If different/ start from scratch, please refer [setup samba in webmin.md]()

1. Go to "Partitions on Local Disk" > Select the new disk (or existing disk) > Select partitions > ...<br>
   1.1. If you only have one partition that take up full disk, just format to EXT.<br>
   1.2. Else if you have multiple paritions, delete the partitions, and initialize as one giant partition as EXT.
2. Do the same on the other disk drive.
3. Go to "Linux RAID" > Select RAID device level that is suitable for your setup.
4. Select partitions that you have initialized at step 1 > Create.
5. Select the newly created RAID > select mount to > enter in default mount path (example: `/mnt/<folder-name>`). Ideally folder name will be same as the SMB name you will configure later on.
6. ...

(more will update)
