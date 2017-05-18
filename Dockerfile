FROM node:7.10-alpine

COPY . /code
WORKDIR /code

CMD [ "node", "." ]
