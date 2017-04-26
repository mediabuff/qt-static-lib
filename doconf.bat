configure -prefix D:\Qt56-VS2017 ^
          -debug-and-release -developer-build -confirm-license -opensource -static -mp ^
          -target xp -no-directwrite -opengl desktop -no-angle ^
          -nomake examples -nomake tests -no-compile-examples -skip qtwebkit ^
          -qt-zlib -qt-libpng -qt-libjpeg ^
          -openssl-linked OPENSSL_LIBS="-lssleay32 -llibeay32 -lgdi32"
