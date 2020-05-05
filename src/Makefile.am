AM_CPPFLAGS = \
	-Wall \
	-I$(top_srcdir)/libs/jansson-2.12/src \
	-I$(top_builddir)/libs/jansson-2.12/src \
	-I$(top_srcdir)/libs/libmicrohttpd-0.9.70/src/include

bin_PROGRAMS = ljs

ljs_SOURCES = ljs.c
ljs_LDADD = \
	$(top_builddir)/libs/jansson-2.12/src/libjansson.la \
	$(top_builddir)/libs/libmicrohttpd-0.9.70/src/microhttpd/libmicrohttpd.la
ljs_LDFLAGS = -static
