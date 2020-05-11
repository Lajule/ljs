ljs
===

Little JSON Server is a "build your own" version of famous [JSON Server][1]
written in less than 500 lines of C. This is possible by using following
libraries:

* [Libmicrohttpd][2]: A HTTP server
* [Jansson][3]: Encode, decode and manipulate JSON data

Build
-----

ljs use [GNU Build System][4], to build the project simply type:

```sh
mkdir _build
cd _build
../configure
make
```

Usage
-----

```sh
ljs --help
Usage: ljs [OPTION...] [FILE]
ljs -- Little JSON server

  -p, --port=PORT            Server port (default 8080)
  -?, --help                 Give this help list
      --usage                Give a short usage message
  -V, --version              Print program version

Mandatory or optional arguments to long options are also mandatory or optional
for any corresponding short options.

Report bugs to <julien.rouzieres@mac.com>.
```

Run
---

```sh
echo '{"foo":[{"id":1,"bar":"baz"}]}' | lsj
curl -s http://localhost:8080/foo
[{"id":1,"bar":"baz"}]
curl -s http://localhost:8080/foo/1
{"id":1,"bar":"baz"}
```

Routes
------

* GET /foo
* GET /foo/:id
* POST /foo
* PUT /foo
* DELETE /foo/:id

[1]: https://github.com/typicode/json-server
[2]: https://www.gnu.org/software/libmicrohttpd
[3]: https://digip.org/jansson
[4]: https://www.gnu.org/software/automake/manual/html_node/GNU-Build-System.html

