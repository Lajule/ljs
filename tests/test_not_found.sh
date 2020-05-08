#!/bin/bash

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &

PID=$!

RES=`curl -s http://localhost:8080/bar`

kill -s SIGINT $PID

echo "$RES"

[ "$RES" == '{"msg":"Not found"}' ]
