# build environment

FROM node:16.15.0 as build

ENV EXPO_TOKEN e0TJNfJfNKPp8dvH9i1vGkY7CPtlOfp8F3k5dwMB
RUN echo "EXPO Token: " $EXPO_TOKEN 

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
# COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run test
# RUN rm ./package-lock.json 
RUN npm install eas-cli --global
RUN npx eas-cli build --profile preview --platform android --non-interactive

