#!/bin/bash

cp bashdm.csv bashdm-clean.csv
while grep -q '#]' bashdm-clean.csv ;do
	sed -i.bak 's/#]//' bashdm-clean.csv
done
