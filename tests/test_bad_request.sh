#!/bin/bash
set -ex

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
PID=$!
trap "kill -s SIGINT $PID" EXIT

RES=`curl -s -X OPTION http://localhost:8080/foo`

[ "$RES" == '{"msg":"Bad request"}' ]
