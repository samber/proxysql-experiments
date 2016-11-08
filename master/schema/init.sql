GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%' IDENTIFIED BY 'password';
GRANT USAGE ON information_schema.* TO 'iadvize'@'%';

FLUSH PRIVILEGES;

SHOW MASTER STATUS;
