#!/bin/sh
set -ex

mkdir -p __build

export LUABIND_DIR=/usr/pkg

(
  cd __build && cmake \
    -DWITH_NEL=TRUE \
    -DWITH_NEL_TESTS=FALSE \
    -DWITH_SOUND=FALSE \
    -DWITH_RYZOM_CLIENT=FALSE \
    -DWITH_GUI=TRUE \
    ..
)

make -C __build -j4 

    #-DWITH_3D=FALSE \
    #-DWITH_NEL_SAMPLES=FALSE \

# PATCHES IN
# - code/nel/include/nel/misc/types_nl.h
# - code/nel/src/misc/system_info.cpp
# - code/nel/src/misc/CMakeLists.txt
# - code/ryzom/tools/stats_scan/character_scan_job.cpp
#
# - code/nel/samples/net/udp/CMakeLists.txt <-- not necessary if
# WITH_NEL_SAMPLES=FALSE
# -
