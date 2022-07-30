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