




pkg update && pkg upgrade
pkg install python git unzip wget
pip install flask flask_cors

----------------------------------------------------
pkg update && pkg upgrade -y
pkg install openssh wget curl git -y

----------------------------------------------------
#fs.sh
chmod +x fs.sh
bash fs.sh
----------------------------------------------------
/storage/emulated/0/T 
----------------------------------------------------
nano ~/.bashrc
----------------------------------------------------
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
----------------------------------------------------

filebrowser -r /storage/emulated/0/T/ -p 9090 --address 0.0.0.0
ssh -R 80:localhost:8080 nokey@localhost.run

filebrowser config set --auth.method basic
filebrowser users add raj raj@123456789 --perm.admin
-----------------------------------------------------
npm install -g localtunnel
lt --port 9090
-----------------------------------------------------
ssh -R 80:localhost:9090 nokey@localhost.run
dos2unix tunnel.sh
bash tunnel.sh


--------------------------------------------------------------------------

========

on ip show Device 🌐 IP
and when not select and enter any command start command
and when Start 3 show url  with Device ip
when Starting 6
first run
dos2unix tunnel.sh
and 2nd run
bash tunnel.sh
and when select 3 and 6 show all live logs
...

========
 clear
echo -e "\e[1;32m"
figlet -f slant "RAJ PANEL"
echo -e "\e[0m"

# Wi-Fi IP
WIFI_IP=$(ip addr show wlan0 2>/dev/null | awk '/inet / {print $2}' | cut -d/ -f1)
# Mobile IP (non-wlan0, non-lo)
MOBILE_IP=$(ip addr | awk '/inet / && $NF !~ /^(lo|wlan0)$/ {print $2}' | cut -d/ -f1 | head -n1)
# Preferred device IP
DEVICE_IP=${WIFI_IP:-$MOBILE_IP}

# ✅ Fetch Device IP (Wi-Fi/Mobile fallback)
DEVICE_IP1=$(ip addr | awk '/inet / && $2 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/ && $NF != "lo" {print $2}' | cut -d/ -f1 | head -n1)

# ✅ Olgs
LOGFILE="/data/data/com.termux/files/home/.filebrowser.log"

echo "============================================================"
echo " 📂 File: /storage/emulated/0/T/Web/s.py"
echo " 📁 Root: /storage/emulated/0/T/"
echo " 📅 Date: $(date)"
echo "============================================================"
echo " 🌐 IP (Wi-Fi): ${WIFI_IP:-Not Connected}"
echo " 🌐 IP (Mobile): ${MOBILE_IP:-Not Connected}"
echo " 🌐 IP (Used): ${DEVICE_IP:-Not Found}"
echo " 🌐 IP (DEVICE): ${DEVICE_IP1:-Not Found}"
echo "============================================================"
echo "============================================================"
echo
echo "[1] 🚀 Start Python Web Server"
echo "[2] 📁 Open T Folder"
echo "[3] 💻 Launch VSCode File Manager with Logs"
echo "[4] 🔁 Reload Termux"
echo "[5] 🌍 Start Tunnel (FileBrowser + localhost.run)"
echo "[6] 🔗 SSH Tunnel Only"
echo "[7] 🧩 FileBrowser Only (no log, no tunnel)"
echo "[0] ❌ Exit"
echo
read -t 10 -p "Choose Option (default = 3): " opt
opt=${opt:-3}

case $opt in
  1)
    echo "🚀 Starting Python server (s.py)..."
    cd /storage/emulated/0/T/Web/
    python s.py
    ;;
  2)
    echo "📁 Opening folder: /storage/emulated/0/T/"
    cd /storage/emulated/0/T/
    ls -al
    ;;
  3)
    echo "💻 Launching FileBrowser with logging..."
    echo "" > "$LOGFILE"
    filebrowser -r /storage/emulated/0/T/ \
                -p 9090 \
                --address 0.0.0.0 \
                --log "$LOGFILE" &
    sleep 2
    echo "=========================================="
    echo "🔗 URL: http://$DEVICE_IP:9090"
    echo "=========================================="
    echo "📊 Real-time FileBrowser Logs:"
    tail -f "$LOGFILE"
    ;;
  4)
    exec bash
    ;;
  5)
    echo "🌍 Starting FileBrowser + Tunnel..."
    echo "" > "$LOGFILE"

    filebrowser -r /storage/emulated/0/T/ -p 9090 --address 0.0.0.0 --log "$LOGFILE" &
    FB_PID=$!

    ssh -R 80:localhost:9090 nokey@localhost.run &
    SSH_PID=$!

    trap "echo 🔻 Shutting down...; kill $FB_PID $SSH_PID" SIGINT
    wait
    ;;
  6)
    echo "🔗 Creating public tunnel only..."
    ssh -R 80:localhost:9090 nokey@localhost.run
    ;;
  7)
    echo "🧩 Launching basic FileBrowser..."
    filebrowser -r /storage/emulated/0/T/ -p 9090 --address 0.0.0.0 &
    sleep 2
    echo "=========================================="
    echo "🔗 URL: http://$DEVICE_IP:9090"
    echo "=========================================="
    ;;
  0)
    exit
    ;;
  *)
    echo "❌ Invalid option"
    ;;
esac

========
========
========
========
========
========
========
========
========
========
========
========
========
========
========







================
/storage/emulated/0/T 

nano ~/.bashrc

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

filebrowser -r /storage/emulated/0/T/ -p 9090

npm install -g localtunnel
lt --port 9090
