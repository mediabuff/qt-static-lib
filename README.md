# Qt-Static-Library
*Languages: [English](README.md), [简体中文](README.zh-cn.md), [正體中文](README.zh-tw.md), [日本語](README.ja.md).*

Statically built library archive of Qt framework opensource version.

License
===
Qt uses LGPL. Be careful if you use this static library.

How to Use
===
Download from Release page. Extract all packages to `D:\`.
If you don't have `D:` drive, you can make a VHD to get a `D:` drive.

The OpenSSL library is treated as system library when compiling Qt.
It has no location dependency; you can add OpenSSL library into your project inc/lib dirs, or copy them into Qt dirs.

You can only do cross compile for Windows XP in new x64 systems, which installed VS2017 in default directory; you cannot use qmake.exe in Windows XP.


I want to compile it myself
===

Download Qt source code via git. Checkout version and configure.
```shell
git clone https://code.qt.io/qt/qt5.git qt5
cd qt5
git checkout v5.8.0
cp init-repository ../
git checkout v5.6.2
cp ../init-repository .
perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine -f
```

Modify configs in `qtbase/mkspecs/common/msvc-desktop.conf` like this:
```Makefile
# Enable utf-8 for MSVC1900+
QMAKE_CFLAGS           += -utf-8
# Use Windows XP SDK
DEFINES                += _USING_V110_SDK71_
# Use static CRT multi-thread library
QMAKE_CFLAGS_RELEASE    = -O2 -MT
QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -MT -Zi
QMAKE_CFLAGS_DEBUG      = -Zi -MTd
# Generate Windows XP based PE format
QMAKE_LFLAGS_CONSOLE    = /SUBSYSTEM:CONSOLE,5.01
QMAKE_LFLAGS_WINDOWS    = /SUBSYSTEM:WINDOWS,5.01
```

Run `doconf.bat`.

Run `nmake /nologo` to build.

Reference
===
* https://wiki.qt.io/Building_Qt_5_from_Git
* http://www.cnblogs.com/superbi/p/5672049.html (Chinese)

History
===
* `2017-04-26 -> Qt v5.6.2 for MSVC 1910 fix`
* `2017-03-10 -> Qt v5.6.2 for MSVC 1910`
* `2016-08-16 -> Qt v5.7.0 for MSVC 1900`

