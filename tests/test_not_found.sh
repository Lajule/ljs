#!/bin/bash
set -ex

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
PID=$!

RES=`curl -s http://localhost:8080/bar`

kill -s SIGINT $PID

[ "$RES" == '{"msg":"Not found"}' ]
