# Docker Util

#### Getting started

Create new container
```
docker run -d -p 8000:80 -p 3306:3306 --name="mydockercontainer" -v "$(pwd):/var/www" ubuntu:14.04 tail -f /dev/null
```

Enter into the container's terminal
```
docker exec -it mydockercontainer bash
```

## Useful commands

Get docker's IP

> If you want to be able to have /etc/hosts names configured against an actual IP, you will need to get the 
> IP of the docker container.

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

Query only a certain table
```
mysql -e "select * from myTable" -u myuser -pxxxxxxxx mydatabase > dump.sql
```

#### Orderly Mysql Results

```
PAGER less -SFX
```

Fixing syntax errors:

https://stackoverflow.com/questions/36950857/sqlstate42000-syntax-error-or-access-violation-1055-expression-3-of-select 

```
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
```