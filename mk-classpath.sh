#!/bin/sh

if [ ! -e avian-classpath ]; then
    git clone https://github.com/javacommons/avian-2017-0322-2250.git avian-classpath
fi

if [ ! -e win32 ]; then
    git clone https://github.com/ReadyTalk/win32.git win32
fi

cd avian-classpath
#export JAVA_HOME="C:/Program Files/Java/jdk1.7.0_80"
export JAVA_HOME="Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image"
make
build/windows-i386/avian -cp build/windows-i386/test Hello
