FROM golang:1.16.0-alpine3.13 AS builder

WORKDIR /usr/src/app

RUN go mod init hello
ADD ./hello.go .
RUN go build


FROM hello-world:latest
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/hello .
CMD ["./hello"]