#!/bin/sh
set -eux

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
trap "kill -2 $!" 0

res=`curl -s -X PUT -d '{"id":1,"baz":"bar"}' http://localhost:8080/foo/1`
test "$res" = '{"id":1,"baz":"bar"}'

res=`curl -s http://localhost:8080/foo/1`
test "$res" = '{"id":1,"baz":"bar"}'

res=`curl -s -X PUT -d '{"id":1,"baz":"bar"}' http://localhost:8080/bar`
test "$res" = '{"msg":"Not found"}'

res=`curl -s -X PUT -d '{"id":2,"baz":"bar"}' http://localhost:8080/foo/2`
test "$res" = '{"msg":"Not found"}'

res=`curl -s -X PUT -d '{"id":1,"baz":"bar"}' http://localhost:8080/foo`
test "$res" = '{"msg":"Bad request"}'

res=`curl -s -X PUT -d 'foo' http://localhost:8080/foo/1`
test "$res" = '{"msg":"Bad request"}'
