FROM node:latest

RUN npm install -g http-server

WORKDIR /app/front

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]