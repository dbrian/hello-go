FROM scratch
EXPOSE 80
COPY dist/hello-go /
ENTRYPOINT ["/hello-go"]
