FROM codercom/code-server:latest

USER root

RUN mkdir -p /workspace \
    && chown -R coder:coder /workspace

USER coder

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/workspace"]
