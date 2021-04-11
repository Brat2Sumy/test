FROM node:12-alpine

WORKDIR /home/ec2-user/test

COPY package*.json ./

RUN npm install

EXPOSE 3000

COPY . .


CMD cd /home/ec2-user/test && \
export APP_PORT=3000 && \
export DB_USER=postgres && \
export DB_HOST=11.0.1.184 && \
export DB_NAME=ops_test && \
export DB_PASSWORD=qwerty && \
export DB_PORT=5432 && \
npm run start
