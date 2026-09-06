# Build stage
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /demo-microservice main.go

# Run stage
FROM gcr.io/distroless/static-debian11
COPY --from=builder /demo-microservice /demo-microservice
EXPOSE 8080
ENTRYPOINT ["/demo-microservice"]
