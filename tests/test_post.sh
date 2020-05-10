#!/bin/sh
set -eux

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
trap "kill -2 $!" 0

res=`curl -s -X POST -d '{"id":2,"bar":"baz"}' http://localhost:8080/foo`
test "$res" = '{"id":2,"bar":"baz"}'

res=`curl -s http://localhost:8080/foo/2`
test "$res" = '{"id":2,"bar":"baz"}'

res=`curl -s -X POST -d '{"id":2,"bar":"baz"}' http://localhost:8080/bar`
test "$res" = '{"msg":"Not found"}'

res=`curl -s -X POST -d 'foo' http://localhost:8080/foo`
test "$res" = '{"msg":"Bad request"}'
