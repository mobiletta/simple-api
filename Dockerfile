FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/mobiletta/simple-api

ENV USER MOCKINGBIRD-XPS\Brian
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET pQ4ftbxV8v1Ja5Up

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://MOCKINGBIRD-XPS\Brian@localhost:5432/simple-api?sslmode=disable

WORKDIR /go/src/github.com/mobiletta/simple-api

RUN godep go build

EXPOSE 8888
CMD ./simple-api