#!/bin/bash



echo "INDEX,Name,Age,Country,Height,Hair_Colour" >> bashdm-clean4.csv
while read -r line; do
	country_code=$(echo $line | cut -d"," -f4)
	country_name=$(grep $country_code dictionary.csv | cut -d"&" -f3)
	if [ $country_name != "" ]; then
		echo $line | sed s/${country_code}/${country_name}/ >> bashdm-clean4.csv
	fi
done < bashdm-clean3.csv
