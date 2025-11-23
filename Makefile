IMAGE_NAME := ghcr.io/tvaroska/skills_image
TAG := 2.1.0

run:
	docker run -v $(PWD)/output:/app/output $(IMAGE_NAME):$(TAG)
