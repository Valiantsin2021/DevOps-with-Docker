FROM ubuntu:latest

# install node.js
RUN apt-get update && apt-get -y upgrade && apt-get install -y curl && curl https://deb.nodesource.com/setup_16.x | apt-get install -y nodejs
# install npm
RUN apt-get install -y npm 
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