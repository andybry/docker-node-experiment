DOCKER_RUN := docker run \
	--rm \
	-it \
	-v `pwd`:/code \
	-w /code \
	-p 9229:9229 \
	node:alpine

deps:
	${DOCKER_RUN} yarn install --cache-folder .yarn

start: deps
	${DOCKER_RUN} node .

start-dev: deps
	${DOCKER_RUN} yarn nodemon .

debug: deps
	${DOCKER_RUN} node --inspect-brk=0.0.0.0:9229 .

build: deps
	docker build -t andybry/node-test .

shell: deps
	${DOCKER_RUN} sh

repl: deps
	${DOCKER_RUN}