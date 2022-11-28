#SQL in general
#https://beanumber.github.io/sds192/lab-sql.html

library(tidyverse)
library(RMySQL)
db <- dbConnect(
  MySQL(),
  host = "scidb.smith.edu",
  user = "sds192",
  password = "DSismfc@S",
  dbname = "imdb"
)

dbListTables(db)
q <- "select * from kind_type limit 10"
q <- "SELECT *
  FROM title
WHERE title = 'The Empire Strikes Back';"
result = dbSendQuery(db, q) # write query to acces the records from a particular table.
fetch(result)




#https://genome.ucsc.edu/goldenPath/help/mysql.html
library(RMySQL)

mysqlconnection = dbConnect(RMySQL::MySQL(),
                            dbname='hgcentral',
                            host='genome-mysql.soe.ucsc.edu',
                            port=3306,
                            user='genomep', 
                            password = 'password')

dbListTables(mysqlconnection)
q <- "select * from defaultDb limit 10"
result = dbSendQuery(mysqlconnection, q) # write query to acces the records from a particular table.
fetch(result)

mysql --user=genome --host=genome-mysql.soe.ucsc.edu -A -P 3306
