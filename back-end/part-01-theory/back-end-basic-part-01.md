# BackEnd basics

## concepts

# API & REST API notes

## what is an API ?

- API ( application programming interface )
  - A set of rules and protocols that allow one software application to interact with others.
  - API enable communication betweeen different software systems. Such as client (front-end) and server(back-end)
  - APIs can return data in formats like JSON, XML (or) HTML.

Types of API:
  - [Web API] : used for web-based communications (REST Api, SOAP, GraphQL )
  - [library API] : Used within the prog lang ( python request )
  - [OS system api] : Used to interact with the OS (windows API).

## what is rest API 
  - An architectural style for designing networked applications.
  - It use HTTP protocols and are stateless, meaning each request from a client contains all the information needed for process request.
  - Rest APIs are resource-based and resource are identified by 
  URLs  (uniform resource locater )

### Key principles of REST Apis:
  -[stateless] : server will not store request details 
                  about client.
  -[client server architecture] :
                  hosts: ( client & server )
                        - client: requesting
                        - server: responding
  -[uniform interface]: consistent and standarized way of interacting with resource.
  -[Resource based]: Everything is a resource ( users, products ) identified by urls.
  -[HTTP Methods]: Use standard HTTP Methods for CRUD operations.
    -`GET`: Retrive a resource
    -`POST`: create a new resource
    -`PUT/PATCH`: updating an existing resource
    -`DELETE`: delete a resource
  -[Representation]: Resource are be represented in multiple formats (JSON, XML)

### RestApi examples:

- GET     /users
- GET     /users/12
- POST    /users
- PUT     /users/1
- DELETE  /users/1


HTTP status code
----------------
- 2xx (success)
  * 200 OK : Request successfull
  * 201 CREATED : Resource created successfull
- 4xx (client error)
    408 
- 5xx (server error)


Javascript Object notation ( jSON )

 {
    "name":number, string, object, array
 }

## definitions

- Client:
  - A device or software application that requests services or resources from a server.
  - Clients can range from personal computers, smartphones, tablets, to specialized hardware devices.
- Server:
  - A device or software application that provides services or resources to clients.
  - Servers are typically high-powered computers optimized for processing requests from multiple clients simultaneously.
- [client-server architecture]
 drawing
- Request:
  - A message sent by a client to a server, typically asking for access to a specific resource or service. Requests can take various forms, such as HTTP requests in web applications.
  - HTTP: Hyper Text Transfer Protocol
  - used to transfer HTML pages over network
- Response:
  - A message sent by a server to a client in reply to a request. Responses contain the requested data or indicate the outcome of the request (e.g., success, error).
- Protocol:
  - A set of rules and conventions that govern communication between clients and servers. Common protocols used in client-server architecture include
    - HTTP (Hypertext Transfer Protocol)
    - TCP/IP (Transmission Control Protocol/Internet Protocol)
- Statelessness:
  - In many client-server architectures, servers do not maintain information about the state of client sessions between requests. Each request from a client must contain all the information necessary for the server to fulfill the request. This simplifies server design and scalability but may require additional mechanisms for managing user sessions.
- Database:
  - A structured set of data stored and organized to support the operations, storage, retrieval, modification, and deletion of data.
- SQL database
  - They are table and row oriented. They Use SQL (structured query language) for shaping and manipulating data, which is very powerful. SQL database
  - example:
    - oracle
    - mysql
    - microsoft sql server
    - sqlite
    - Postgre sql
- NoSQL database
  - mongo db ( stored as document )
  - couch db ( stored as document )
  - firebase ( stored as document )
  - graphQL  ( stored as graphs )
  - neo4j    ( stored as graphs )
- API:
  - API (Application Programming Interface): A set of rules and protocols for building and interacting with software applications.
 API is a software interface that allows two applications to interact with each other without any user intervention.
- RESTful API:
  - An architectural style for designing networked applications, based on HTTP and the principles of REST (Representational State Transfer).
- Server-Side Frameworks:
  - Pre-written, standardized code that developers can use to streamline the development process, such as Django (Python), Ruby on Rails (Ruby), or Express.js (JavaScript), spring boot ( java )
- Authentication:
  - The process of verifying the identity of a user or system.
- Authorization:
  - The process of determining whether a user or system has permission to access a particular resource or perform a specific action.
