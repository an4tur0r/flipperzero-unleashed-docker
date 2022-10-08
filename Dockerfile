FROM amd64/ubuntu:latest

ENV REPO_URL https://github.com/DarkFlippers/unleashed-firmware.git
ARG REF_TAG

RUN apt-get update && \
    apt-get install -y git curl python3.10-dev python3.10 build-essential && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10 && \
    git clone --depth 1 --branch $REF_TAG $REPO_URL flipperzero-unleashed

WORKDIR flipperzero-unleashed

RUN python3.10 -m pip install -r scripts/requirements.txt && ./fbt

CMD ["bash"]

