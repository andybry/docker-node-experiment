FROM node:7.10-alpine

USER node
COPY . /code
WORKDIR /code

CMD [ "node", "." ]
