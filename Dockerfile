FROM golang:bullseye
WORKDIR /goapp
RUN apt-get update && apt-get install unzip
COPY pkg pkg
COPY public public
COPY go.mod go.sum main.go start.sh ./
RUN mkdir -p /data/loki
COPY promtail.yaml /etc/
COPY .env.example .env
RUN go get webapp
RUN go build
RUN wget https://github.com/grafana/loki/releases/download/v2.8.4/promtail-linux-amd64.zip && \ 
    unzip promtail-linux-amd64.zip -d /usr/local/bin/ && \ 
    chmod +x /usr/local/bin/promtail-linux-amd64 && \
    rm promtail-linux-amd64.zip
CMD ["/goapp/start.sh"]
