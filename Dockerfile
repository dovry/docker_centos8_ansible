FROM centos:8
LABEL maintainer="Dovry"
ENV container=docker
ENV script_url "https://raw.githubusercontent.com/Dovry/ansible-install-script/master/ansible_convenience_script.sh"

# Install required packages
RUN yum makecache --timer \
  && yum -y install wget
    
# Install ansible
RUN wget $script_url \
  && chmod +x ansible_convenience_script.sh \
  && bash ./ansible_convenience_script.sh \
  && rm -f ansible_convenience_script.sh \
  && yum clean all

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]