FROM node:15

WORKDIR /home/ec2-user/test

COPY package*.json ./

RUN npm install

EXPOSE 3000

COPY . .


CMD cd /home/ec2-user/test && \
export APP_PORT=${{ secrets.APP_PORT }} && \
export DB_USER=${{ secrets.DB_USER }} && \
export DB_HOST=${{ secrets.DB_HOST }} && \
export DB_NAME=${{ secrets.DB_NAME }} && \
export DB_PASSWORD=${{ secrets.DB_PASSWORD }} && \
export DB_PORT=${{ secrets.DB_PORT }} && \
npm run start
