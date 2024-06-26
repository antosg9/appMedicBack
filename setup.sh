#!/bin/bash

BACK_IMAGE="app-medic-back"
BACK_CONTAINER="app-medic-back"

setup_back() {
    python -m venv ".venv"
    source ".venv/bin/activate"
    pip install -r "requirements.txt"
}



build_back() {
    setup_back
    docker build -t $BACK_IMAGE .
}



start_back() {
    docker run -d --name $BACK_CONTAINER -p 3000:3000 $BACK_IMAGE
}



start() {
    start_back
    start_front
}

stop() {
    docker stop $BACK_CONTAINER  || true
    docker rm $BACK_CONTAINER  || true
}

pre_commit() {
    pre-commit run --all-files
}

clean() {
    stop
    docker rmi $BACK_IMAGE  || true
}

all() {
    build_back

}

case "$1" in
    "setup-back")
        setup_back
        ;;
    "build-back")
        build_back
        ;;
    "start-back")
        start_back
        ;;
    "start")
        start
        ;;
    "stop")
        stop
        ;;
    "pre-commit")
        pre_commit
        ;;
    "clean")
        clean
        ;;
    "all")
        all
        ;;
    *)
        echo "Usage: $0 {setup-back|build-back|start-back|start|stop|pre-commit|clean|all}"
        exit 1
        ;;
esac