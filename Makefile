.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

PROJECT_NAME?=airflow-k8s

k3d-start:  ## Start a new k3d cluster
	@k3d cluster create $(PROJECT_NAME) --agents 2 --registry-create registry:0.0.0.0:8008

k3d-stop:  ## Stop the k3d cluster
	@k3d cluster delete $(PROJECT_NAME)