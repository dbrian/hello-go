FROM scratch
EXPOSE 80
COPY hello-go /
ENTRYPOINT ["/hello-go"]
