# sheet for HTTP METHODS USAGE

| Annotation        | Usage                       | Purpose            |
| ----------------- | --------------------------- | ------------------ |
| `@Controller`     | `@Controller`               | Returns HTML pages |
| `@RestController` | `@RestController`           | Returns JSON/XML   |
| `@RequestMapping` | `@RequestMapping("/users")` | Base URL           |
| `@CrossOrigin`    | `@CrossOrigin("*")`         | Enable CORS        |

| HTTP Method | Annotation        | Purpose              |
| ----------- | ----------------- | -------------------- |
| GET         | `@GetMapping`     | Fetch data           |
| POST        | `@PostMapping`    | Create data          |
| PUT         | `@PutMapping`     | Full update          |
| PATCH       | `@PatchMapping`   | Partial update       |
| DELETE      | `@DeleteMapping`  | Delete data          |
| Any         | `@RequestMapping` | Supports all methods |

| Combination               | URL        |
| ------------------------- | ---------- |
| `@GetMapping`             | `/users`   |
| `@GetMapping("/{id}")`    | `/users/1` |
| `@PostMapping`            | `/users`   |
| `@PutMapping("/{id}")`    | `/users/1` |
| `@DeleteMapping("/{id}")` | `/users/1` |

| HTTP Method | URL           | Annotation                |
| ----------- | ------------- | ------------------------- |
| GET         | `/users`      | `@GetMapping`             |
| GET         | `/users/{id}` | `@GetMapping("/{id}")`    |
| POST        | `/users`      | `@PostMapping`            |
| PUT         | `/users/{id}` | `@PutMapping("/{id}")`    |
| PATCH       | `/users/{id}` | `@PatchMapping("/{id}")`  |
| DELETE      | `/users/{id}` | `@DeleteMapping("/{id}")` |

| Annotation        | Example         | Purpose         |
| ----------------- | --------------- | --------------- |
| `@PathVariable`   | `/users/{id}`   | URL variable    |
| `@RequestParam`   | `?page=1`       | Query parameter |
| `@RequestBody`    | JSON body       | Request payload |
| `@RequestHeader`  | `Authorization` | Read headers    |
| `@CookieValue`    | `JSESSIONID`    | Read cookies    |
| `@ModelAttribute` | Form object     | Form data       |
| `@RequestPart`    | File upload     | Multipart data  |

| Return Type            | Example            |
| ---------------------- | ------------------ |
| `String`               | HTML page          |
| `User`                 | Single JSON object |
| `List<User>`           | JSON array         |
| `ResponseEntity<User>` | Full HTTP response |
| `Page<User>`           | Paginated response |
| `void`                 | No response body   |
| `Optional<User>`       | Optional object    |
