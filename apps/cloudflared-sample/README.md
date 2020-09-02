
# Cloudflare Argo Tunneling
 
 Sample Dockerfile using Cloudflare Argo tunneling to expose locally hosted flask app to the internet via Cloudflare

**References**

https://developers.cloudflare.com/argo-tunnel/reference/docker/

## Commands to setup Cloudflared
```bash
# Download cloudflared
wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb

# Install cloudflared (for debian)
sudo apt install ./cloudflared-stable-linux-amd64.deb 

# Login to Cloudflare to generate cert.pem. Copy cert.pm into this directory
cloudflared tunnel login

# Modify config.yaml for details of the tunnel like fqdn

# Build the docker image
docker build --tag=oceanebelle/cloudflared-sample .
```

## Options for running
```
# 1. start the dockerized cloudflared flask app
docker run -it --rm oceanebelle/cloudflared-sample

# 2. Start server.py and cloudflared directly for development
pip3 install flask
python3 server.py
cloudflared tunnel --url localhost:8080 --hostname cfd-sample.oceanebelle.com



```
Browse to https://cfd-sample.oceanebelle.com

