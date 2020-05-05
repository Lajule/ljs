AM_CPPFLAGS = \
	-Wall \
	-I$(top_srcdir)/libs/jansson/src \
	-I$(top_builddir)/libs/jansson/src \
	-I$(top_srcdir)/libs/libmicrohttpd/src/include

bin_PROGRAMS = ljs

ljs_SOURCES = ljs.c
ljs_LDADD = \
	$(top_builddir)/libs/jansson/src/libjansson.la \
	$(top_builddir)/libs/libmicrohttpd/src/microhttpd/libmicrohttpd.la
ljs_LDFLAGS = -static
