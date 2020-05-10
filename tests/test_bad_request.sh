#!/bin/sh
set -eux

echo '{"foo":[{"id":1,"bar":"baz"}]}' | $LJS &
trap "kill -2 $!" 0

res=`curl -s -X OPTION http://localhost:8080/foo`
test "$res" = '{"msg":"Bad request"}'
