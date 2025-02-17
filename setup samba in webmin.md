# Samba setup guarantee work (definitive edition)
1. Kat pane tepi, search "Samba Windows File Sharing".
2. Kat global configuration, tekan Windows Networking.
3. Server description = none, letak server name vault-1.
4. Security = user level
5. Save, dia akan back ke page sebelumnya.
6. Tekan Authentication.
7. Use encrypted password = no.
8. Save, dia akan back ke page sebelumnya.
9. Tekan "file share defaults".
10. Then tekan "security and Access Control".
11. Writable? = yes.
12. Tekan save, dia akan back ke page "share information".
13. Directory to share, tekan tepi tu, then select the folder you want to share.
14. Available? = yes, Browsable? = yes.
15. Save. Dia akan back ke page sebelumnya.
16. On page sama, tekan "Create a New File Share".
17. Share name = vault-1
18. Directory to share, tekan tepi tu, then select the folder you want to share.
19. Auto create directory = yes
20. Create with owner & create with group = (set owner yg ada samba access, jgn set lain, nnti dia akan permission issue)
21. Tekan Create.
22. Dia akan back ke page asal. Now, tekan "Convert Users".
23. On unix users to convert, tekan "Only listed users or UID ranges", then set to your current user.
24. Then tekan "convert users".
25. Now, kat pane tepi, go to System > Bootup and Shutdown.
26. Restart smbd.service.

## Access the Share from Windows:
1. On your Windows PC, open File Explorer.
2. In the address bar, type \\<server-ip>\shared (replace <server-ip> with your server's IP address).
3. Enter the Samba username and password when prompted.
4. You should now have access to the shared directory.

## Kalau ada smbd.service startup issue:
Run the following command to check for any syntax errors:
```bash
testparm
```
Kalau error adalah:
```
lpcfg_do_global_parameter: WARNING: The "encrypt passwords" option is deprecated
WARNING: Ignoring invalid value 'share' for parameter 'security'
Error loading services.
```
Perlu buat changes kt `smb.conf`. Bukak terminal, enter in
```sudo nano /etc/samba/smb.conf```

Look for the line `encrypt passwords = yes`. Comment it out by adding a `#` in front of it.
Look for the line `security = share`. change it to `security = user`.

Ctrl-X, Y, Enter.

Now, kat pane tepi, go to System > Bootup and Shutdown.

Restart smbd.service.

## Kalau ada permission issue:

```sudo chown -R your_user:your_group /path/to/shared-folder```

Replace `your_user` and `your_group` with the correct user and group. Normally dia sama.
