echo
echo "Дата и время составления отчета: $(date)"
echo "Пользователь, сгенерировавший отчет: $(whoami)"
echo "Имя хоста: $(uname -n)"
echo "Название ядра: $(uname -s)"
echo "Версия ядра: $(uname -r)"
echo "Версия операционной системы: $(source /etc/os-release; echo $NAME $VERSION)"
echo "Модель процессора:$(lscpu | grep "Model name" | tr -s ' ' | cut -d":" -f 2)"
echo "Частота процессора:$(lscpu | grep "CPU MHz" | tr -s ' ' | cut -d":" -f 2)"
echo "Объем физической памяти:$(lshw -c memory | grep size | cut -d":" -f 2)"
echo "Название модели материнской платы:"
echo "Версию и дату выпуска BIOS:"
echo "Перечень всех устройств, подключённых к шине PCI:
$(lspci)"
echo
