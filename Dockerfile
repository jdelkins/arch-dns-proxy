FROM binhex/arch-base:20160611-01
MAINTAINER jdelkins

# additional files
##################

# add supervisor conf file for app
ADD setup/*.conf /etc/supervisor/conf.d/

# add install bash script
ADD setup/root/*.sh /root/

ADD netflix-no-ipv6-dns-proxy /dns-proxy/

# add pipework
ADD https://raw.githubusercontent.com/jpetazzo/pipework/master/pipework /root/

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/pipework /root/*.sh && \
	/bin/bash /root/install.sh

# docker settings
#################

# expose port for http
EXPOSE 2053

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/root/init.sh"]
