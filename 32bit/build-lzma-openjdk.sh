rm -rf avian win32
git clone https://github.com/ReadyTalk/avian.git avian
git clone https://github.com/ReadyTalk/win32.git win32
cd avian
cp -p makefile makefile.orig
sed -i -e "s/i686-w64-mingw32-g++/g++/g" \
       -e "s/i686-w64-mingw32-gcc/gcc/g" \
       -e "s/i686-w64-mingw32-dlltool/dlltool/g" \
       -e "s/i686-w64-mingw32-ar/ar/g" \
       -e "s/i686-w64-mingw32-ranlib/ranlib/g" \
       -e "s/i686-w64-mingw32-strip/strip/g" \
       makefile
export PATH="/cygdrive/Z/media/mingw/mingw32/bin:${PATH}"
export JAVA_HOME="Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image"
make lzma=Z:/media/lzma/lzma920 \
     openjdk=Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image \
     openjdk-src=Z:/media/openjdk/jdk7u/jdk/src
build/windows-i386-lzma-openjdk-src/avian -cp build/windows-i386-lzma-openjdk-src/test Hello
