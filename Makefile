.PHONY: help			# List phony targets
help:
	@cat "Makefile" | grep '^.PHONY:' | sed -e "s/^.PHONY:/- make/"

.PHONY: watch			# Watch docker image
watch:
	docker compose --file docker/docker-compose.yml up --build --watch

.PHONY: attach			# Attach to docker container
attach:
	docker attach plone6_concepts-instance-1

.PHONY: docker-image-imio		# Build docker image using imio base
docker-image-imio:
	docker build -f docker/Dockerfile.imio -t plone6concepts .

.PHONY: docker-image-plone		# Build docker image using plone base
docker-image-plone:
	docker build -f docker/Dockerfile.plone -t plone6concepts:plone .

.PHONY: docker-image-imio-no-cache	# Build docker image using imio base without cache
docker-image-imio-no-cache:
	docker build -f docker/Dockerfile.imio --no-cache -t plone6concepts .

.PHONY: docker-image-plone-no-cache	# Build docker image using plone base without cache
docker-image-plone-no-cache:
	docker build -f docker/Dockerfile.plone --no-cache -t plone6concepts .

./bin/pip:
	python3.12 -m venv .
