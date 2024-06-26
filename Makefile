
BACK_IMAGE=app-medic-back
BACK_CONTAINER=app-medic-back

.PHONY: all setup-back  build-back  start-back  start stop pre-commit clean

setup-back:
	python -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt



build-back: setup-back
	docker build -t $(BACK_IMAGE) .



start-back:
	docker run -d --name $(BACK_CONTAINER) -p 3000:3000 $(BACK_IMAGE)



start: start-back

stop:
	docker stop $(BACK_CONTAINER) || true
	docker rm $(BACK_CONTAINER) || true

pre-commit:
	pre-commit run --all-files

clean: stop
	docker rmi $(BACK_IMAGE)  || true

all: build-back