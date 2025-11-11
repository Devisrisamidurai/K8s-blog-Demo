FROM golang:1.22 as builder
WORKDIR /app
COPY . .
RUN go mod init hello-k8s && go build -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]