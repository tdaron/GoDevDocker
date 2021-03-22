FROM golang:latest

RUN apt-get update -y
RUN apt install -y vim
RUN adduser anonymous --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
USER anonymous
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/anonymous/.vim/bundle/Vundle.vim
COPY .vimrc /home/anonymous/.vimrc
RUN vim +PluginInstall +qall
ENV TERM xterm-256color
RUN vim +GoInstallBinaries +qall
