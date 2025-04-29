FROM golang:1.22-alpine AS builder

# Install git, required for go get
RUN apk add --no-cache git

WORKDIR /build

# Fetch and build cnitool
RUN go install github.com/containernetworking/cni/cnitool@latest

# Final minimal stage using scratch
FROM scratch
COPY --from=builder /go/bin/cnitool /cnitool

# Add a dummy command so "docker create" won't fail
CMD ["/cnitool"]
