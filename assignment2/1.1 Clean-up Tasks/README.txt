wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1FDqa2hJ9rPhLG1YEcvHlfUliLym1ul4u' -O bashdm.csv
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1h62yHjiRXMElbusQdCOM6W0_kgr-sQiv' -O dictionary.csv

chmod u+x bash1.sh
./bash1.sh
cat bashdm-clean.csv

chmod u+x bash2.sh
./bash2.sh
cat bashdm-clean.csv

chmod u+x bash2-1.sh
./bash2-1.sh
cat bashdm-clean.csv

chmod u+x bash3.sh
./bash3.sh
cat bashdm-clean3.csv

chmod u+x bash4.sh
./bash4.sh
head bashdm-clean3.csv
head bashdm-clean4.csv

chmod u+x bash5.sh
./bash5.sh


