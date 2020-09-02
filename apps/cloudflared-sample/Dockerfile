FROM debian

RUN apt-get -yqq update
COPY . /opt/flaskapp 
WORKDIR /opt/flaskapp

# Supervisord

RUN apt-get install -y supervisor 
RUN mkdir -p /var/log/supervisor 
RUN mkdir -p /etc/supervisor/conf.d/ 
COPY supervisord.conf /etc/supervisord.conf

# Cloudflared

RUN apt-get install -y wget 
RUN wget -q -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz | tar xz 
RUN mkdir -p /etc/cloudflared/ 
COPY cert.pem /etc/cloudflared/ 
COPY config.yaml /etc/cloudflared/

# Python and Flask

RUN apt-get -yqq install python3 python3-pip 
RUN pip3 install waitress flask

# Main

CMD ["/usr/bin/supervisord"] 