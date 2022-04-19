make sure that you have data file (bashdm-clean4.csv) from previous work.

delete the first line of data fiile (the attributes' names) on your local and use docker cp upload it to your container.

chomd u+x database1.sh
./database1.sh
mysql
use firstdatabase
show tables;
select * from bashdm;

mongo
show databases
use firstdatabase
exit
chomd u+x database2.sh
./database2.sh
mongo
use firstdatabase
db.bashdm.find()
exit

Q2,Q3 and Q5 are shown as pictures.
Q4 was completed based on the Q1 mongo part. using a variable a to add another attribute id.

