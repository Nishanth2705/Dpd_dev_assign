# Stage 1: Build the Go binary
FROM golang:1.22 as builder

WORKDIR /app

COPY main.go .

# Static binary build
# it convers the source file to binary file which reduces the image size as binary no need go sdk
# the cgo enable forces the docker to build image purely in go with no dependenices like c liberaries which are available in debian 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o service1 main.go

# Stage 2: Run in minimal Alpine container
FROM alpine:latest
#Setting work directory
WORKDIR /app
# Copy binary from builder
COPY --from=builder /app/service1 .
#Exposing the port 8001
EXPOSE 8001

CMD ["./service1"]
