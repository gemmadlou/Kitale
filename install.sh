
apt update -y
apt upgrade -y
apt install sudo -y

sudo apt-get install software-properties-common -y
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get install php7.1 php7.1-cli php7.1-common php7.1-xml php7.1-curl php7.1-gd php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm -y

sudo apt-get install apache2 -y

sudo apt-get install vim -y

# The apache2 config that has the global ServerName
cp /var/www/_ops/dir.conf /etc/apache2/mods-available/dir.conf
cp /var/www/_ops/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /var/www/_ops/apache2.conf /etc/apache2/apache2.conf

# Connect PHP to Apache
sudo apt-get install libapache2-mod-php7.1 -y
sudo a2enmod php7.1 rewrite expires headers ssl

sudo service apache2 start -y

# Install wget
sudo apt-get install wget -y

# Installing MySQL

export DEBIAN_FRONTEND=noninteractive

# Import MySQL 5.7 Key
# gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 5072E1F5
echo "deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7" | tee -a /etc/apt/sources.list.d/mysql.list

apt-get update

# Install MySQL

MYSQL_PASS=""

touch /root/.my.cnf
debconf-set-selections <<< "mysql-community-server mysql-community-server/data-dir select ''"
debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password $MYSQL_PASS"
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password $MYSQL_PASS"
sudo apt-get install -y mysql-server

sudo service mysql start

usermod -d /var/lib/mysql/ mysql
{ echo "[client]"; echo "user=root"; echo "password=root"; } >> ~/.my.cnf
chmod 600 ~/.my.cnf
chown root: ~/.my.cnf

# Installing Nodejs

sudo apt-get install curl -y

curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y

nodejs -v
npm -v

sudo apt-get install build-essential -y

# Install composer

./install/composer.sh
mv ./install/composer.phar /usr/local/bin/composer
composer -v