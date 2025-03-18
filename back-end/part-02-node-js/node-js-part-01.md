# NODE JS INTRO

Node.js (Node js) is an open-source and cross-platform JavaScript runtime environment. It runs on Chrome’s V8 JavaScript engine. It allows developers to run JavaScript code on the server. Node.js enables developers to get into the server-side world.

- What is Node.js?
  - Node.js is an open source server environment that uses JavaScript on server.
  - A Node.js application runs within a single process,
  - without generating a new thread for each request.
  - Node.js includes asynchronous I/O primitives as a part of its standard library,
  - which prevents JavaScript code from blocking and,
  - in general, libraries in Node.js are developed using non-blocking paradigms.
  - This makes blocking behavior the exception instead of the rule.

Example of Node.js Applications

```javascript
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Welcome to GeeksforGeeks Node.js Tutorial');
}).listen(8080);
```

## Why to learn Node.js?

- Node.js is famous due to the use of JavaScript across the entire stack,
- asynchronous programming model for handling multiple requests simultaneously,
- fast execution due to the V8 engine,
- large and active community support,
- scalability for real-time applications,
- cross-platform compatibility,
- and its role in enabling full-stack development.
- All these features make Node.js very fast and popular.

Key Features of Node.js:

- JavaScript Everywhere:
  - Node.js enables developers to use JavaScript across the entire stack, from front-end to back-end.
  - This consistency simplifies development and reduces context switching.
- Asynchronous Programming Model:
  - Node.js uses an event-driven,
  - non-blocking (asynchronous) I/O model.
  - This allows handling multiple requests simultaneously without blocking the execution of other tasks.
  - As a result, Node.js applications are highly responsive and efficient.
- Fast Execution:
  - Node.js leverages the V8 engine,
  - developed by Google, which compiles and executes JavaScript at lightning speeds.
  - This performance advantage makes it suitable for real-time applications and microservices.
- Large and Active Community:
  - Node.js has a vibrant community of developers, libraries, and tools.
  - You’ll find extensive resources, tutorials, and support to enhance your learning experience.
- Scalability:
  - Node.js is lightweight and scalable,
  - making it an excellent choice for building real-time applications, RESTful APIs, and microservices.
- Cross-Platform Compatibility:
  - Node.js runs on Windows, Linux, Unix, macOS, and more.
  - This flexibility allows developers to write code once and deploy it anywhere.
