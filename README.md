# docker-pritunl

> A Docker image to easily bootstrap an all-in-one Pritunl server.

## Facts

- Based on CentOS 7
- Rebuild every time CentOS is updated
- Using internal MongoDB server
- Pritunl installed from official development repository
- Manually rebuild every time a new version is released

## Usage

```bash
docker run -d --privileged --name Pritunl \
  -p 1194:1194/udp -p 1194:1194/tcp -p 9700:9700/tcp \
  michelkaeser/docker-pritunl
```

The admin console is available at `https://<ip>:9700` afterwards.