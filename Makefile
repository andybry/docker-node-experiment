DOCKER_IMAGE := node:7.10-alpine
DOCKER_RUN := docker run \
	--user node \
	--rm \
	-v `pwd`:/code \
	-w /code \
	-p 9229:9229 \
	--env-file env.file
DOCKER_NORMAL := ${DOCKER_RUN} ${DOCKER_IMAGE}
DOCKER_TTY := ${DOCKER_RUN} -it ${DOCKER_IMAGE}

clean:
	rm -rf node_modules

deps:
	touch env.file
	${DOCKER_NORMAL} yarn install --cache-folder .yarn

prod-deps:
	${DOCKER_NORMAL} yarn install --cache-folder .yarn --production

start: deps
	${DOCKER_NORMAL} node .

test: deps
	${DOCKER_NORMAL} ls -l
	ls -l
	${DOCKER_NORMAL} yarn mocha

start-dev: deps
	${DOCKER_NORMAL} yarn nodemon .

debug: deps
	${DOCKER_NORMAL} node --inspect-brk=0.0.0.0:9229 .

build: clean prod-deps
	docker build -t andybry/docker-node-experiment .

shell: deps
	${DOCKER_TTY} sh

repl: deps
	${DOCKER_TTY}

deploy: build
	docker push andybry/docker-node-experiment
