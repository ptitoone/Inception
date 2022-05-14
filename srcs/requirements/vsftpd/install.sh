#!/bin/sh

# Install dependecies and create directories
apk update;
apk add --no-cache vsftpd tini;
mkdir -p /var/run/vsftpd/empty;
chmod -xw /var/run/vsftpd/empty;

# Create FTP users
adduser -D -h /home/${WP_FTP_USER_NAME} ${WP_FTP_USER_NAME} ${WP_FTP_USER_NAME};
adduser -D -h /home/${AD_FTP_USER_NAME} ${AD_FTP_USER_NAME} ${AD_FTP_USER_NAME};
adduser -D -h /home/${ST_FTP_USER_NAME} ${ST_FTP_USER_NAME} ${ST_FTP_USER_NAME};
echo "${WP_FTP_USER_NAME}:${WP_FTP_USER_PASS}" | chpasswd;
echo "${AD_FTP_USER_NAME}:${AD_FTP_USER_PASS}" | chpasswd;
echo "${ST_FTP_USER_NAME}:${ST_FTP_USER_PASS}" | chpasswd;


# Populate VSFTPD configuration file
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf;
echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf;
echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf;
echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf;
echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf;
echo "passwd_chroot_enable=yes" >> /etc/vsftpd/vsftpd.conf;
echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf;
echo 'pasv_enable=Yes' >> /etc/vsftpd/vsftpd.conf;
echo 'pasv_max_port=10100' >> /etc/vsftpd/vsftpd.conf;
echo 'pasv_min_port=10090' >> /etc/vsftpd/vsftpd.conf;
sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf;

# Remove install files
rm /tmp/*;

