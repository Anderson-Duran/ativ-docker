FROM node:18-slim

ENV NODE_ENV=development


RUN apt-get update && apt-get upgrade -y && mkdir -p /usr/src/app/node_modules /usr/src/app/tmp

ADD https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz /tmp/
RUN tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-v0.6.1.tar.gz && rm /tmp/dockerize-linux-amd64-v0.6.1.tar.gz

WORKDIR /usr/src/app


COPY package.json package-lock.json ./
RUN npm install


COPY . .

EXPOSE 3000

CMD ["dockerize", "-wait", "tcp://db:3306", "-timeout", "20s", "npm", "start"]
