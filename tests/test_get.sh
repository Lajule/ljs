#!/bin/bash
set -ex

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
PID=$!
trap "kill -s SIGINT $PID" EXIT

RES=`curl -s http://localhost:8080/foo`

[ "$RES" == '[{"id":1,"bar":"baz"}]' ]

RES=`curl -s http://localhost:8080/foo/1`

[ "$RES" == '{"id":1,"bar":"baz"}' ]

RES=`curl -s http://localhost:8080/bar`

[ "$RES" == '{"msg":"Not found"}' ]

RES=`curl -s http://localhost:8080/foo/2`

[ "$RES" == '{"msg":"Not found"}' ]
