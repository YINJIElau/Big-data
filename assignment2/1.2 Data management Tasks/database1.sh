#!/bin/bash

user="myfirstsql"
DB="firstdatabase"
TB="bashdm"

mysql <<EOF
use $DB;

create table if not exists $TB (
number int(50) not null auto_increment primary key,
name varchar(99) not null,
age int(99) not null,
country varchar(99) not null,
height int(99) not null,
hair_colour varchar(99) not null
);

EOF

while read -r var; do
	name=`echo $var | cut -d"," -f2`
	age=`echo $var | cut -d"," -f3`
	country=`echo $var | cut -d"," -f4`
	height=`echo $var | cut -d"," -f5`
	hair=`echo $var | cut -d"," -f6`
	mysql -h localhost -D $DB -e "insert into bashdm (name, age, country, height, hair_colour) values('$name', $age, '$country', $height, '$hair')"
done < bashdm-clean4.csv

