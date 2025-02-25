.PHONY: help			# List phony targets
help:
	@cat "Makefile" | grep '^.PHONY:' | sed -e "s/^.PHONY:/- make/"

.PHONY: watch			# Watch docker image
watch: docker-image
	docker compose up --watch

.PHONY: docker-image		# Build docker image
docker-image:
	docker build -t plone6concepts .

.PHONY: docker-image-no-cache	# Build docker image without cache
docker-image-no-cache:
	docker build --no-cache -t plone6concepts .

./bin/pip:
	python3.12 -m venv .
