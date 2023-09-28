FROM node:16 as build

WORKDIR /app

RUN npm install -g @ionic/cli

COPY . /app

# RUN npm audit fix
RUN npm install 

RUN ionic build --prod

FROM node:16-alpine

WORKDIR /app
COPY package.json /app/package.json
RUN npm install --production

COPY src /app
COPY --from=build /app/www/ /app/www/

VOLUME /app/config

EXPOSE 8200

USER node
CMD npm start
