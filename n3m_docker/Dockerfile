FROM ubuntu:16.04
MAINTAINER mah2250@columbia.edu

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  DEBIAN_FRONTEND=noninteractive apt-get -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential checkinstall && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y libreadline-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y zlib1g-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y  lzop && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y byobu curl git htop man unzip vim wget && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y vim-nox-py2 && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm && \
  rm -rf /var/lib/apt/lists/*

RUN \
  DEBIAN_FRONTEND=noninteractive apt-get -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install sudo  

RUN \
  DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql postgresql-contrib  

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
COPY dotfiles/.vim /home/n3m/.vim 
COPY dotfiles/.vimrc /home/n3m/.vimrc

# Build Python 2.7.12
RUN \
	cd /usr/src && \
	wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz && \
	tar xzf Python-2.7.12.tgz && \
	cd Python-2.7.12 && \
	./configure && \
	make install 

# pip and virtualenv
RUN \
  wget https://bootstrap.pypa.io/get-pip.py && \
  python get-pip.py

RUN \
  pip install virtualenv

ADD fix_permissions.sh /home/n3m/fix_permissions.sh
COPY entrypoint.sh /home/n3m/entrypoint.sh

RUN \
  DEBIAN_FRONTEND=noninteractive apt-get -y install python-psycopg2 && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install libpq-dev


# fix permissions
RUN \
	/bin/bash -c "/home/n3m/fix_permissions.sh"   


USER n3m
ENTRYPOINT ["/home/n3m/entrypoint.sh"]
CMD ["/bin/bash", "--login"]



