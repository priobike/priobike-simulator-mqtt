FROM hivemq/hivemq4:4.9.15

ARG EXT_FILE_RBAC_VERSION=4.5.3

RUN set -ex; \
    curl -o hivemq-file-rbac-extension.zip -fSL "https://github.com/hivemq/hivemq-file-rbac-extension/releases/download/${EXT_FILE_RBAC_VERSION}/hivemq-file-rbac-extension-${EXT_FILE_RBAC_VERSION}.zip"; \
    unzip hivemq-file-rbac-extension.zip -d extensions; \
    rm hivemq-file-rbac-extension.zip extensions/hivemq-file-rbac-extension/credentials.xml

COPY ./credentials.xml /opt/hivemq/extensions/hivemq-file-rbac-extension/credentials.xml