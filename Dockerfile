FROM --platform=linux/amd64 node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
CMD [ "node", "app.js" ]
