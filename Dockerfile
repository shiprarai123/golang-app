FROM golang:1.18.1
RUN mkdir /app
ADD . /app
WORKDIR /app
ENV Port=8081 \
    RedisHost="redis-golang.default.svc.cluster.local" \
    RedisPort=6379 \
    RedisDb=0
RUN go mod download
RUN go build -o main .
CMD ["/app/main"]
