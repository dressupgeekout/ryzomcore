#!/bin/sh
set -ex

prefix=/tmp/xxx/usr/local

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${prefix}/lib:${prefix}/lib/nel:/usr/pkg/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/X11R7/lib
export PATH=${prefix}/bin:${prefix}/games:${prefix}/sbin:${PATH}

cp /tmp/xxx/usr/local/etc/ryzom/client_default.cfg /tmp/xxx/usr/local/games

(cd /tmp/xxx/usr/local/games && gdb ./ryzom_client)

#(for x in /tmp/xxx/usr/local/bin/* /tmp/xxx/usr/local/games/*; do 
#  ldd $x 2>&1 | grep -- -l
#done) | sort | uniq
