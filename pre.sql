/** create a new database **/
CREATE DATABASE dbname CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/** create new user **/
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'username' AND Host = 'localhost';

/** grant db privilege to new user **/
GRANT ALL PRIVILEGES ON dbname.* to 'username'@'localhost';

FLUSH PRIVILEGES;
