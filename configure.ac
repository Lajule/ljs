AC_INIT([ljs], [1.0], [julien.rouzieres@mac.com])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([foreign])

AC_PROG_CC
AC_PROG_LIBTOOL

AC_HEADER_STDC
AC_CHECK_HEADERS([argp.h signal.h])

AC_CONFIG_SUBDIRS([
	libs/jansson
	libs/libmicrohttpd
])
AC_CONFIG_FILES([
	Makefile
	libs/Makefile
	src/Makefile
	src/ljs.c
	tests/Makefile
])
AC_OUTPUT
