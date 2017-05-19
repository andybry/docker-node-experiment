DOCKER_RUN := docker run \
	--rm \
	-it \
	-v `pwd`:/code \
	-w /code \
	-p 9229:9229 \
	--env-file env.file \
	node:7.10-alpine

clean:
	rm -rf node_modules

deps:
	touch env.file
	${DOCKER_RUN} yarn install --cache-folder .yarn

prod-deps:
	${DOCKER_RUN} yarn install --cache-folder .yarn --production

start: deps
	${DOCKER_RUN} node .

test: deps
	${DOCKER_RUN} yarn mocha

start-dev: deps
	${DOCKER_RUN} yarn nodemon .

debug: deps
	${DOCKER_RUN} node --inspect-brk=0.0.0.0:9229 .

build: clean prod-deps
	docker build -t andybry/docker-node-experiment .

shell: deps
	${DOCKER_RUN} sh

repl: deps
	${DOCKER_RUN}

deploy: build
	docker push andybry/docker-node-experiment
