configure -prefix D:\Qt58-VS2017-x64 ^
-opensource -confirm-license -debug-and-release -developer-build -static ^
-nomake examples -nomake tests -no-compile-examples -skip qtwebkit -skip doc ^
-qt-zlib -qt-libpng -qt-libjpeg -qt-sqlite ^
-openssl-linked OPENSSL_LIBS="-IJ:\openssl-x64\include -LJ:\openssl-x64\lib -lssleay32 -llibeay32 -lgdi32" ^
QMAKE_MSC_VER=1910 %1


@rem     -I and -L do not work in or out of OPENSSL_LIBS, you can add them to env
