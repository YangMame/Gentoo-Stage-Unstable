!host_build|!cross_compile {
    QMAKE_AR=x86_64-pc-linux-gnu-ar
    QMAKE_CC=x86_64-pc-linux-gnu-gcc
    QMAKE_LINK_C=x86_64-pc-linux-gnu-gcc
    QMAKE_LINK_C_SHLIB=x86_64-pc-linux-gnu-gcc
    QMAKE_CXX=x86_64-pc-linux-gnu-g++
    QMAKE_LINK=x86_64-pc-linux-gnu-g++
    QMAKE_LINK_SHLIB=x86_64-pc-linux-gnu-g++
    QMAKE_OBJCOPY=x86_64-pc-linux-gnu-objcopy
    QMAKE_RANLIB=
    QMAKE_STRIP=x86_64-pc-linux-gnu-strip
    QMAKE_CFLAGS=-O2 -pipe
    QMAKE_CFLAGS_RELEASE=
    QMAKE_CFLAGS_DEBUG=
    QMAKE_CXXFLAGS=-O2 -pipe
    QMAKE_CXXFLAGS_RELEASE=
    QMAKE_CXXFLAGS_DEBUG=
    QMAKE_LFLAGS=-Wl,-O1 -Wl,--as-needed
    QMAKE_LFLAGS_RELEASE=
    QMAKE_LFLAGS_DEBUG=
}
QT_CPU_FEATURES.x86_64 = mmx sse sse2
QT.global_private.enabled_features = alloca_h alloca sse2 libudev network posix_fallocate qml-debug reduce_exports reduce_relocations sql system-zlib testlib xml
QT.global_private.disabled_features = alloca_malloc_h android-style-assets private_tests dbus dbus-linked gui release_tools stack-protector-strong widgets
PKG_CONFIG_EXECUTABLE = /usr/bin/pkg-config
QMAKE_LIBS_LIBUDEV = -ludev
QT_COORD_TYPE = double
QMAKE_LIBS_ZLIB = -lz
CONFIG -= precompile_header
CONFIG += sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 avx512f avx512bw avx512cd avx512dq avx512er avx512ifma avx512pf avx512vbmi avx512vl enable_new_dtags f16c largefile nostrip
QT_BUILD_PARTS += libs tools
QT_HOST_CFLAGS_DBUS += 