#!/bin/bash

while grep -q '"[^"][^"]*,.*"' bashdm-clean.csv ;do
	sed -i.bak 's/\("[^"][^"]*\),\(.*"\)/\1-\2/g' bashdm-clean.csv
done
