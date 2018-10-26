install.packages("sparklyr")
library(sparklyr)

if(nchar(Sys.getenv("WORK_LOCAL")) < 1){
  if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
    Sys.setenv(SPARK_HOME = "~/spark/spark-2.3.0-bin-hadoop2.7")
    spark_install(version = "2.3.0")
  }
  wsc <- spark_connect(master = "local")
  
} else{
  #databricks remote
  library(SparkR)
  sparkR.session()
  wsc <- spark_connect(method = "databricks")
}


