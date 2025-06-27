
# intro

- why express
- postman ?
- ACCOUNT CREATION:
  - <https://web.postman.co/>
  - create free account
  - Now account has be created
  - workspace > create workspace
    - Blank workspace
    - Only me (personal)
    - create new collection
- add request

## REST-API

- REST architecture
- separate API into logical resources
- Expose structured resource based urls
- use http methods (verbs)
- send data as JSON (usually)
- be stateless
- REST uses less bandwidth, simple and flexible making it more suitable for internet usage.
- It’s used to fetch or give some information from a web service.
- All communication done via REST API uses only HTTP request.

### HOW REST_API WORKS ?

- Working:
  - A request is sent from client to server in the form of a web URL as HTTP GET or POST or PUT or DELETE request.
  - After that, a response comes back from the server in the form of a resource which can be anything like HTML, XML, Image, or JSON.
  - But now JSON is the most popular format being used in Web Services.

In the context of Node.js, "packages" and "modules" refer to different aspects of organizing and distributing code, but they are closely related:

## Modules

- Modules in Node.js are individual files or directories that contain JavaScript code.
- They encapsulate reusable functionality and allow you to organize code into separate, manageable units.
- Modules can be imported into other modules using the require( ) function or ES6 import statement.
- Node.js provides built-in modules, which are modules that come pre-installed with Node.js and can be imported into your code using require( ).

## Packages

- Packages in Node.js are collections of one or more modules, along with a package.json file that describes the package's metadata and dependencies.
- Packages are typically distributed via the npm (Node Package Manager) registry, which is a centralized repository of open-source Node.js packages.
- Packages can be installed into your Node.js project using the npm install command or yarn add command, which downloads the package and its dependencies and adds them to your project's node_modules directory.
- Packages can be published publicly to the npm registry or kept private for internal use within an organization.
