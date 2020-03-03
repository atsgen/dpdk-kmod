#!/bin/bash

templ=$(cat ${HOME}/src/dkms.conf.tmpl)
content=$(eval "echo \"$templ\"")
echo "$content" > $HOME/src/dkms.conf
cp -r ${HOME}/src /usr/src/igb_uio-${version}
dkms --verbose add -m igb_uio -v "${version}"
dkms --verbose build -m igb_uio -v "${version}"
dkms --verbose install -m igb_uio -v "${version}"
depmod -a
