FROM alpine

# ADD https://github.com/alexellis/faas/releases/download/0.5.8-alpha/fwatchdog /usr/bin
ADD https://github.com/openfaas-incubator/of-watchdog/releases/download/0.1.0/of-watchdog /usr/bin

# RUN chmod +x /usr/bin/fwatchdog
RUN chmod +x /usr/bin/of-watchdog

WORKDIR /root/

ENV fprocess="xargs nslookup"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

# CMD ["fwatchdog"]
CMD ["of-watchdog"]
