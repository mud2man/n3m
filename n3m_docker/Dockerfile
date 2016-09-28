FROM ubuntu:16.04
MAINTAINER mah2250@columbia.edu

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  DEBIAN_FRONTEND=noninteractive apt-get -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y git vim wget tmux && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y vim-nox-py2 && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install python-psycopg2 && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip python-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install sudo && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql postgresql-contrib libpq-dev 

RUN \
  echo "America/New_York" > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata && \
	locale-gen en_US && \
	locale-gen en_US.UTF-8

RUN useradd -ms /bin/bash -d /home/n3m n3m
RUN echo n3m:n3mP@ss | chpasswd

# Add files. The consecutive uses of USER give each cp the correct permissions.
COPY dotfiles/.bash_profile /home/n3m/.bash_profile
COPY dotfiles/.bashrc /home/n3m/.bashrc
COPY dotfiles/.inputrc /home/n3m/.inputrc
COPY dotfiles/.git-completion.bash /home/n3m/.git-completion.bash 
COPY dotfiles/.tmux-completion.bash /home/n3m/.tmux-completion.bash 
COPY dotfiles/.tmux.conf /home/n3m/.tmux.conf 
COPY dotfiles/.vimrc /home/n3m/.vimrc

RUN \
  pip install virtualenv

ADD fix_permissions.sh /home/n3m/fix_permissions.sh
COPY entrypoint.sh /home/n3m/entrypoint.sh


#install vundle for vim dev
RUN \
  git clone https://github.com/VundleVim/Vundle.vim.git /home/n3m/.vim/bundle/Vundle.vim 


# fix permissions
RUN \
	/bin/bash -c "/home/n3m/fix_permissions.sh"   


USER n3m
ENTRYPOINT ["/home/n3m/entrypoint.sh"]
CMD ["/bin/bash", "--login"]



