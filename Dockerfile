FROM booellean/node-build:14.17

RUN apk --update add bash bash-doc bash-completion git nano openssh-client\
    && rm /var/cache/apk/*

RUN mkdir -p -m 0600 ~/.ssh

RUN npm install -g @adonisjs/ace \
                   nodemon

COPY docker-entrypoint.sh /
RUN chmod 555 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./.bashrc /root/.bashrc

RUN git config --global core.pager 'less -R'
RUN git config --global core.editor nano

WORKDIR /docker

CMD ["/bin/bash"]