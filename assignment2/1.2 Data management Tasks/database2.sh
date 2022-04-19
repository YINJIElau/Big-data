#!/bin/bash



a=1
while read -r var; do
	number=`echo $var | cut -d"," -f1`
	name=`echo $var | cut -d"," -f2`
	age=`echo $var | cut -d"," -f3`
	country=`echo $var | cut -d"," -f4`
	height=`echo $var | cut -d"," -f5`
	hair_colour=`echo $var | cut -d"," -f6`
	mongo firstdatabase --eval 'db.bashdm.insert({id:"'"$a"'", number: "'"$number"'", name: "'"$name"'", age: "'"$age"'", country: "'"$country"'", height: "'"$height"'", hair_colour: "'"$hair_colour"'" })'
	a=$[$a+1]
done < bashdm-clean4.csv
