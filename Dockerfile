FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN yarm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]