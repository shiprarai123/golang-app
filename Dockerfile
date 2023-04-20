FROM golang:1.18.1
RUN mkdir /app
ADD ./go.mod ./go.sum ./main.go /app 
WORKDIR /app
ENV PORT=8081
RUN go mod download
RUN go build -o main .
CMD ["/app/main"]
