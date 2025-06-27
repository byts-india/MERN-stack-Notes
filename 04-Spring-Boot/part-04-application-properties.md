# update `application.properties` file

## pre-requisite

- mysql
- localhost
- port number

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/database_name?createDatabaseIfNotExist=true
spring.datasource.username=sample_username
spring.datasource.password=sample_password
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
server.port=9999
```

## In above case lines of code things to be noticed

`line no 01`

- `spring.datasource.url=jdbc:mysql://localhost:3306/database_name?createDatabaseIfNotExist=true database-name
- you should change `database_name` with your data base name.

`line no 02 and 03`

- replace `sample_username` and `sample_password` with your username and password.

`line no 08`

- replace the port no `9999`, if you want.
- Or else you can keep as it is.
