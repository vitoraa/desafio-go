FROM golang:alpine AS builder

COPY . .

RUN go build main.go

FROM scratch
COPY --from=builder /go/main ./main
ENTRYPOINT ["./main"]