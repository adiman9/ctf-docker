# docker build -t ctf:ubuntu19.10 .
# docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib \
net-tools vim gdb gdb-multiarch libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev \
libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386 tmux zsh zlib1g-dev python-setuptools python-dev
WORKDIR /root
RUN git clone https://github.com/pyenv/pyenv.git .pyenv

ENV HOME  /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.7.0 && pyenv global 3.7.0 && pyenv rehash

COPY . .
RUN git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim && vim -c VundleUpdate -c quitall
RUN pip install virtualenvwrapper capstone requests pwntools r2pipe unicorn ropper ropgadget
RUN mkdir -p /opt && cd /opt && git clone https://github.com/danielmiessler/SecLists.git secLists && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && git checkout stable && ./setup.sh && \
cd .. && git clone https://github.com/niklasb/libc-database && cd libc-database && ./get && \
gem install one_gadget
