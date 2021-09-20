if [ -d "/run/mysqld" ]; then
	echo "mysqld already exists."
	chown -R mysql:mysql /run/mysqld
else
	echo "mysqld not found, creating..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo "MySQL directory already exists."
	chown -R mysql:mysql /var/lib/mysql/mysql
else
	echo "MySQL directory not found, creating..."
	chown -R mysql:mysql /var/lib/mysql/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
	tfile=$(mktemp)
	cat << EOF > $tfile
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

	mysqld -u mysql --bootstrap --skip-networking=0 < $tfile
	rm -f $tfile

fi
	mysqld -u mysql --skip-networking=0
