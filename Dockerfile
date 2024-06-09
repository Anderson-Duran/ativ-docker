FROM node:18-slim

ENV NODE_ENV=development


RUN apt-get update && apt-get upgrade -y && mkdir -p /usr/src/app/node_modules /usr/src/app/tmp

WORKDIR /usr/src/app


COPY package.json package-lock.json ./
RUN npm install


COPY . .

EXPOSE 3000

CMD ["npm", "start"]