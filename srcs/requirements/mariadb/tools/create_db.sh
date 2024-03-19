#!/bin/bash

# Comandos db para crear y configurar la base de datos:
# Crea la base de datos si no existe
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"
# Crea el usuario y la contraseña 
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PWD}';"
# Otorga privilegios al usuria creado
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';"
# Crea una contraseña para root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
# Se apaga la base de datos una vez configurada
mariadb-admin -u root -p${SQL_ROOT_PWD} -hlocalhost shutdown

echo "Database configurated"
