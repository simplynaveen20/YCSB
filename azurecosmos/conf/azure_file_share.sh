if [ ! -z "$file_share_location" ] && [ ! -z "$storage_userame" ] && [ ! -z "$storage_password" ];then
  sudo mkdir /mnt/$file_share_location
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/$storage_userame.cred" ]; then
    sudo bash -c 'echo "username=$storage_userame" >> /etc/smbcredentials/$storage_userame.cred'
    sudo bash -c 'echo "password=$storage_password" >> /etc/smbcredentials/$storage_userame.cred'
fi
sudo chmod 600 /etc/smbcredentials/$storage_userame.cred

sudo bash -c 'echo "//$storage_userame.file.core.windows.net/$file_share_location /mnt/$file_share_location cifs nofail,vers=3.0,credentials=/etc/smbcredentials/$storage_userame.cred,dir_mode=0777,file_mode=0777,serverino" >> /etc/fstab'
sudo mount -t cifs //$storage_userame.file.core.windows.net/$file_share_location /mnt/$file_share_location -o vers=3.0,credentials=/etc/smbcredentials/$storage_userame.cred,dir_mode=0777,file_mode=0777,serverino
else
  echo elseBlock 
fi