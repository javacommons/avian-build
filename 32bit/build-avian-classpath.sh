rm -rf avian win32
git clone https://github.com/ReadyTalk/avian.git avian
git clone https://github.com/ReadyTalk/win32.git win32
cd avian
export JAVA_HOME="C:/Program Files/Java/jdk1.7.0_80"
make
build/windows-i386/avian -cp build/windows-i386/test Hello
