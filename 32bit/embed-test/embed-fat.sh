#!/bin/sh
wd=$(pwd)
export JAVA_HOME="/cygdrive/Z/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image"
export PATH="$JAVA_HOME/bin:${PATH}"
echo $PATH

rm -f *.o

i686-w64-mingw32-ar x ${wd}/../avian/build/windows-i386-openjdk-src/libavian.a
cp ${wd}/../avian/build/windows-i386-openjdk-src/classpath.jar boot.jar

javac -bootclasspath boot.jar Hello.java
jar u0f boot.jar Hello.class

${wd}/../avian/build/windows-i386-openjdk-src/binaryToObject/binaryToObject boot.jar \
     boot-jar.o _binary_boot_jar_start _binary_boot_jar_end windows i386

i686-w64-mingw32-g++ -fno-exceptions -fno-rtti -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/win32" \
     -D_JNI_IMPLEMENTATION_ -c embedded-jar-main.cpp -o main.o

i686-w64-mingw32-dlltool -z hello.def *.o
i686-w64-mingw32-dlltool -d hello.def -e hello.exp
i686-w64-mingw32-gcc hello.exp *.o -L${wd}/../win32/lib -lmingwthrd -lm -lz -lws2_32 -lmswsock -lIphlpapi -mwindows -mconsole -o hello-fat.exe

./hello-fat.exe
