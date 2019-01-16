# docker-cf-python-build
Docker container with CloudFoundry and Python Build tools

```
cd /Users/i830671/Documents/XSA/docker-cf-python-build
docker build --no-cache -t alunde/cf-python-build:latest .
docker build -t alunde/cf-python-build:latest .
docker run -ti -p 22:22 alunde/cf-python-build:latest
docker push alunde/cf-python-build:latest
```

Connect with:
```
vi  /Users/i830671/.ssh/known_hosts ; echo "Root PW is Welcome1" ; ssh root@localhost
ssh root@localhost
```

```
export dockid=$(docker container ls | grep  cf-python-build | cut -d ' ' -f 1) ; echo $dockid ; docker container stop $dockid
```
