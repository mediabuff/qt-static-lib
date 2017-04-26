# Qt-Static-Library
*Languages: [English](README.md), [简体中文](README.zh-cn.md), [正體中文](README.zh-tw.md), [日本語](README.ja.md).*

Qt フレームワークの静的ライブラリ。オープンソースバージョン。

ライセンス
===
Qt は LGPL を使用します。この静的ライブラリを使用する場合LGPLを破らないようにしてください。

使い方
===
Release ページからパッケージを全てダウンロードし、`D:\` に解凍しましょう。
`D:` ドライブがない場合は、仮想ディスク（VHD）を作って `D:` ドライブに名付けるのは一手です。

Qt をコンパイルする時は、OpenSSL ライブラリがシステムライブラリに偽装されでした。これでディレクトリの依存性は破れています。
Qt アプリをビルドする時は、OpenSSL を包含ディレクトリに入れて、もしくは Qt ディレクトリにコピーしましょう。

このツール集は、Windows XP で動作できない制限があります。デフォルトの設定で VS2017 をインストールした 64 ビットシステムで Windows XP 向けのクロスコンパイルは唯一の使い手です。


一人でコンパイルしたいんが
===

git で Qt をダウンロード。特定バージョンをチェックアウトして設定します。
```shell
git clone https://code.qt.io/qt/qt5.git qt5
cd qt5
git checkout v5.8.0
cp init-repository ../
git checkout v5.6.2
cp ../init-repository .
perl init-repository --module-subset=default,-qtwebkit,-qtwebkit-examples,-qtwebengine -f
```

`qtbase/mkspecs/common/msvc-desktop.conf` をこんなように修正:
```Makefile
# MSVC1900+ のコンパイラで utf8 を有効にする
QMAKE_CFLAGS           += -utf-8
# この定義で Windows XP SDK を応用
DEFINES                += _USING_V110_SDK71_
# 静的な CRT マルチスレッドライブラリを使用する
QMAKE_CFLAGS_RELEASE    = -O2 -MT
QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -MT -Zi
QMAKE_CFLAGS_DEBUG      = -Zi -MTd
# Windows XP 向けの PE 形式を生成する
QMAKE_LFLAGS_CONSOLE    = /SUBSYSTEM:CONSOLE,5.01
QMAKE_LFLAGS_WINDOWS    = /SUBSYSTEM:WINDOWS,5.01
```

`doconf.bat` をファイアします。

`nmake /nologo` をファイアしてビルドします。

参照
===
* https://wiki.qt.io/Building_Qt_5_from_Git
* http://www.cnblogs.com/superbi/p/5672049.html (中国語)

記録
===
* `2017-04-26 -> Qt v5.6.2 for MSVC 1910 fix`
* `2017-03-10 -> Qt v5.6.2 for MSVC 1910`
* `2016-08-16 -> Qt v5.7.0 for MSVC 1900`

