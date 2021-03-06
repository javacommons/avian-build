#!/bin/sh
wd=$(pwd)
export PATH="/cygdrive/Z/media/mingw/mingw32/bin:${PATH}"
export JAVA_HOME=Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image
export PATH="`cygpath -u $JAVA_HOME`/bin:${PATH}"
echo $PATH

rm -f *.o

ar x ../avian/build/windows-i386-openjdk-src/libavian.a
cp ../avian/build/windows-i386-openjdk-src/classpath.jar boot.jar

javac -bootclasspath boot.jar Hello.java
jar u0f boot.jar Hello.class

../avian/build/windows-i386-openjdk-src/binaryToObject/binaryToObject boot.jar \
     boot-jar.o _binary_boot_jar_start _binary_boot_jar_end windows i386

g++ -fno-exceptions -fno-rtti -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/win32" \
     -D_JNI_IMPLEMENTATION_ -c embedded-jar-main.cpp -o main.o

dlltool -z hello.def *.o
dlltool -d hello.def -e hello.exp
gcc hello.exp *.o -L../win32/lib -lmingwthrd -lm -lz -lws2_32 -lmswsock -lIphlpapi -mwindows -mconsole -o hello-fat.exe

./hello-fat.exe
