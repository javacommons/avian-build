rm -rf avian win32
git clone https://github.com/ReadyTalk/avian.git avian
git clone https://github.com/ReadyTalk/win32.git win32
cd avian
export JAVA_HOME="C:/Program Files/Java/jdk1.7.0_80"
make openjdk=$(pwd)/../openjdk-1.7.0-u80-unofficial-windows-i586-image openjdk-src=$(pwd)/../jdk7u/jdk/src test
build/windows-i386-openjdk-src/avian -cp build/windows-i386-openjdk-src/test Hello
