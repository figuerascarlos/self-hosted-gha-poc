FROM ubuntu:latest

ARG RUNNER_VERSION=2.294.0

WORKDIR /home/runner

RUN adduser --disabled-password --gecos "" --uid 1000 runner \
    && groupadd docker \
    && usermod -aG sudo runner \
    && usermod -aG docker runner \
    && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers

RUN apt-get update && apt-get install -y curl vim

RUN curl -o actions-runner-linux-x64-2.${RUNNER_VERSION}.tar.gz \ 
    -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar -xvf actions-runner-linux-x64-2.${RUNNER_VERSION}.tar.gz \
    && rm actions-runner-linux-x64-2.${RUNNER_VERSION}.tar.gz

RUN ./bin/installdependencies.sh

USER runner

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
