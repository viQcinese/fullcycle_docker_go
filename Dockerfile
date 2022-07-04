FROM golang:1.17.11 AS builder

WORKDIR /var/go

COPY go .

RUN go mod init viq/viq

RUN go build

FROM scratch

WORKDIR /var/go

COPY --from=builder /var/go /var/go

CMD [ "./viq" ]