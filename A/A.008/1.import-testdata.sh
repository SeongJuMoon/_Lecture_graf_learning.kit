#!/usr/bin/env bash

cd sql
echo "import test data...\n"
mysql -h 192.168.1.57 -u root -proot < employees.sql
cd ..