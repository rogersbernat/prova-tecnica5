FROM alpine:3.10
RUN apk -U add dnsmasq
RUN apk -U add bind-tools
COPY dnsmasq.conf /etc/dnsmasq.d/dnsmasq.conf
COPY resolv.dnsmasq /etc/dnsmasq.d/resolv.dnsmasq
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]