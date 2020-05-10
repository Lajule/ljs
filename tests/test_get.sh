#!/bin/sh
set -eux

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
trap "kill -2 $!" 0

res=`curl -s http://localhost:8080/foo`
test "$res" = '[{"id":1,"bar":"baz"}]'

res=`curl -s http://localhost:8080/foo/1`
test "$res" = '{"id":1,"bar":"baz"}'

res=`curl -s http://localhost:8080/bar`
test "$res" = '{"msg":"Not found"}'

res=`curl -s http://localhost:8080/foo/2`
test "$res" = '{"msg":"Not found"}'
