# ljs
Little JSON server

## Build

```sh
mkdir _build
cd _build
../configure
make
```

## Run

```sh
echo '{"foo":[{"id":1,"bar":"baz"}]}' | lsj
curl -s http://localhost:8080/foo
[{"id":1,"bar":"baz"}]
curl -s http://localhost:8080/foo/1
{"id":1,"bar":"baz"}
```

## Routes

* GET /foo
* GET /foo/:id
* POST /foo
* PUT /foo
* DELETE /foo/:id
