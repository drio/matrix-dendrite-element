# references:
# 1. https://github.com/matrix-org/dendrite/blob/main/build/docker/README.md
all:
	@echo "🥳 Pick your targets wisely"

run: keys
	docker-compose -f docker-compose.yml up

.PHONY: keys
keys: mnt
	docker run --rm --entrypoint="" \
		-v $$(pwd)/mnt:/mnt \
		matrixdotorg/dendrite-monolith:latest \
		/usr/bin/generate-keys \
			-private-key /mnt/matrix_key.pem \
			-tls-cert /mnt/server.crt \
			-tls-key /mnt/server.key

mnt:
	mkdir mnt
	cp dendrite.yaml mnt/
