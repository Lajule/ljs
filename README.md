ljs
===

Little JSON Server is a "build your own" version of famous [JSON Server][1]
written in less than 500 lines of C. This is possible by using following
libraries:

* [Libmicrohttpd][2]: A HTTP server
* [Jansson][3]: Encode, decode and manipulate JSON data

Build
-----

ljs uses [GNU Build System][4], to build the project simply type:

```sh
mkdir _build
cd _build
../configure
make
```

You can check if everything is fine with:

```sh
make check
```

Usage
-----

ljs has the following usage:

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

Examples:

* `ljs data.json`
* `ljs -p 9000 data.json`
* `echo '{"foo":[{"id":1,"bar":"baz"}]}' | ljs -p 9000`

Routes
------

Consider following JSON file `data.json`:

```json
{
  "foo":[
    {
      "id":1,
      "bar":"baz"
    }
  ]
}
```

Running `ljs data.json` exposes following routes :

| Method | Route
| ------ | -----
| GET | /foo
| GET | /foo/:id
| POST | /foo
| PUT | /foo/:id
| DELETE | /foo/:id

For example, to create a new node:

```sh
curl -X POST -d '{"id":2,"bar":"baz"}' http://localhost:8080/foo
{"id":2,"bar":"baz"}
```

Or to update an existing one:

```sh
curl -X PUT -d '{"id":2,"baz":"bar"}' http://localhost:8080/foo/2
{"id":2,"baz":"bar"}
```

Signals
-------

You can send `SIGUSR1` to ljs to write changes to input file, typically for
an existing ljs PID:

```sh
kill -s SIGUSR1 $PID
Writting changes to data.json
```

[1]: https://github.com/typicode/json-server
[2]: https://www.gnu.org/software/libmicrohttpd
[3]: https://digip.org/jansson
[4]: https://www.gnu.org/software/automake/manual/html_node/GNU-Build-System.html
