mkdir -p /run/mysqld
mysql_install_db --user=root
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN_USER'@'%' IDENTIFIED BY $MYSQL_ADMIN_PASSWORD;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "GRANT SELECT ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY $MYSQL_USER_PASSWORD;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
#cat wp_db.sql | mysqld -u root --bootstrap
#mysqld -u root
