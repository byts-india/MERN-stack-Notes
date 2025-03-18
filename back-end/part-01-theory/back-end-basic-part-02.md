
# INTRO

Javascript

- **java script** run time environment
- **event driven** architecture
- Events like onclick, onchange, onload and setTimeout callback etc will goes to TASK QUEUE.
- Asynchronous codes like promises and Async await codes will goes to MICRO TASK QUEUE.
- **EVENT LOOP** will check for TASK QUEUE or MICRO TASK QUEUE only if CALL STACK empty.
- MICRO TASK QUEUE has more priority than TASK QUEUE.
- **web workers**
  Web Workers are a simple means for web content to run scripts in background threads. The worker thread can perform tasks without interfering with the user interface.
- v8 javascript engine
  CHROME JS ENGINE

NODE JS

- Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- npm and package.json
  Node package manager used to manage packages.
- package versioning
 eg: 2.3.12
  - major  2
  - minor  3
  - patch  12
- package updating symbols: ~ ^ *
- blocking and non blocking code
  - synchronous or blocking
  - asynchronous or non-blocking
- custom import and export in node js vs venilla js
  - import :
    - using `require()`
  - export :
    - `module.exports = sample;`
    - `module.exports = { sample1, sample2 }`
- Together, `require()` and `module.exports` form the foundation of the CommonJS module system, which is the standard module format used in Node.js.
- client server architecture `vs` peer to peer architecture

# Types of api

- SOAP (Simple Object Access Protocol):
  - SOAP is like sending a letter.
  - When you want to talk to someone,
  - you write a letter with all the details
  - and send it through the mail.
  - SOAP is an older technology.
- REST API :
  - REST : Representational State Transfer
  - API  : Application programming interface
  - With REST, information can be represented and transferred in different forms,
  - **application**:
    - get movies details using API.
- web socket
  - WebSockets are like having a phone call that stays open.
- client server architecture
  - **application**:
    - live chat application.
- WebRTC (Web Real-Time Communication):
  - peer-to-peer protocol
  - **application**:
    - video Conferencing
    - google meet



