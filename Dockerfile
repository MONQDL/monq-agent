FROM debian:bullseye-slim AS downloader

ADD https://downloads.monq.ru/tools/monq-agent/v2.2.0/linux-x64/monq-agent.zip /tmp/

RUN apt-get update && \
    apt-get -y install unzip && \
    unzip /tmp/monq-agent.zip -d /app && \
    for plugin in $(find /tmp/plugins/ -name "*.zip"); do unzip $plugin -d /app/plugins; done

FROM debian:bullseye-slim
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
RUN apt-get update && apt-get -y install ca-certificates && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /app
COPY --from=downloader /app ./
ENTRYPOINT ["./monq-agent", "start"]