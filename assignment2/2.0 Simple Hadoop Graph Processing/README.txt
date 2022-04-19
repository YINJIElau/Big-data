wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1SrurEuPrw04S6afIPXl1WKuL73JRuULT' -O hadoop.csv

apt update
apt install wget ca-certificates nano

hdfs dfs -mkdir /input
hdfs dfs -put ./hadoop.csv /input

chmod u+x WordCount1.java
chmod u+x WordCount2.java
chmod u+x WordCount3.java
chmod u+x WordCount4.java
chmod u+x WordCount51.java
chmod u+x WordCount52.java

export HADOOP_CLASSPATH=/usr/lib/jvm/java-1.8.0-openjdk-amd64/lib/tools.jar
hadoop com.sun.tools.javac.Main WordCount1.java
jar cf wc.jar WordCount1*.class
hadoop jar wc.jar WordCount1 /input /output1
hdfs dfs -cat /output1/part-r-00000

hadoop com.sun.tools.javac.Main WordCount2.java
jar cf wc.jar WordCount2*.class
hadoop jar wc.jar WordCount2 /input /output2
hdfs dfs -cat /output2/part-r-00000

hadoop com.sun.tools.javac.Main WordCount3.java
jar cf wc.jar WordCount3*.class
hadoop jar wc.jar WordCount3 /input /output3
hdfs dfs -cat /output3/part-r-00000

hadoop com.sun.tools.javac.Main WordCount4.java
jar cf wc.jar WordCount4*.class
hadoop jar wc.jar WordCount4 /input /output4
hdfs dfs -cat /output4/part-r-00000

hadoop com.sun.tools.javac.Main WordCount51.java
jar cf wc.jar WordCount51*.class
hadoop jar wc.jar WordCount51 /input /output5
hdfs dfs -cat /output5/part-r-00000


