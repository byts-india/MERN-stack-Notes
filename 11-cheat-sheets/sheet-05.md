# ResponseEntity notes

# Spring Boot `ResponseEntity` Cheat Sheet

---

# What is `ResponseEntity`?

`ResponseEntity<T>` represents the complete HTTP response.

It allows you to control:

* Response body
* HTTP status code
* Headers

---

# Syntax

```java
ResponseEntity<T>
```

* `T` → Response body type.

Examples:

```java
ResponseEntity<User>

ResponseEntity<List<User>>

ResponseEntity<String>

ResponseEntity<Void>
```

---

# Why use `ResponseEntity`?

Without `ResponseEntity`:

```java
@GetMapping("/{id}")
public User getUser() {

    return user;
}
```

Spring automatically returns:

```http
200 OK
```

With `ResponseEntity`:

```java
@GetMapping("/{id}")
public ResponseEntity<User> getUser() {

    return ResponseEntity.ok(user);
}
```

You can customize:

* Status code
* Headers
* Response body

---

# Common Methods

| Method                  | Status Code | Example                                |
| ----------------------- | ----------- | -------------------------------------- |
| `ok()`                  | `200`       | `ResponseEntity.ok()`                  |
| `ok(body)`              | `200`       | `ResponseEntity.ok(user)`              |
| `status()`              | Custom      | `ResponseEntity.status(201)`           |
| `created()`             | `201`       | `ResponseEntity.created(uri)`          |
| `accepted()`            | `202`       | `ResponseEntity.accepted()`            |
| `noContent()`           | `204`       | `ResponseEntity.noContent()`           |
| `badRequest()`          | `400`       | `ResponseEntity.badRequest()`          |
| `notFound()`            | `404`       | `ResponseEntity.notFound()`            |
| `internalServerError()` | `500`       | `ResponseEntity.internalServerError()` |

---

# Most Common Combinations

## 1. Success Response (200)

```java
return ResponseEntity.ok(user);
```

Response:

```http
HTTP/1.1 200 OK
```

---

## 2. Created (201)

```java
return ResponseEntity
        .status(HttpStatus.CREATED)
        .body(user);
```

or

```java
URI uri = URI.create("/users/1");

return ResponseEntity
        .created(uri)
        .body(user);
```

Response:

```http
HTTP/1.1 201 Created
```

---

## 3. Accepted (202)

```java
return ResponseEntity
        .accepted()
        .body("Request accepted");
```

---

## 4. No Content (204)

```java
return ResponseEntity
        .noContent()
        .build();
```

Response:

```http
HTTP/1.1 204 No Content
```

Used after delete operations.

---

## 5. Bad Request (400)

```java
return ResponseEntity
        .badRequest()
        .body("Invalid email");
```

Response:

```http
HTTP/1.1 400 Bad Request
```

---

## 6. Not Found (404)

```java
return ResponseEntity
        .notFound()
        .build();
```

Response:

```http
HTTP/1.1 404 Not Found
```

---

## 7. Internal Server Error (500)

```java
return ResponseEntity
        .internalServerError()
        .body("Something went wrong");
```

---

# HTTP Status Cheat Sheet

| Status                  |  Code | Usage            |
| ----------------------- | ----: | ---------------- |
| `OK`                    | `200` | Fetch success    |
| `CREATED`               | `201` | Insert success   |
| `ACCEPTED`              | `202` | Processing       |
| `NO_CONTENT`            | `204` | Delete success   |
| `BAD_REQUEST`           | `400` | Invalid request  |
| `UNAUTHORIZED`          | `401` | Login required   |
| `FORBIDDEN`             | `403` | Access denied    |
| `NOT_FOUND`             | `404` | Resource missing |
| `CONFLICT`              | `409` | Duplicate data   |
| `INTERNAL_SERVER_ERROR` | `500` | Server issue     |

---

# Response Body Types

## String

```java
ResponseEntity<String>
```

```java
return ResponseEntity.ok("Success");
```

---

## Entity

```java
ResponseEntity<User>
```

```java
return ResponseEntity.ok(user);
```

---

## List

```java
ResponseEntity<List<User>>
```

```java
return ResponseEntity.ok(users);
```

---

## DTO

```java
ResponseEntity<UserDto>
```

```java
return ResponseEntity.ok(dto);
```

---

## Map

```java
ResponseEntity<Map<String, Object>>
```

```java
Map<String, Object> response = Map.of(
        "message", "Success",
        "data", user
);

return ResponseEntity.ok(response);
```

---

## No body

```java
ResponseEntity<Void>
```

```java
return ResponseEntity
        .noContent()
        .build();
```

---

# Add Headers

```java
return ResponseEntity
        .ok()
        .header("version", "1.0")
        .body(user);
```

---

# Multiple Headers

```java
return ResponseEntity
        .ok()
        .header("token", token)
        .header("app", "spring")
        .body(user);
```

---

# Generic API Response DTO

```java
public class ApiResponse<T> {
    private String message;
    private T data;
    private boolean success;
}
```

Controller:

```java
ApiResponse<User> response =
        new ApiResponse<>();

return ResponseEntity.ok(response);
```

---

# Real Project Examples

## GET

```java
@GetMapping("/{id}")
public ResponseEntity<UserDto> getUser(
        @PathVariable Long id
) {
    UserDto dto = service.find(id);
    return ResponseEntity.ok(dto);
}
```

---

## POST

```java
@PostMapping
public ResponseEntity<UserDto> create(
        @RequestBody UserDto dto
) {
    UserDto saved =
            service.save(dto);
    return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(saved);
}
```

---

## DELETE

```java
@DeleteMapping("/{id}")
public ResponseEntity<Void> delete(
        @PathVariable Long id
) {
    service.delete(id);
    return ResponseEntity
            .noContent()
            .build();
}
```

---

# Method Chaining

```java
return ResponseEntity
        .status(HttpStatus.CREATED)
        .header("version", "1.0")
        .body(user);
```

---

# Interview Questions

| Question                                                 | Answer                                       |
| -------------------------------------------------------- | -------------------------------------------- |
| Why use `ResponseEntity`?                                | Control body, status, headers                |
| Can we return custom status?                             | Yes                                          |
| Difference between `@ResponseBody` and `ResponseEntity`? | `ResponseEntity` controls status and headers |
| Can `ResponseEntity` return JSON?                        | Yes                                          |
| Can it return HTML?                                      | Yes                                          |
| Can it return files?                                     | Yes                                          |
| Can it return nothing?                                   | Yes, `ResponseEntity<Void>`                  |

---

# Most Used in Projects

```java
ResponseEntity.ok(data)
ResponseEntity.status(HttpStatus.CREATED).body(data)
ResponseEntity.noContent().build()
ResponseEntity.badRequest().body(message)
ResponseEntity.notFound().build()
ResponseEntity.internalServerError().body(message)
```

---

# Quick Rule

```text
GET     → 200 OK
POST    → 201 CREATED
PUT     → 200 OK
PATCH   → 200 OK
DELETE  → 204 NO CONTENT
Wrong Request → 400 BAD REQUEST
Not Found → 404 NOT FOUND
Server Error → 500 INTERNAL SERVER ERROR
```
