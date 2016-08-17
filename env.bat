
set PATH=C:\Windows;C:\Windows\system32
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat" x86

SET PATH=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Bin;%PATH%
SET INCLUDE=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include;%INCLUDE%
SET LIB=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Lib;%LIB%
SET CL=/D_USING_V110_SDK71_;%CL%

SET PATH=C:\Perl64\bin;C:\Python27;%PATH%

set _ROOT=D:\qt5
set PATH=%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;%PATH%
SET PATH=%_ROOT%\qtrepotools\bin;%PATH%
set QMAKESPEC=win32-msvc2015
set _ROOT=

cd /d D:\qt5
