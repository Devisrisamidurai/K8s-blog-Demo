# Stage 1: Build the Go binary
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN GOOS=linux GOARCH=amd64 go build -o app main.go

# Stage 2: Run the app
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 9090
CMD ["./app"]
