# Qt-Static-Library
Statically built library archive of Qt framework opensource version.

License
===
Qt uses LGPL. Be careful if you use this static library.

How to Use
===
Install
---
Download from Release page, unpack to `D:\Qt57-VS2015`.

You can run `bin/qmake.exe -v` to get the build prefix.

Build/Install environment:

* Windows 10 Enterprise S 10240
* Visual Studio 2015 Update 3 (MSVC 1900)
* Windows XP target (SDK v7.1A)
* Source dir: `D:\qt5`
* Prefix dir: `D:\Qt57-VS2015`

Hope it will work on your PC. :)

Dependency
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
How Compiled
===
Download Qt source code.

Download this repo and merge configs in the two files:

* `qtbase/mkspecs/common/msvc-desktop.conf`
* `qtbase/qmake/Makefile.win32`

Build.

Reference
===
http://www.cnblogs.com/superbi/p/5672049.html (Chinese)

History
===
* `2016-08-16 08:30 ~ 15:40 (CST) -> Qt v5.7.0`
