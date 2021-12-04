mkdir for_backup
touch for_backup/file{1..3}
mkdir backup
mkdir for_restore

cd backup
#create archive with diff between for_backup and backup directory
tar -cpvzf full_backup.tar.gz.0 -g backup.snap ../for_backup

touch ../for_backup/file4

#create copy of backup.snap
cp backup.snap backup.snap.1
#create archive with diff between for_backup and backup.snap
tar -cpvzf diff_backup.tar.gz.1 -g backup.snap.1 ../for_backup
cat backup.snap.1

touch ../for_backup/file5

#create copy of backup.snap
cp backup.snap.1 backup.snap.2
#create archive with diff between for_backup and backup.snap.1
tar -cpvzf diff_backup.tar.gz.2 -g backup.snap.2 ../for_backup
cat backup.snap.2

touch ../for_backup/file6

#create copy of backup.snap
cp backup.snap.2 backup.snap.3
#create archive with diff between for_backup and backup.snap
tar -cpvzf diff_backup.tar.gz.3 -g backup.snap.3 ../for_backup
cat backup.snap.3

cd ..
#unarchive first backup to for_restore directory
tar -xvf backup/full_backup.tar.gz.0 -G -C for_restore

for i in {1..3}; do
  tar -xvf backup/diff_backup.tar.gz.$i -G -C for_restore
done

echo "Files for backup"
ls for_backup
echo "Files from backups"
ls for_restore/for_backup
