
# Cloudflare Argo Tunneling
 
 Sample Dockerfile using Cloudflare Argo tunneling to expose locally hosted flask app to the internet via Cloudflare

**References**

https://developers.cloudflare.com/argo-tunnel/reference/docker/

## Commands to setup Cloudflared
```bash
# Download cloudflared
$ wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb

# Install cloudflared (for debian)
$ sudo apt install ./cloudflared-stable-linux-amd64.deb 

# Login to Cloudflare to generate cert.pem. Copy cert.pem into this directory
$ cloudflared tunnel login

# Modify config.yaml for details of the tunnel like fqdn hostname


# Build the docker image
$ docker build --tag=oceanebelle/cloudflared-sample .

# Or use docker-compose
$ docker-compose up -d && docker-compose logs -f cfd-sample
# stop docker-compose
$ docker-compose stop && docker-compose rm -f
```

## Options for running
```bash
# 1. start the dockerized cloudflared flask app. mount the cert.pem generated from the cloudflare tunnel login
$ docker run -it --rm -v `pwd`/cert.pem:/etc/cloudflared/cert.pem oceanebelle/cloudflared-sample

# 2. Start server.py and cloudflared directly for local development on domain configured for the argo tunnel
$ pip3 install waitress flask
$ python3 server.py
$ cloudflared tunnel --url localhost:8080 --hostname cfd-sample.oceanebelle.com

# 3. Start using docker-compose which includes volume mapping for external certifcate
$ docker-compose up

```
Browse to https://cfd-sample.oceanebelle.com

