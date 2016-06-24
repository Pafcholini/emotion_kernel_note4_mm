#!/system/bin/sh

# kernel custom test
if [ -e /data/emotiontest.log ]; then
	rm /data/emotiontest.log
fi

echo  Kernel script is working !!! >> /data/emotiontest.log
echo "excecuted on $(date +"%d-%m-%Y %r" )" >> /data/emotiontest.log
echo  Done ! >> /data/emotiontest.log

sync

# init.d
chmod 755 /system/etc/init.d/ -R
if [ ! -d /system/etc/init.d ]; then
mkdir -p /system/etc/init.d/;
chown -R root.root /system/etc/init.d;
chmod 777 /system/etc/init.d/;
else
/sbin/busybox run-parts /system/etc/init.d
fi;

sync

#Set default values on boot
echo "200000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
echo "600000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk

sync

