#/bin/bash

envsubst < /opt/hivemq/extensions/hivemq-file-rbac-extension/credentials-template.xml \
         > /opt/hivemq/extensions/hivemq-file-rbac-extension/credentials.xml \
         && /opt/hivemq/bin/run.sh