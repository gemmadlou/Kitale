# Docker Util

#### Useful commands

Create new container
```
docker run -d -p 3306:3306 --name="mydockercontainer" -v "$(pwd):/var/www" ubuntu:14.04 tail -f /dev/null
```

Enter into the container's terminal
```
docker exec -it mydockercontainer bash
```

Get docker's IP
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <CONTAINER_NAME>
```

Check if a the apache config is correct
```
sudo apache2ctl configtest
```

#### Adding MySQL users

```
GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';
```

#### Orderly Mysql Results

```
PAGER less -SFX
```