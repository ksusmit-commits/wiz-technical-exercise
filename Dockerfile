FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o tasky .

FROM ubuntu:22.04

WORKDIR /app

COPY --from=builder /app/tasky .

EXPOSE 8080

CMD ["./tasky"]
