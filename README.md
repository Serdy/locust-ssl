# docker-locust

Docker base image for locust master/slave/standalone.

## How to use

This is a base image of locust. So you have to build your own docker image from this image like this.



Then build it and run.

```
$ docker build -t locust .
```
WORKDIR -- /srv/
### standalone

```
$ docker run -e LOCUST_MODE=standalone \
    -v ./locust/:/srv/
    -e SCENARIO_FILE=locustfile.py \
    -e TARGET_URL=http://127.0.0.1 locust-test
```

### distribution

#### master

```
$ docker run \
  -e LOCUST_MODE=master \
  -e TARGET_URL=http://<your-target-server> \
  locust-test
```

#### slave

```
$ docker run \
  -e LOCUST_MODE=slave \
  -e MASTER_HOST=http://<master-server-ip> \
  -e TARGET_URL=https://<your-target-server> \
  locust-test
```
