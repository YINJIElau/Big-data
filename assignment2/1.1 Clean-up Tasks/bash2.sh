#!/bin/bash

while grep -q "-" bashdm-clean.csv ;do
	sed -i.bak "s/-/,/g" bashdm-clean.csv
done
