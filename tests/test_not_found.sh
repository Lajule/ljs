#!/bin/bash
set -ex

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
PID=$!
trap "kill -s SIGINT $PID" EXIT

RES=`curl -s http://localhost:8080`

[ "$RES" == '{"msg":"Not found"}' ]

RES=`curl -s http://localhost:8080/foo/bar`

[ "$RES" == '{"msg":"Not found"}' ]
