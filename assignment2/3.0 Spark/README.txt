wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Kay7TkrEr-3u1Q34ObOuEhhibpwAaMPj' -O spark.csv

val inputFile = sc.textFile("/spark.csv")
inputFile.count

val info_res = spark.read.format("com.databricks.spark.csv").option("header", "true").option("delimiter", ",").option("inferSchema", "true").load("/spark.csv")
info_res.printSchema
info_res.registerTempTable("res_table")

!!!! The attribute name ("No.Reviews") cannot be recognized, so I manually changed it to Reviews  !!!!!
But I found a method to address this problem which is using `No.Reviews` instead.

val data = spark.sql("select max(Reviews) Reviews from res_table").collect
val data = spark.sql("select Restaurant from res_table where Reviews=1500").collect

spark.sql("select Restaurant, length(Restaurant) from res_table where length(restaurant)=(select max(length(Restaurant)) from res_table)").collect.foreach(println)

val question4=spark.sql("select Region,sum(Reviews) from res_table group by Region order by 2").collect.foreach(println)

inputFile.flatMap(line => line.split(",")(4).split(" ")).map(word => {if(word!="A"&&word!="The"&&word!="of") (word,1) else (word,0)}).reduceByKey( _ +_).sort

info_res.where(info_res("_c4") === info_res.agg(max("_c4")).first()(0)).show()
alternative approach for Q2




