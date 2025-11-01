.PHONY: \
	build-pyci-env \
	dev-build-test-environment \
	dev-inspect-test-environment

PYCI_DEV_DOCKERFILE_PATH := ./dev/dev.test.Dockerfile
PYCI_DEV_IMAGE_NAME      := pyci-dev-environment
PYCI_VENV_NAME           := pyci-env

# this make command builds the virtual environment for pyci
build-pyci-env:
	@python3 -m venv $(PYCI_VENV_NAME) && \
		$(PYCI_VENV_NAME)/bin/pip install -r requirements.txt

# MARK: dev targets

# this make target builds the docker image that is used for development
#   e.g. testing
dev-build-test-environment:
	@echo "building dev docker image..."
	@sudo docker build -t $(PYCI_DEV_IMAGE_NAME) -f $(PYCI_DEV_DOCKERFILE_PATH) .
	@echo "dev docker image build done, image name: $(PYCI_DEV_IMAGE_NAME)"

# this make target runs the dev docker image with a terminal
#   TLDR: you get a /bin/bash shell in the environment
dev-inspect-test-environment:
	@echo "getting /bin/bash shell in dev environment..."
	@sudo docker run --rm -it $(PYCI_DEV_IMAGE_NAME)