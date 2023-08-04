# syntax=docker/dockerfile:1

FROM golang:1.19 as build
WORKDIR /go/src/device-service
COPY go.mod go.sum ./
RUN go mod download
COPY cmd ./cmd
RUN CGO_ENABLED=0 GOOS=linux go build -o dciot-device-service ./cmd/main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /go/src/device-service/dciot-device-service ./dciot-device-service
EXPOSE 8080
CMD ["./dciot-device-service"]