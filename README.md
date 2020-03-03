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
  ./scripts/install.sh
  ~~~
which then can be loaded using modprobe
