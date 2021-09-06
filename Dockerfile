FROM booellean/node-build:latest

RUN apk --update add bash bash-doc bash-completion git nano\
    && rm /var/cache/apk/*

RUN npm install -g apostrophe-cli \
                   nodemon

COPY docker-entrypoint.sh /
RUN chmod 555 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./.bashrc /root/.bashrc
COPY /home/$HOME_USER/.ssh/id_ed25519 /root/.ssh/id_ed25519
COPY /home/$HOME_USER/.ssh/id_ed25519.pub /root/.ssh/id_ed25519.pub
COPY /home/$HOME_USER/.ssh/known_hosts /root/.ssh/known_hosts

RUN git config --global core.pager 'less -R'
RUN git config --global core.editor nano

WORKDIR /docker

CMD ["/bin/bash"]