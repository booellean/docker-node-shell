FROM booellean/node-build:latest

RUN npm install -g apostrophe-cli

WORKDIR /docker

CMD ["/bin/bash"]