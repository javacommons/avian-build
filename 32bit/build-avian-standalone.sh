rm -rf avian win32
git clone https://github.com/ReadyTalk/avian.git avian
git clone https://github.com/ReadyTalk/win32.git win32
cd avian
#export JAVA_HOME="C:/Program Files/Java/jdk1.7.0_80"
export JAVA_HOME="Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image"
make openjdk=Z:/media/openjdk/openjdk-1.7.0-u80-unofficial-windows-i586-image \
     openjdk-src=Z:/media/openjdk/jdk7u/jdk/src
build/windows-i386-openjdk-src/avian -cp build/windows-i386-openjdk-src/test Hello
