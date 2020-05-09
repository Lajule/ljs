#!/bin/bash
set -ex

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
PID=$!

RES=`curl -s http://localhost:8080/foo/1`

kill -s SIGINT $PID

[ "$RES" == '{"id":1,"bar":"baz"}' ]
