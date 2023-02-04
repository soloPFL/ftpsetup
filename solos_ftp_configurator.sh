#!/bin/bash


config_file="/etc/vsftpd.conf"
shared_folder="/var/ftp/shared"

# Remove existing vsftpd configuration file
sudo rm -f $config_file


# Create shared folder if it doesn't exist
if [ ! -d "$shared_folder" ]; then
  sudo mkdir "$shared_folder"
fi

# Setze die Berechtigungen für den gemeinsamen Ordner
sudo chmod 775 "$shared_folder"
sudo chown nobody "$shared_folder"
sudo chgrp nogroup "$shared_folder"

# Create the configuration file
sudo echo "listen=YES" > "$config_file"
sudo echo "local_enable=YES" >> "$config_file"
sudo echo "write_enable=YES" >> "$config_file"
sudo echo "local_umask=022" >> "$config_file"
sudo echo "dirmessage_enable=YES" >> "$config_file"
sudo echo "use_localtime=YES" >> "$config_file"
sudo echo "xferlog_enable=YES" >> "$config_file"
sudo echo "connect_from_port_20=YES" >> "$config_file"
sudo echo "secure_chroot_dir=/var/run/vsftpd/empty" >> "$config_file"
sudo echo "pam_service_name=vsftpd" >> "$config_file"
sudo echo "rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem" >> "$config_file"
sudo echo "rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key" >> "$config_file"
sudo echo "local_root=$shared_folder" >> "$config_file"
sudo echo "chroot_local_user=YES" >> "$config_file"

# Restart vsftpd service to apply changes
sudo systemctl restart vsftpd
