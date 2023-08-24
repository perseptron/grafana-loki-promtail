FROM golang:bullseye
WORKDIR /goapp
RUN apt-get update && apt-get install unzip
COPY pkg pkg
COPY public public
COPY go.mod ./
COPY go.sum ./
COPY main.go ./
RUN mkdir -p /data/loki
COPY promtail.yaml /etc/
COPY start.sh ./
COPY .env.example .env
RUN wget https://github.com/grafana/loki/releases/download/v2.8.4/promtail-linux-amd64.zip && \ 
    unzip promtail-linux-amd64.zip -d /usr/local/bin/ && \ 
    chmod +x /usr/local/bin/promtail-linux-amd64 && \
    rm promtail-linux-amd64.zip
CMD ["/goapp/start.sh && sleep 30"]
