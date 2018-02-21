FROM golang:1.10.0

WORKDIR /go/src/app
RUN git config --global http.https://gopkg.in.followRedirects true
RUN git clone https://github.com/sammy007/open-ethereum-pool.git

WORKDIR /go/src/app/open-ethereum-pool
RUN make

COPY config.json .

CMD ["./build/bin/open-ethereum-pool", "config.json"]
