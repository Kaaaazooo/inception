mkdir -p /run/mysqld
mysql_install_db --user=$MYSQL_ADMIN_USER
cat wp_db.sql | mysqld -u $MYSQL_ADMIN_USER --bootstrap
mysqld -u $MYSQL_ADMIN_USER
