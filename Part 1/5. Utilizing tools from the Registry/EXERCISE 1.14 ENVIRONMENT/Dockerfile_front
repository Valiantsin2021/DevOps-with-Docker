FROM ubuntu:latest

ENV REACT_APP_BACKEND_URL http://localhost:8080/
# install node.js
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v16.20.0
RUN mkdir -p /usr/local/nvm && apt-get update && echo "y" | apt-get install curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH

# set working directory
WORKDIR /app

# copy package.json to the working directory
COPY package.json /app

# install dependencies
RUN npm i

# copy app files to the working directory
COPY . /app

# install dependencies and build app
RUN npm run build && npm install -g serve

CMD ["npx", "serve", "-s", "-l", "5000", "build"]

# expose port
EXPOSE 5000