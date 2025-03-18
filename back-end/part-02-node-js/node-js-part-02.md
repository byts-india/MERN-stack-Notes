# NODE JS

## Different from Javascript

- Node.js:
  - Node.js is a runtime environment that allows you to run JavaScript code on the server-side.
  - It is built on the Chrome V8 JavaScript engine.
  - Node.js enables developers to use JavaScript for server-side scripting, creating dynamic web pages, building web applications, and even for building command-line tools.
  - It provides a rich set of libraries and frameworks (such as Express.js) for building web servers and applications.
  - Node.js is particularly popular for building real-time applications like chat applications, streaming applications, and APIs.

## MODULES in node js

```javascript
// math.js - module file
function add(a, b) {
    return a + b;
}

function subtract(a, b) {
    return a - b;
}

module.exports = {
    add,
    subtract
};
```

```javascript
// main.js - main program
const math = require('./math');

console.log(math.add(5, 3)); // Output: 8
console.log(math.subtract(10, 4)); // Output: 6
```

### Inbuid modules in node js

Node.js comes with several built-in modules that are commonly used for backend development.

- http: `at-least remember this`
  - This module provides HTTP server and client functionality, -
  - allowing you to create web servers and make HTTP requests.
- https: `at-least remember this`
  - Similar to the http module but for HTTPS (HTTP over TLS/SSL).
- fs (File System ): `at-least remember this`
  - This module provides file system-related operations such as reading and writing files, creating directories, and more.
- path: `at-least remember this`
  - The path module provides utilities for working with file and directory paths.
- os (Operating System ): `at-least remember this`
  - This module provides operating system-related utility methods and information, such as CPU architecture, memory, and network interfaces.
- events:
  - The events module provides an event emitter pattern, allowing you to create and handle custom events in your applications.
- util:
  - This module provides utility functions that are helpful for debugging, formatting, and other miscellaneous tasks.
- querystring:
  - The querystring module provides utilities for parsing and formatting URL query strings.
- crypto:
  - This module provides cryptographic functionality, including encryption, decryption, hashing, and more.
- stream:
  - The stream module provides an API for working with streams of data, such as reading from and writing to files, networking, and more.
- zlib:
  - This module provides compression and decompression functionality using the zlib library.
- child_process:
  - This module provides functionality for spawning child processes, allowing you to execute external commands or scripts from your Node.js application.
- url:
  - The url module provides utilities for URL resolution and parsing.
- net:
  - This module provides networking functionality, allowing you to create TCP servers and clients.
- dns:
  - The dns module provides functions for performing DNS (Domain Name System) lookup operations.
- cluster:
  - The cluster module allows you to create child processes (workers) that share server ports, enabling you to take advantage of multi-core systems.
