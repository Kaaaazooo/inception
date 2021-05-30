mkdir -p /run/mysqld
mysql_install_db --user=root
cat wp_db.sql | mysqld -u root --bootstrap
mysqld -u root
