setlocal
set SCRIPT=%~0
for /f "delims=\ tokens=*" %%z in ("%SCRIPT%") do (
  set SCRIPT_CURRENT_DIR=%%~dpz
)

set CYG_NAME=32bit-w64
set CYG_ROOT=%SCRIPT_CURRENT_DIR%%CYG_NAME%
set CYG_PKG=%CYG_ROOT%\pkg
set CYG_SITE=http://mirrors.kernel.org/sourceware/cygwin/

mkdir %CYG_PKG%
setup-x86.exe -q -W --packages="cmake,git,make,mercurial,unzip,wget,zip" --root=%CYG_ROOT% --local-package-dir=%CYG_PKG% --no-shortcuts --site=%CYG_SITE%

endlocal
pause
