
Setup
--

**Step 1**

Setup a MySQL cluster (1 master + 1 slave)

```
docker-compose up -d master slave
```

**Step 2**

Display bin logs of master and slave

In 2 differents terminals:

```
$ docker-compose exec master tail -f /var/log/mysql/slow-query.log
```
```
$ docker-compose exec slave tail -f /var/log/mysql/slow-query.log
```

**Step 3**

Start ProxySQL and display logs

```
$ docker-compose up router
```

**Step 4**

Execute some commands from a MySQL client, into the router, and see what happens and where commands are executed in master + slave logs

```
$ docker-compose run --rm cli

mysql> USE iadvize;
Query OK, 0 rows affected (0.42 sec)

mysql> CREATE TABLE users ( id int, name varchar(255) );
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO users (id, name) VALUES (1, "foobar");
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM users;
```

**Step 5 (optional)**

Edit ProxySQL configuration

```
mysql -u admin -padmin -P6033 -h 127.0.0.1
```