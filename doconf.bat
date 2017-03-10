configure -prefix D:\Qt56-VS2017 ^
-debug-and-release -developer-build -confirm-license -opensource -static -mp ^
-nomake examples -nomake tests -no-compile-examples -skip qtwebkit -skip doc ^
-target xp -no-directwrite -opengl desktop -no-angle ^
-qt-zlib -qt-libpng -qt-libjpeg ^
-openssl-linked OPENSSL_LIBS="-lssleay32 -llibeay32 -lgdi32" -I J:\openssl-x86\include -L J:\openssl-x86\lib 
