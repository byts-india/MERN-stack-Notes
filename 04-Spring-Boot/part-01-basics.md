# starting

## things that we will be using are

1. spring boot
1. hibernate
1. Mysql
1. postman

## what is rest api?

A REST API (also called a RESTful API or RESTful web API) is an application programming interface (API) that conforms to the design principles of the representational state transfer (REST) architectural style.

reference : <https://www.ibm.com/topics/rest-apis#:~:text=A%20REST%20API%20(also%20called,transfer%20(REST)%20architectural%20style>.

Advantage of using Rest API ?

- simple/Standard
- scalable/stateless
- high performance/cache

<http://icecream.com/api/flavour>  👈 resource

CRUD in Rest API
HTTP Request methods used in REST API ?

C - Create - POST
R - Read - GET
U - update - PUT
D - Delete - DELETE

structure of REQUEST

- Header
- Operation - eg : GET
- Endpoint - eg : <http://localhost:9090>
- parameter
- request body

structure of RESPONSE

- data in JSON format mostly
- status code

---

## Project requirement

Api requirement from client
Create Rest API for employee management

Client should be able to

- get a list of product
- create a new product
- update an existing product
- Delete an product

|HTTP Method  |Url path  |Status code  |Description  |
|---------|---------|---------|---------|
|GET     | /api/product        | 200 (OK)        | Get all product        |
|POST     | /api/product        | 201 (CREATED)        | Create a new product         |
|PUT     | /api/product        | 200 (OK)         | Update existing product with id         |
|DELETE     | /api/product/{id}        | 200 (OK)        | Delete an product by id        |

### Tools and technologies we used

- Spring boot 2.5.0
- Spring Data JPA ( Hibernate )
- Lombok Library
- Embedded Tomcat
- MySQL data base
- Maven
- IntelliJ IDEA
- VScode
- Postman Client

### IntelliJ IDEA installation

- download IntelliJ community edition ( which is free )
- IntelliJ ultimate is paid.
