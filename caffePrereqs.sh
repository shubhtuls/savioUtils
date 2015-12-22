#!/bin/bash -i

module load gcc/4.4.7
module load cmake/3.2.2
packageDir=/global/home/users/shubhtuls/packages

## glog
target="glog"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz
	tar zxvf glog-0.3.3.tar.gz
	cd glog-0.3.3
	./configure --prefix=/global/home/users/shubhtuls/local/
	make && make install
fi

## gflags
target="gflags"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	wget https://github.com/schuhschuh/gflags/archive/master.zip
	unzip master.zip
	cd gflags-master
	mkdir build && cd build
	export CXXFLAGS="-fPIC"
	cmake -DCMAKE_INSTALL_PREFIX=install ..
	make VERBOSE=1
	make && make install
	cp -r ./install/* /global/home/users/shubhtuls/local/
fi

## protobuf
target="protobuf"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	git clone https://github.com/google/protobuf.git
	cd protobuf
	./autogen.sh
	./configure --prefix=/global/home/users/shubhtuls/local/
	make -j 8
	make check
	make install
fi

## lmdb
target="lmdb"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	git clone https://github.com/LMDB/lmdb
	cd lmdb/libraries/liblmdb
	sed -i 's/\/usr\/local/\/global\/home\/users\/shubhtuls\/local/g' Makefile
	make && make install
fi

## snappy
target="snappy"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	git clone https://github.com/google/snappy.git
	cd snappy
	bash ./autogen.sh
	./configure --prefix=/global/home/users/shubhtuls/local/
	make && make install
fi

## leveldb
target="leveldb"
if [ "$1" = "all" -o "$1" = "$target" ]; then
	cd "$packageDir"
	git clone https://github.com/google/leveldb.git
	cd leveldb
	sed -i 's/PLATFORM_LDFLAGS)/PLATFORM_LDFLAGS) -L \/global\/home\/users\/shubhtuls\/local\/lib/g' Makefile
	make
	cp --preserve=links libleveldb.* /global/home/users/shubhtuls/local/lib/
	cp -r include/leveldb /global/home/users/shubhtuls/local/include
fi
