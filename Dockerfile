FROM nicferrier/emacs
MAINTAINER nic@ferrier.me.uk
RUN apt-get update
RUN apt-get -y install ssh
RUN apt-get -y install tmux
RUN /etc/init.d/ssh start
RUN ["useradd", "-m", "-s", "/bin/bash", "hack"]
EXPOSE 22
RUN mkdir /home/hack/.ssh
RUN mkdir /home/hack/.ssh/keys
# We can do something better than this with more security but for now this is fine
ADD pubkeys /home/hack/.ssh/authorized_keys
RUN chown -R hack.hack /home/hack/.ssh
ADD startup /
CMD bash startup
