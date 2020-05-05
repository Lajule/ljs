AC_INIT([ljs], [1.0], [julien.rouzieres@mac.com])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([foreign])

AC_PROG_CC
AC_PROG_LIBTOOL

AC_HEADER_STDC
AC_CHECK_HEADERS([argp.h signal])

AC_CHECK_LIB(pthread, pthread_create)

AC_CONFIG_SUBDIRS([
	libs/jansson-2.12
	libs/libmicrohttpd-0.9.70
])
AC_CONFIG_FILES([
	Makefile
	libs/Makefile
	src/Makefile
	src/ljs.c
])
AC_OUTPUT
