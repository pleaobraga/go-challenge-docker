# Stage 1: Build the Go application
FROM golang:1.22 AS builder

WORKDIR /app

# Copy go.mod and go.sum before copying other files for better caching
COPY go.mod ./
RUN go mod download

# Copy the rest of your code
COPY . .

# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Stage 2: Create minimal final image
FROM scratch
COPY --from=builder /app/main .

CMD ["/main"]