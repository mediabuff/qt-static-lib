
set PATH=C:\Windows;C:\Windows\system32
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

SET PATH=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Bin;%PATH%
SET INCLUDE=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include;%INCLUDE%
SET LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Lib;%LIB%

SET PATH=C:\Perl64\bin;C:\Python27;%PATH%

set _ROOT=%~dp0
set PATH=%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;%PATH%
SET PATH=%_ROOT%\qtrepotools\bin;%PATH%

@rem Add OpenSSL dir to compiler env, treat them as system libraries.
set INCLUDE=D:\openssl-x86-xp\include;%INCLUDE%
set LIB=D:\openssl-x86-xp\lib;%LIB%

@rem Just use 2015 when compile Qt5.6 with 2017
set QMAKESPEC=win32-msvc2015

cd /d %_ROOT%

set _ROOT=
