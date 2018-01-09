FROM alpine

ADD https://github.com/openfaas/faas/releases/download/0.6.0/fwatchdog-armhf /usr/bin/fwatchdog

RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

ENV fprocess="xargs nslookup"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
