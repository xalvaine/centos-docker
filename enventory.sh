
re='^[0-9]+$'
if ! [[ ( $1 =~ $re ) || ( $2 =~ $re ) ]] ; then
   echo "error: Not a number" >&2
   exit 1
fi
mkdir -p /home/web_project/dev_staff
mkdir -p /home/web_project/des_staff
groupadd staff
groupadd developers
groupadd designers
n=$(($1))
m=$(($2))
useradd -d /home/web_project project_manager
echo "pm12345" | passwd project_manager --stdin
usermod -a -G staff project_manager
for (( i=1; i<=n; i++ ))
do
  useradd -d "/home/web_project/dev_user${i}" -e $(date -d '+30 days' '+%Y-%m-%d') "dev_user${i}"
  echo "dev${i}12345" | passwd "dev_user${i}" --stdin
  usermod -a -G staff "dev_user${i}"
  usermod -a -G developers "dev_user${i}"
  chage -W 3 -M -7 "dev_user${i}"
done
for (( i=1; i<=m; i++ ))
do
  useradd -d "/home/web_project/des_user${i}" -e $(date -d '+30 days' '+%Y-%m-%d') "des_user${i}"
  echo "des${i}12345" | passwd "des_user${i}" --stdin
  usermod -a -G staff "des_user${i}"
  usermod -a -G designers "des_user${i}"
  chage -W 3 -M -7 "des_user${i}"
done