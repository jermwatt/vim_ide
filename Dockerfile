FROM ubuntu:20.04

RUN apt update
RUN apt upgrade -y
RUN apt update 

RUN apt-get update
RUN apt install -y build-essential
RUN apt update
RUN apt install -y curl vim git wget fontconfig
RUN apt update

RUN useradd --user-group --system --create-home --no-log-init ubuntu
USER ubuntu
WORKDIR /home/ubuntu


USER root
COPY .vimrc /root/.vimrc
RUN chmod 755 /root/.vimrc
COPY .vimrc.plug /root/.vimrc.plug
RUN chmod 755 /root/.vimrc.plug

RUN mkdir -p /root/.vim/pack/plugins/start
COPY install_plugins.sh /home/ubuntu/install_plugins.sh
RUN chmod 755 /home/ubuntu/install_plugins.sh
RUN ["sh", "/home/ubuntu/install_plugins.sh"]

RUN wget -P /root/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf

RUN fc-cache -rv
USER ubuntu
RUN rm /home/ubuntu/install_plugins.sh


# Get Rust
# RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

