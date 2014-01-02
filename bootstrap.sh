#!/usr/bin/env bash

#apt-get update
#apt-get install -y apache2
#rm -rf /var/www
#ln -fs /vagrant /var/www

#apt-get update
#apt-get upgrade -y
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

# OR
#unset UCF_FORCE_CONFFOLD
#export UCF_FORCE_CONFFNEW=YES
#ucf --purge /boot/grub/menu.lst
#export DEBIAN_FRONTEND=noninteractive
#apt-get update
#apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade


#echo "deb http://www.apache.org/dist/cassandra/debian 10x main" >> /etc/apt/sources.list  
#echo "deb-src http://www.apache.org/dist/cassandra/debian 10x main" >> /etc/apt/sources.list

#apt-get install curl -y
#apt-get install openjdk-7-jdk -y

JRE=jre-7u45-linux-x64.rpm
CASSANDRA=apache-cassandra-2.0.3-bin.tar.gz

wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/$JRE" -O /tmp/$JRE --no-check-certificate

yum remove java-1.6.0-openjdk

rpm -i /tmp/$JRE
rm -rf /tmp/$JRE
#alternatives --install /usr/bin/java java /usr/java/jre1.7.0_45/bin/java 20000
#alternatives --set java /usr/java/jre1.7.0_45/bin/java

#echo "deb http://www.duinsoft.nl/pkg debs all" | sudo tee -a /etc/apt/sources.list.d/duinsoft.list
#sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5CB26B26
#sudo apt-get update
#sudo apt-get install update-sun-jre -y

#cat << EOF >> /etc/yum.repos.d/datastax.repo
#[datastax] 
#name = DataStax Repo for Apache Cassandra
#baseurl = http://rpm.datastax.com/community
#enabled = 1
#gpgcheck = 0
#EOF

#yum install dsc20 # had dependency on openjdk!! (and even 1.6!)
curl -L -o /tmp/$CASSANDRA http://psg.mtu.edu/pub/apache/cassandra/2.0.3/$CASSANDRA

mv /tmp/$CASSANDRA /opt/
cd /opt/
tar -xzf $CASSANDRA
rm -rf /opt/$CASSANDRA

mkdir -p /var/log/cassandra/
mkdir -p /var/lib/cassandra/saved_caches
mkdir -p /var/lib/cassandra/commitlog
mkdir -p /var/lib/cassandra/data

curl -o /etc/init.d/cassandra https://gist.github.com/MartinSchadePearson/8213677/raw/4c74f4a9fe012a62ee7c918567d7a5d95d5e4708/cassandra
chmod 755 /etc/init.d/cassandra

cd /opt/apache-cassandra-2.0.3
chkconfig --add cassandra
service cassandra start

#echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
#curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
#sudo apt-get update
#apt-get install dsc20 -y
#service cassandra start

#gpg --keyserver pgp.mit.edu --recv-keys 4BD736A82B5C1B00
#gpg --export --armor 4BD736A82B5C1B00 | sudo apt-key add -
#sudo apt-get update  
#apt-get install cassandra	

