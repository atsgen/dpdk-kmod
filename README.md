# Install dpdk kmod on a machine

make sure you have installed kernel headers

Centos
  ~~~
  sudo yum install kernel-devel-$(uname -r)
  ~~~
or
Ubuntu
  ~~~
  sudo apt-get install linux-headers-$(uname -r)
  ~~~

from this directory you can directly install kmod using
  ~~~
  sudo ./scripts/install.sh
  ~~~
which then can be loaded using modprobe

# Install dpdk kmod using container images

Centos
   ~~~
   sudo docker run -v /usr/src:/usr/src -v /lib/modules/:/lib/modules/ --name dpdk-build -it atsgen/igb-uio-centos:latest
   ~~~
Ubuntu
   ~~~
   sudo docker run -v /usr/src:/usr/src -v /lib/modules/:/lib/modules/ --name dpdk-build -it atsgen/igb-uio-ubuntu:latest
   ~~~
