# docker-pritunl

> A Docker image to easily bootstrap an all-in-one Pritunl server.

## Facts

- Based on CentOS 7
- Using internal MongoDB server
- Pritunl installed from official repository

## Usage

```bash
docker run -d --privileged --name Pritunl \
  -p 1194:1194/udp -p 1194:1194/tcp -p 443:443/tcp \
  jalberto/docker-pritunl
```

The admin console is available at `https://<ip>` afterwards.
