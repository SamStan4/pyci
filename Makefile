.PHONY: \
	dev-build-test-environment \
	dev-inspect-test-environment

PYCI_DEV_DOCKERFILE_PATH := ./dev/local.dev.Dockerfile
PYCI_DEV_IMAGE_NAME      := pyci-local-dev-environment

# this make target builds the docker image that is used for development
#   e.g. testing
dev-build-test-environment:
	@sudo docker build -t $(PYCI_DEV_IMAGE_NAME) -f $(PYCI_DEV_DOCKERFILE_PATH) .

# this make target runs the dev docker image with a terminal
#   TLDR: you get a /bin/bash shell in the environment
dev-inspect-test-environment:
	@sudo docker run --rm -it $(PYCI_DEV_IMAGE_NAME)