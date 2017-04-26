# Qt-Static-Library
*Languages: [English](README.md), [简体中文](README.zh-cn.md), [正體中文](README.zh-tw.md), [日本語](README.ja.md).*

开源版 Qt 的静态库。

协议
===
Qt 使用 LGPL，在使用此静态库时请确保不会违反 LGPL 协议。

如何使用
===
在 Release 页面下载压缩包，并解压到 `D:\`。
如果没有 `D:` 盘，您可能需要创建一个虚拟硬盘（VHD）来分配这个盘符。

在编译 Qt 的过程中，OpenSSL 库被当成系统自带的库来处理。因此没有路径依赖。
在使用 Qt 的时候，您可以把 OpenSSL 库放在项目的包含目录，或者直接复制到 Qt 的目录内部。

这套静态库只能在以默认路径安装了 VS2017 的 64 位系统内为 Windows XP 进行交叉编译。您无法在 Windows XP 下执行 qmake 等工具。

我想自己编译
===

首先通过 git 下载 Qt 的源码。切换版本并配置。
```shell
git clone https://code.qt.io/qt/qt5.git qt5
cd qt5
git checkout v5.8.0
cp init-repository ../
git checkout v5.6.2
cp ../init-repository .
perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine -f
```

如此这般修改 `qtbase/mkspecs/common/msvc-desktop.conf`：
```Makefile
# 为 MSVC1900+ 版本的编译器启用 utf8 支持
QMAKE_CFLAGS           += -utf-8
# 定义变量以使用 Windows XP SDK
DEFINES                += _USING_V110_SDK71_
# 静态链接 CRT 多线程库
QMAKE_CFLAGS_RELEASE    = -O2 -MT
QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -MT -Zi
QMAKE_CFLAGS_DEBUG      = -Zi -MTd
# 输出 Windows XP 兼容的 PE 格式
QMAKE_LFLAGS_CONSOLE    = /SUBSYSTEM:CONSOLE,5.01
QMAKE_LFLAGS_WINDOWS    = /SUBSYSTEM:WINDOWS,5.01
```

执行 `doconf.bat`。

执行 `nmake /nologo`，开始构建。

参考
===
https://wiki.qt.io/Building_Qt_5_from_Git
http://www.cnblogs.com/superbi/p/5672049.html

构建历史
===
* `2017-04-26 -> Qt v5.6.2 for MSVC 1910 fix`
* `2017-03-10 -> Qt v5.6.2 for MSVC 1910`
* `2016-08-16 -> Qt v5.7.0 for MSVC 1900`

