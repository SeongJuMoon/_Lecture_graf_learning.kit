#!/usr/bin/env bash

cd sql
echo "initalize test data...\n"
mysql -h 192.168.1.97 -u root -proot < employees.sql
cd ..