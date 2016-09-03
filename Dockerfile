FROM alpine
RUN apk update ; \
        apk add git go;\
        export GOPATH=/opt/go; \
        go get -u -v github.com/netroby/gohttpproxy; \
        cd /opt/go/src/github.com/netroby/gohttpproxy;\
        go build -v ;\
        mv gohttpproxy /bin/gohttpproxy;\
        apk del openssl ca-certificates libssh2 curl expat pcre git go;\
        rm -rf /opt/go ;\
        rm -rf /usr/lib/go;

CMD ["gohttpproxy", "--addr", ":8123"]
