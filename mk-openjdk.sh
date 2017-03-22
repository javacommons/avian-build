#!/bin/sh

if [ ! -e avian-openjdk ]; then
    git clone https://github.com/javacommons/avian-2017-0322-2250.git avian-openjdk
fi

if [ ! -e win32 ]; then
    git clone https://github.com/ReadyTalk/win32.git win32
fi

cd avian-openjdk

export JAVA_HOME="Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image"
make openjdk=Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image \
     openjdk-src=Z:/media/openjdk/jdk7u/jdk/src
build/windows-i386-openjdk-src/avian -cp build/windows-i386-openjdk-src/test Hello
