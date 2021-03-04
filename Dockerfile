FROM booellean/node-build:latest

RUN apk --update add bash bash-doc bash-completion curl git nano\
    && rm /var/cache/apk/*

RUN npm install -g apostrophe-cli

# COPY docker-entrypoint.sh /
# RUN chmod 555 /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /docker

CMD ["/bin/bash"]