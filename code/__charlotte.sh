#!/bin/sh
set -ex

mkdir -p __build

export LUABIND_DIR=/usr/pkg
export FREETYPE_DIR=/usr/pkg

(
  cd __build && cmake \
    -DWITH_NEL=TRUE \
    -DWITH_NEL_TESTS=FALSE \
    -DWITH_SOUND=TRUE \
    -DWITH_RYZOM_CLIENT=TRUE \
    -DWITH_GUI=TRUE \
    ..
)

make -C __build -j4 

make -C __build install DESTDIR=/tmp/xxx
