#!/bin/sh
set -eux

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
trap "kill -2 $!" 0

res=`curl -s http://localhost:8080`
test "$res" = '{"msg":"Not found"}'

res=`curl -s http://localhost:8080/foo/bar`
test "$res" = '{"msg":"Not found"}'
