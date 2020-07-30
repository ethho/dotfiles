FROM ubuntu:latest
WORKDIR /root
RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get install -yq zsh python3 python3-pip python3-venv vim curl git

COPY . /root/dotfiles
RUN rm $HOME/.bashrc

