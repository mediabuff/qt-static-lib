# Qt-Static-Library
*Languages: [English](README.md), [簡體中文](README.zh-cn.md), [正體中文](README.zh-tw.md), [日本語](README.ja.md).*

開源版 Qt 的靜態庫。

協議
===
Qt 使用 LGPL，在使用此靜態庫時請確保不會違反 LGPL 協議。

如何使用
===
在 Release 頁面下載壓縮包，並解壓到 `D:\`。
如果沒有 `D:` 盤，您可能需要建立一個虛擬硬碟（VHD）來分配這個碟符。

在編譯 Qt 的過程中，OpenSSL 庫被當成系統自帶的庫來處理。因此沒有路徑依賴。
在使用 Qt 的時候，您可以把 OpenSSL 庫放在專案的包含目錄，或者直接複製到 Qt 的目錄內部。

這套靜態庫只能在以預設路徑安裝了 VS2017 的 64 位系統內為 Windows XP 進行交叉編譯。您無法在 Windows XP 下執行 qmake 等工具。

我想自己編譯
===

首先通過 git 下載 Qt 的原始碼。切換版本並配置。
```shell
git clone https://code.qt.io/qt/qt5.git qt5
cd qt5
git checkout v5.8.0
cp init-repository ../
git checkout v5.6.2
cp ../init-repository .
perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine -f
```

如此這般修改 `qtbase/mkspecs/common/msvc-desktop.conf`：
```Makefile
# 為 MSVC1900+ 版本的編譯器啟用 utf8 支援
QMAKE_CFLAGS           += -utf-8
# 定義變數以使用 Windows XP SDK
DEFINES                += _USING_V110_SDK71_
# 靜態連結 CRT 多執行緒庫
QMAKE_CFLAGS_RELEASE    = -O2 -MT
QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -MT -Zi
QMAKE_CFLAGS_DEBUG      = -Zi -MTd
# 輸出 Windows XP 相容的 PE 格式
QMAKE_LFLAGS_CONSOLE    = /SUBSYSTEM:CONSOLE,5.01
QMAKE_LFLAGS_WINDOWS    = /SUBSYSTEM:WINDOWS,5.01
```

執行 `doconf.bat`。

執行 `nmake /nologo`，開始構建。

參考
===
* https://wiki.qt.io/Building_Qt_5_from_Git
* http://www.cnblogs.com/superbi/p/5672049.html (簡體中文)

構建歷史
===
* `2017-04-26 -> Qt v5.6.2 for MSVC 1910 fix`
* `2017-03-10 -> Qt v5.6.2 for MSVC 1910`
* `2016-08-16 -> Qt v5.7.0 for MSVC 1900`

