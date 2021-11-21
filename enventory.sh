
re='^[0-9]+$'
if ! [[ ( $1 =~ $re ) || ( $2 =~ $re ) ]] ; then
   echo "error: Not a number" >&2
   exit 1
fi
mkdir -p /home/web_project/dev_staff
mkdir -p /home/web_project/des_staff
getent group staff || groupadd staff
getent group developers || groupadd developers
getent group designers || groupadd designers
n=$(($1))
m=$(($2))
useradd -d /home/web_project project_manager
project_manager:pm12345 | chpasswd
for i in {1..n}
do
  useradd -d /home/web_project dev_user$(i)
  dev$(i)12345 | passwd dev_user$(i) --stdin
  usermod -a -G staff dev_user$(i)
  usermod -a -G developers dev_user$(i)
done
for i in {1..m}
do
  useradd -d /home/web_project des_user$(i)
  des$(i)12345 | passwd des_user$(i) --stdin
  usermod -a -G staff des_user$(i)
  usermod -a -G developers des_user$(i)
done