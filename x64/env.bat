
set PATH=C:\Windows;C:\Windows\system32
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

SET PATH=C:\Perl64\bin;C:\Python27;J:\#get\jom;%PATH%
SET INCLUDE=J:\openssl-x64\include;%INCLUDE%
SET LIB=J:\openssl-x64\lib;%LIB%

set _ROOT=%~dp0
set PATH=%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;%PATH%
SET PATH=%_ROOT%\qtrepotools\bin;%PATH%

set QMAKESPEC=win32-msvc

cd /d %_ROOT%

set _ROOT=