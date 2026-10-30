## Operations

### Create a database 

```aiignore
psql postgres -c "CREATE ROLE stockma WITH LOGIN PASSWORD 'XXXXXXXX';"
psql postgres -c "CREATE DATABASE df_fixdb_1 OWNER cstockman;"
```

### Verify the Creation of the Database
```aiignore
PGPASSWORD=unixmac10 psql -h localhost -U cstockman -d dflib_fix1 

#
# Will drop into postgre command line and the following prompt will be seen: df_fixdb_1=# 
# Use \q to quit out
```

# Commands
|Comman|Description|
|------|-----------|
|psql  |Executes the sql if the database is created |
|pg_isready | Checks the connection status of a postgres server |
