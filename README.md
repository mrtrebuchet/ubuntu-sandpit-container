# ubuntu-sandpit-container
Simple Dockerfiles to spin up sandbox linux containers

### Commands
##### Build
To build run the below command, using either `Dockerfile.ubuntu` or `Dockerfile.arch`
```bash
docker build --no-cache -t ubuntu-test -f Dockerfile.ubuntu
```

##### Run
To run, I use a temporary docker run command. I don't bother with compose because the images are torn down each time they're used

```bash
docker run --rm -it ubuntu-test
```
