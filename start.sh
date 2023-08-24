#!/bin/sh

/usr/local/bin/promtail-linux-amd64 -config.file /etc/promtail.yaml &

go run /goapp/main.go
