# Deploying-Java-project-with-database-on-Ubuntu-Linux
## 📌Install Java 17 and check 
```
apt install openjdk-17-jdk openjdk-17-jre
```
```
java -version
```
## 📌Install Maven and check
```
sudo apt install maven -y
```
```
mvn -v
```
## 📌Setup Database
### Step 1: Install Mariadb
```
apt install mariadb-server
```
### Step 2: Stop MariaDB
```
systemctl stop mariadb
```
### Step 3: Edit file 50-server.cnf
```
nano /etc/mysql/mariadb.conf.d/50-server.cnf
```
Edit the line with the following content:
```
bind-address=0.0.0.0
```
### Step 4: Restart MariaDB
```
systemctl restart mariadb
```
### Step 5: Open MySQL with root privileges
```
sudo mysql -u root
```
### Step 6: Create Database and check
```
create database database_name;
```
```
show databases;
```
### Step 7: Create Username and Password
```
create user 'username'@'%' identified by 'password';
```
### Step 8: Grant database permissions to the newly created user
```
grant all privileges on database_name.* to 'username'@'%';
```
```
flush privileges;
```
### Step 9: Check port of mysql
```
netstat -tlpun
```
### Step 10: Change the user who is the owner of the folder project
```
mysql -h IP_server -P port_from_netstat -u username -p
```
### Step 11: Import the .sql file into the database and check
```
use database_name;
```
```
source /path/to/projects/projects_db.sql;
```
```
show tables;
```
### Step 12: Edit config file of database
```
nano src/main/resources/application.properties
```
Edit the 3 lines below:
```
spring.datasource.url=jdbc:mysql://<address_server>:<port>/<database_name>?serverTimezone=UTC
spring.datasource.username=<username>
spring.datasource.password=<password>
```
## 📌Build project without test
```
mvn install -DskipTests=true
```
## 📌Start project
```
java -jar target/projects-SNAPSHOT.jar
```
Open browser and check awesome Java app.
