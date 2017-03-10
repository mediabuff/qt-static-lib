# Qt-Static-Library
Statically built library archive of Qt framework opensource version.

License
===
Qt uses LGPL. Be careful if you use this static library.

How to Use
===

Install & Check
---
Download from Release page, usage will be there.

You can run `bin/qmake.exe -v` to get the build prefix.

Compile Dependency
---
System libs:
```
kernel32.lib
user32.lib
gdi32.lib
Advapi32.lib
Shell32.lib
Ole32.lib
Ws2_32.lib
opengl32.lib
Imm32.lib
Winmm.lib
```
Qt libs (add 'd' to use debug version):
```
qtmain.lib
Qt5Core.lib
Qt5Gui.lib
Qt5Widgets.lib
qtpcre.lib
qtharfbuzzng.lib
Qt5PlatformSupport.lib
qwindows.lib
qtfreetype.lib
```
Qt lib dir: `$(QTDIR)\lib;$(QTDIR)\plugins\platforms;`

Add this two line in your code:
```C++
#include <QtPlugin>
Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin)
```

You can only do cross compile for Windows XP in new system; you cannot use qmake.exe in Windows XP.

How this Qt Compiled
===

Download Qt source code via Git.
```shell
git clone https://code.qt.io/qt/qt5.git qt5
cd qt5
git checkout v5.8.0
cp init-repository ../
git checkout v5.6.2
cp ../init-repository .
perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine -f
```

Modify configs in `qtbase/mkspecs/common/msvc-desktop.conf`:
```Makefile
DEFINES                += _USING_V110_SDK71_
QMAKE_CFLAGS_RELEASE    = -O2 -MT
QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -MT -Zi
QMAKE_CFLAGS_DEBUG      = -Zi -MTd
QMAKE_LFLAGS_CONSOLE    = /SUBSYSTEM:CONSOLE,5.01
QMAKE_LFLAGS_WINDOWS    = /SUBSYSTEM:WINDOWS,5.01
```

Run `doconf.bat`.

Build.

Reference
===
http://www.cnblogs.com/superbi/p/5672049.html (Chinese)

History
===
* `2017-03-10 -> Qt v5.6.2 for MSVC 1910`
* `2016-08-16 -> Qt v5.7.0 for MSVC 1900`
