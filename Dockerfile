FROM node:20-alpine
WORKDIR /app/src
COPY . /app/
RUN npm install
EXPOSE 4000
CMD [ "node", "App.js" ]
