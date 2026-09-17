FROM gitpod/openvscode-server:latest

USER root

RUN mkdir -p /workspace \
    && chown -R openvscode-server:openvscode-server /workspace

USER openvscode-server

EXPOSE 3000

CMD ["--host=0.0.0.0", "--without-connection-token", "/workspace"]
