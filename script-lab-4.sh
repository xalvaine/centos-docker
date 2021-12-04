if [ "$(whoami)" != "root" ]; then
  echo "You must be a root"
  exit 0
fi

for user in 'ls /home'; do
  if [ $user != "lost+found" ]; then
    user_name=$user
  fi
done

backup_dir=/home/$user_name/.backup

#enable file editing
chattr -i $backup_dir/*
#enable reading from directory for everyone
chmod ugo-r $backup_dir/*

# replaced sysconfig and etc directory by backup files
cp $backup_dir/network /etc/sysconfig
cp $backup_dir/resol.conf /etc/

# replaced ifconfig files by backup files
for config in 'ls $backup_dir/ifcfg-*'; do
  cp $config /etc/sysconfig/network-scripts
done

systemctl restart NetworkManager.service