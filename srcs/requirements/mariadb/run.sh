if [ ! -d "/run/mysqld" ];
then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi
if [ -d /var/lib/mysql/mysql ];
then
	echo 'MySQL directory already exists.'
else
	echo "MySQL directory doesn't exist. Creating one..."

	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql

	tmp_file=$(mktemp)
	if [ ! -f "$tmp_file" ]
	then
		echo "Failed to create temp file"
		return 1
	fi

	cat << EOF > $tmp_file
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
GRANT SELECT, SHOW VIEW, PROCESS ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;
EOF
		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tmp_file
		echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';" >> $tmp_file
	echo 'FLUSH PRIVILEGES;' >> $tmp_file
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < $tmp_file
	cat $tmp_file > file.txt
	rm -f $tmp_file
fi

echo "Sleeping 5 sec"
sleep 5

echo "Starting all process"
exec /usr/bin/mysqld --user=mysql --console

#---------------------------------#

#CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
#GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
#FLUSH PRIVILEGES;
#GRANT SELECT ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
#FLUSH PRIVILEGES;
#ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

#---------------------------------#

#mysql_install_db --user=root
#mysqld_safe --datadir="/var/lib/mysql" --bootstrap & sleep 3
#echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root --skip-password
#echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';" | mysql -u root --skip-password
#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
#echo "GRANT SELECT ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" | mysql -u root --skip-password
#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" | mysql -u root --skip-password
#mysqld -u root
