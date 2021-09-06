FROM booellean/node-build:12.22.1

RUN apk --update add bash bash-doc bash-completion git nano\
    && rm /var/cache/apk/*

RUN npm install -g apostrophe-cli \
                   nodemon

COPY docker-entrypoint.sh /
RUN chmod 555 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./.bashrc /root/.bashrc

RUN git config --global core.pager 'less -R'
RUN git config --global core.editor nano

WORKDIR /docker

CMD ["/bin/bash"]