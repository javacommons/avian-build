setlocal
set SCRIPT=%~0
for /f "delims=\ tokens=*" %%z in ("%SCRIPT%") do (
  set SCRIPT_CURRENT_DIR=%%~dpz
)

set CYG_NAME=32bit-cyg
set CYG_ROOT=%SCRIPT_CURRENT_DIR%%CYG_NAME%
set CYG_PKG=%CYG_ROOT%\pkg
set CYG_SITE=http://mirrors.kernel.org/sourceware/cygwin/

mkdir %CYG_PKG%
setup-x86.exe -q -W --packages="binutils,cmake,git,make,mercurial,mingw64-i686-gcc-g++,mingw64-x86_64-gcc-g++,unzip,wget,zip" --root="%CYG_ROOT%" --local-package-dir="%CYG_PKG%" --no-shortcuts --site=%CYG_SITE%

if exist "%CYG_ROOT%\Cygwin.bat" move "%CYG_ROOT%\Cygwin.bat" "%CYG_ROOT%\Cygwin @%CYG_NAME%.bat"
"%CYG_ROOT%\bin\bash.exe" -l -c "sed -i -e 's/0;[\]w[\]a/0;%CYG_NAME% \\\\w\\\\a/g' -e 's/[\]u@[\]h/\\\\u@%CYG_NAME%/g' /etc/bash.bashrc"

endlocal
pause
