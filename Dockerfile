FROM alpine

RUN apk --no-cache add miniupnpc

ENTRYPOINT ["upnpc"]
