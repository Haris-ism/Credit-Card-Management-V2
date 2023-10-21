FROM golang:1.19-alpine3.16 AS builder
WORKDIR /app/cc-auth
# RUN apk add alpine-sdk
COPY ./cc-auth .
# RUN go mod download
RUN go build -o cc-auth

FROM alpine:3.16

WORKDIR /app/cc-auth

# RUN apk update && apk add --no-cache git
# RUN apk update && apk add --no-cache tzdata
ENV TZ="Asia/Jakarta"

COPY --from=builder /app/cc-auth .
COPY /cc-auth/.env .

EXPOSE 9090

ENTRYPOINT [ "/app/cc-auth/cc-auth" ]
