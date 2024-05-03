echo "-----My ASCII terminal Image-----"
echo -e "\e[33m       /X \\ 
\e[32m    _------_
   /        \\
  |          |
  |          |
  |     __  __)
  |    /  \\/  \\
 /\\/\\ (o   )o  )
 /c    \\__/ --.
 \\_   _-------'
  |  /         \\
  | | '\\________)    
  |  \\_____) .............BARTTTTTTTTTTTT!!!!!!
  |_____ |
 |_____/\\/\\
 /        \\
\e[0m"

echo                "-----Workspace---"
usr=$(env | grep USERNAME | cut -d "=" -f 2)
shell=$(echo $SHELL)
virtual=$(hostnamectl | grep Virtualization | cut -d : -f 2)
vendor=$(hostnamectl | grep "Hardware Vendor" | cut -d : -f 2)
model=$(hostnamectl | grep "Hardware Model" | cut -d : -f 2)
icon=$(hostnamectl | grep "Icon name" | cut -d : -f 2)

echo   " User                 :$usr     "
echo   " Shell                :$shell   "
echo   " Virtualization       :$virtual "
echo   " Hardware Vendor      :$vendor  "
echo   " Hardware Model       :$model   "
echo   " Icon name            :$icon    "


echo                 "--------OS-------"
os=$(hostnamectl | grep "Operating System" | cut -d : -f 2)
kern=$(hostnamectl | grep "Kernel" | cut -d : -f 2)
arch=$(hostnamectl | grep "Architecture" | cut -d : -f 2)
rhp=$(cat /etc/os-release | grep "Red Hat Enterprise Linux 9" | cut -d = -f 2 | tr -d '"')

echo   " Operating System     :$os      "
echo   " Kernel               :$kern    "
echo   " Architecture         :$arch    "
echo   " Red Hat Product      : $rhp     "


echo                "--------CPU-------"
model=$(lscpu |grep "Model name" | cut -d : -f 2 | tr -s ' ' <<< "11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz")
virtual=$(lscpu | grep "Virtualization type" | cut -d : -f 2 | tr -s ' ' <<< "full")
hven=$(lscpu | grep "Hypervisor vendor" | cut -d : -f 2 | tr -s ' ' <<< "kvm")
byte=$(lscpu | grep Byte | cut -d : -f 2 | tr -s ' ' <<< "Little Endian")

echo   "  CPU Model           : $model     "
echo   "  Virtualization Type : $virtual   "
echo   "  Hypervisor Vendor   : $hven      "
echo   "  Byte Order          : $byte      "


echo               "-------Memory------"
mem=$(lsmem -a | grep "Memory block" | cut -d : -f 2 | tr -s ' ' <<< "128M")
online=$(lsmem -a | grep "online memory" | cut -d : -f 2 | tr -s ' ' <<< "4G")


echo   "  Memory Block Size   : $mem    "
echo   "  Online Memory       : $online "


echo               "-------Disk--------"
disk=$(lsblk | grep sda | grep disk | cut -d : -f 2 | tr -s ' ' <<< "80G")
part1=$(lsblk | grep sda | grep "part /boot" | cut -d : -f 2 | tr -s ' ' <<< "1G")
part2=$(lsblk | grep sda | grep "part" | cut -d : -f 2 | tr -s ' ' <<< "79G")

echo   "  Disk Size           : $disk  "
echo   "  Boot Volume         : $part1 "
echo   "  Partition           : $part2 "

echo               "-----Network-------"
device1=$(inxi --full | grep "Device-1" | tr -s ' ' <<< "Intel 82540EM Gigabit Ethernet")
spd=$(inxi --full | grep "speed" | tr -s ' ' <<< "1000Mbps")
static=$(hostnamectl | grep Static | cut -d : -f 2)
ipv4=$(curl -4 ifconfig.me 2>/dev/null)
host=$(cat /etc/hosts | grep localhost | tr -s ' ' <<< "127.0.0.1")

echo   "  Network Adapter     : $device1 "
echo   "  Network Speed       : $spd     "
echo   "  Static Host Name    :$static     "
echo   "  Public IP           : $ipv4    "
echo   "  Local Host          : $host    "