
apt update -y
apt upgrade -y
apt install sudo -y

sudo apt-get install software-properties-common -y
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get install php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm -y

sudo apt-get install apache2 -y

sudo apt-get install vim -y

# The apache2 config that has the global ServerName
cp /var/www/docker/dir.conf /etc/apache2/mods-available/dir.conf
cp /var/www/docker/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /var/www/docker/apache2.conf /etc/apache2/apache2.conf

# Connect PHP to Apache
sudo apt-get install libapache2-mod-php7.1 -y
sudo a2enmod php7.1 rewrite expires headers ssl

sudo service apache2 start -y

# Installing MySQL

touch /root/.my.cnf
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server

sudo service mysql start

usermod -d /var/lib/mysql/ mysql
{ echo "[client]"; echo "user=root"; echo "password=root"; } >> ~/.my.cnf
chmod 600 ~/.my.cnf
chown root: ~/.my.cnf

