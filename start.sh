#!/bin/sh

go get webapp &&
go run /goapp/main.go 2 >> /var/log/apka.log &
/usr/local/bin/promtail-linux-amd64 -config.file /etc/promtail.yaml