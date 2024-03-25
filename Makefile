.PHONY: binary
binary:
	docker buildx build --output=type=local,dest=build .

.PHONY: clean
clean:
	rm -rf build

.PHONY: install
install: binary
	sudo mv build/swaylock /usr/local/bin/swaylock
