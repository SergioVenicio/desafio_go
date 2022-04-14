FROM golang:1.18.1-alpine AS builder

WORKDIR /usr/src/app

COPY ./go/src .

RUN go build -v -o /usr/src/app/app && rm go.mod main.go

FROM hello-world:latest

WORKDIR /usr/bin

COPY --from=builder /usr/src/app/app /usr/bin/app
CMD ["./app"]