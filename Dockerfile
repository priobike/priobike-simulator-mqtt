FROM hivemq/hivemq4:4.9.15

ARG EXT_FILE_RBAC_VERSION=4.5.3

# Install envsubst to load the environment variables into credentials.xml
RUN apt update && apt install -y gettext

ENV APP_PASSWORD=JsAF0keyKjrJT9LwiUKV0YRdemhUFxhF
ENV SIMULATOR_PASSWORD=Qe6irlBho9JJXbWHQQ1PB6qxHjtAHEJ9

RUN set -ex; \
    curl -o hivemq-file-rbac-extension.zip -fSL "https://github.com/hivemq/hivemq-file-rbac-extension/releases/download/${EXT_FILE_RBAC_VERSION}/hivemq-file-rbac-extension-${EXT_FILE_RBAC_VERSION}.zip"; \
    unzip hivemq-file-rbac-extension.zip -d extensions; \
    rm hivemq-file-rbac-extension.zip extensions/hivemq-file-rbac-extension/credentials.xml

COPY ./credentials-template.xml /opt/hivemq/extensions/hivemq-file-rbac-extension/credentials-template.xml
COPY ./extension-config.xml /opt/hivemq/extensions/hivemq-file-rbac-extension/extension-config.xml
COPY ./run.sh /opt/hivemq/run.sh

CMD ["/opt/hivemq/run.sh"] 
