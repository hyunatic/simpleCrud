FROM node:18-alpine

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

EXPOSE 3000
CMD ["npm", "run", "serve"]