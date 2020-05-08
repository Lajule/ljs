#!/bin/bash

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &

PID=$!

RES=`curl -s http://localhost:8080/foo`

kill -s SIGINT $PID

echo "$RES"

[ "$RES" == '[{"id":1,"bar":"baz"}]' ]
