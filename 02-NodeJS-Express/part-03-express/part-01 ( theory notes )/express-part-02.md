# Basic routing

Routing refers to determining how an application responds to a client request to a particular endpoint, which is a URI (or path) and a specific HTTP request method (GET, POST, and so on).

Each route can have one or more handler functions, which are executed when the route is matched.

Route definition takes the following structure:

`app.METHOD(PATH, HANDLER)`

- `app` is an instance of express.
- `METHOD` is an HTTP request method, in lowercase.
- `PATH` is a path on the server.
- `HANDLER` is the function executed when the route is matched.

## HTTP request methods

- CRUD : **C**reate **R**ead **U**pdate **D**elete

      get    :  request data
             - mostly used when we won't send any data, but we want response from server.
             - [ CRUD Read ]
      post   :  submit data
             -  I will send data, submit new data.
             - [ CRUD Create ]
      put    :  update data
            - [ CRUD Update ]
      patch  :  apply partial modifications      
      delete :  delete a specified resource
            - [ CRUD Delete ]
      head   :  similar to GET, but it requests the headers of the 
               response without the actual content.
              It is often used to check the validity or 
              existence of a resource without downloading the entire content.
      option : is used to describe the communication options for 
               the target resource
              It is commonly used to retrieve information about the
              supported methods and other capabilities of a server.

Respond with Hello World! on the homepage:

```javascript
sampleRouter.get('/', (req, res) => {
  res.send('Hello World!')
})
```

Respond to POST request on the root route (/), the application’s home page:

```javascript
sampleRouter.post('/', (req, res) => {
  res.send('Got a POST request')
})
```

Respond to a PUT request to the /user route:

```javascript
sampleRouter.put('/', (req, res) => {
  res.send('Got a PUT request at /')
})
```

Respond to a DELETE request to the / route:

```javascript
sampleRouter.delete('/', (req, res) => {
  res.send('Got a DELETE request at /user')
})
```

### HTTP response status code

<https://developer.mozilla.org/en-US/docs/Web/HTTP/Status>

- HTTP response status codes indicate whether a specific HTTP request has been successfully completed. Responses are grouped in five classes:
  1. Informational responses (100 – 199)
  2. Successful responses (200 – 299)
  3. Redirection messages (300 – 399)
  4. Client error responses (400 – 499)
  5. Server error responses (500 – 599)

---

How to validate POST and OTHER API calls.

- using POSTMAN.
