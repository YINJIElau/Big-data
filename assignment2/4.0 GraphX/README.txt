import org.apache.spark._
import org.apache.spark.rdd.RDD
import org.apache.spark.util.IntParam
import org.apache.spark.graphx._
import org.apache.spark.graphx.util.GraphGenerators


case class harbour(harbour:String, harbour_number:Long, route:String, route_number:Long)

def parseHarbour(str: String): harbour={val line=str.split(","); harbour(line(0), line(1).toLong, line(2), line(3).toLong)}

var textRdd=sc.textFile("/hadoop_harbour.csv")
val header=textRdd.first()
textRdd=textRdd.filter(row => row!=header)

val harbourRDD = textRdd.map(parseHarbour).cache()
val harbours=harbourRDD.map(harbour =>(harbour.harbour_number, harbour.harbour)).distinct
harbours.take(1)
val nowhere="nowhere"
val harbourMap=harbours.map{case ((harbour_number), harbour) => (harbour_number -> harbour)}.collect.toMap

case class Route(index:Int, route:String, origin:String, dest:String, trip_number:Long)
def parseRoute(str:String): Route={val line=str.split(",");Route(line(0).toInt,line(1),line(2),line(3),line(4).toLong)}


-------Warning: I found the some edge data file's "from" and "to" values are not inclued in harbour data file,
so that I coudn't locate these harbour's id as well as didn't know what these harbours were, so I just deleted som data to 100 rows,
please use edge data file in my submission file.-------------（I tried to ask on ticket system, but still haven't received reply）


var textRDD2 = sc.textFile("/hadoop_edge.csv")
val header2=textRDD2.first()
textRDD2=textRDD2.filter(row => row!=header2)

val testroutesRDD = textRDD2.map(parseRoute).cache()
val idlist = harbourMap.map(_._1).toList
val namelist = harbourMap.map(_._2).toList

val idlist2 : List[Long] = idlist :+ (9999).toLong
idlist2.indexOf(9999)
idlist2.last
idlist2
val namelist2 : List[String] = namelist :+ "nowhere"
namelist2.indexOf("nowhere")
namelist2.last
namelist2

testroutesRDD.take(2)
val routes = testroutesRDD.map(route => ((idlist2(namelist2.indexOf(route.origin)),idlist2(namelist2.indexOf(route.dest))), route.route)).distinct
routes.take(2)
val edges = routes.map{case((org_id, dest_id), route_name) =>Edge(org_id, dest_id, route_name)}
edges.take(1)

val graph=Graph(harbours, edges, nowhere)
graph.vertices.take(2)
graph.edges.take(2)

The content above is about Q1
-----------------------------------------------------



val direction: EdgeDirection = EdgeDirection.Either
graph.collectEdges(direction).collect()

The content above is about Q2
-----------------------------------------------------




graph.edges.filter{case (Edge(org_id, dset_id, route_name))=>route_name=="Heather_Three_hundred_and_eighty-four"}.take(3)

The content above is about Q3
-----------------------------------------------------




def max(a:(VertexId, Int), b:(VertexId, Int)):(VertexId, Int) = {if(a._2>b._2) a else b} 
val maxDegrees: (VertexId, Int) = graph.degrees.reduce(max)

The content above is about Q4
-----------------------------------------------------




graph.collectNeighborIds(EdgeDirection.Either).collect.foreach(n=>println((n._1)+ "'s neighbours:"+ n._2.distinct.mkString(",")))
val question5 = graph.collectNeighborIds(EdgeDirection.Either)
question5.collect
val result = question5.collect.sortBy(r => (r._2.length, r._1.toInt))(Ordering.Tuple2(Ordering.Int.reverse, Ordering.Int.reverse))

The content above is about Q5
-----------------------------------------------------















