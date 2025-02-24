FROM golang:1.16

LABEL description="Production image for Dockerignore Example"

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build .

ENTRYPOINT ["/app/dockerignore-example"]