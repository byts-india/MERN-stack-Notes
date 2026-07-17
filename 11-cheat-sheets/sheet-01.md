# cheat sheet

## common annotation

| Annotation               | Purpose               |
| ------------------------ | --------------------- |
| `@SpringBootApplication` | Main class annotation |
| `@Configuration`         | Configuration class   |
| `@Bean`                  | Creates bean manually |
| `@ComponentScan`         | Scans packages        |

## stereotype annotation

| Annotation        | Layer               |
| ----------------- | ------------------- |
| `@Controller`     | MVC controller      |
| `@RestController` | REST API controller |
| `@Service`        | Business logic      |
| `@Repository`     | Database layer      |
| `@Component`      | Generic bean        |

## Request mapping

| Annotation        | HTTP Method |
| ----------------- | ----------- |
| `@RequestMapping` | Any         |
| `@GetMapping`     | GET         |
| `@PostMapping`    | POST        |
| `@PutMapping`     | PUT         |
| `@DeleteMapping`  | DELETE      |
| `@PatchMapping`   | PATCH       |

## constructor injection ( recommended )

```java
@Service
public class UserService {
    private final UserRepository repository;
    public UserService(UserRepository repository) {
        this.repository = repository;
    }
}
```

```java
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository repository;
}
```

## field injection ( not recommended )

```java
@Service
public class UserService {
    @AutoWired
    private final UserRepository repository;
}
```

## IoC Container

### IoC (Inversion of Control) manages:

- Object creation
- Dependency injection
- Bean lifecycle

## Types:

- BeanFactory
- ApplicationContext ✅

### Bean Scope

| Scope     | Meaning                    |
| --------- | -------------------------- |
| Singleton | One object per application |
| Prototype | New object every time      |
| Request   | One object per request     |
| Session   | One object per session     |

## DTO ( Data Transfer Object )

```java
/*
Used to transfer data between layers.
Benefits:    
    Hide sensitive data
    Reduce payload
    Validation
*/
public class UserDTO {
    private String name;
    private String email;
}
```

## Entity annotations

| Annotation          | Purpose                                       |
| ------------------- | --------------------------------------------- |
| `@Entity`           | Marks a class as a database entity            |
| `@Table`            | Maps entity to a table                        |

### @Column Annotation Combinations Cheat Sheet

| Combination                | Example                                                                  | Meaning                            |
| -------------------------- | ------------------------------------------------------------------------ | ---------------------------------- |
| Default                    | `@Column`                                                                | Uses default settings              |
| Rename column              | `@Column(name = "full_name")`                                            | DB column name becomes `full_name` |
| Not null                   | `@Column(nullable = false)`                                              | Cannot store `NULL`                |
| Unique                     | `@Column(unique = true)`                                                 | No duplicate values                |
| Length                     | `@Column(length = 100)`                                                  | Maximum 100 characters             |
| Rename + Not null          | `@Column(name = "email", nullable = false)`                              | Mandatory field                    |
| Rename + Unique            | `@Column(name = "email", unique = true)`                                 | Unique email                       |
| Not null + Unique          | `@Column(nullable = false, unique = true)`                               | Required and unique                |
| Not null + Length          | `@Column(nullable = false, length = 50)`                                 | Required with limit                |
| Unique + Length            | `@Column(unique = true, length = 20)`                                    | Unique value with limit            |
| Rename + Length            | `@Column(name = "username", length = 30)`                                | Custom name with limit             |
| Rename + Not null + Unique | `@Column(name = "email", nullable = false, unique = true)`               | Common for email                   |
| Rename + Not null + Length | `@Column(name = "full_name", nullable = false, length = 100)`            | Mandatory text                     |
| Not null + Unique + Length | `@Column(nullable = false, unique = true, length = 100)`                 | Required, unique, limited          |
| All together               | `@Column(name = "email", nullable = false, unique = true, length = 100)` | Most common combination            |
| Read only                  | `@Column(updatable = false)`                                             | Cannot update later                |
| Insert blocked             | `@Column(insertable = false)`                                            | Spring ignores on insert           |
| Read only after creation   | `@Column(insertable = false, updatable = false)`                         | Managed by DB                      |

### @GeneratedValue Combinations

| Combination | Example                                               | Usage                   |
| ----------- | ----------------------------------------------------- | ----------------------- |
| Default     | `@GeneratedValue`                                     | Spring decides strategy |
| Identity    | `@GeneratedValue(strategy = GenerationType.IDENTITY)` | MySQL auto increment    |
| Sequence    | `@GeneratedValue(strategy = GenerationType.SEQUENCE)` | Oracle/PostgreSQL       |
| Table       | `@GeneratedValue(strategy = GenerationType.TABLE)`    | Separate ID table       |
| Auto        | `@GeneratedValue(strategy = GenerationType.AUTO)`     | Automatic               |

### Relationship Annotation Combinations

- `@OneToMany`
- `@ManyToOne`
- `@OneToOne`
- `@ManyTOMany`

```java
@Column(nullable = false)

@Column(nullable = false, unique = true)

@Column(nullable = false, length = 100)

@Column(nullable = false, unique = true, length = 100)

@OneToMany(
    mappedBy = "user",
    cascade = CascadeType.ALL,
    fetch = FetchType.LAZY
)

@ManyToOne
@JoinColumn(
    name = "department_id",
    nullable = false
)

@OneToOne(
    cascade = CascadeType.ALL,
    fetch = FetchType.LAZY
)

@ManyToMany
@JoinTable(
    name = "student_course",
    joinColumns = @JoinColumn(name = "student_id"),
    inverseJoinColumns = @JoinColumn(name = "course_id")
)
```

## table annotations

| Combination     | Example                                    | Meaning                       |
| --------------- | ------------------------------------------ | ----------------------------- |
| Default         | `@Table`                                   | Uses class name as table name |
| Rename table    | `@Table(name = "users")`                   | Changes table name            |

### single unique column `UNIQUE(email)`

```java
@Entity
@Table(
    uniqueConstraints = {
        @UniqueConstraint(columnNames = "email")
    }
)
public class User {

}
```

### multi unique column  `UNIQUE(email, phone)`

```java
@Entity
@Table(
    uniqueConstraints = {
        @UniqueConstraint(
            columnNames = {
                "email",
                "phone"
            }
        )
    }
)
public class User {

}
```

### Named unique constraint

```java
/*
        CONSTRAINT uk_user_email
        UNIQUE(email)
*/
@Entity
@Table(
    uniqueConstraints = {
        @UniqueConstraint(
            name = "uk_user_email",
            columnNames = "email"
        )
    }
)
public class User {

}
```

### Multiple unique constraints

```java
@Entity
@Table(
    uniqueConstraints = {

        @UniqueConstraint(
            name = "uk_email",
            columnNames = "email"
        ),

        @UniqueConstraint(
            name = "uk_phone",
            columnNames = "phone"
        )
    }
)
public class User { }
```

## index combinations

### single index

```java
/*
CREATE INDEX idx_email
ON users(email);
*/
@Entity
@Table(
    indexes = {
        @Index(
            name = "idx_email",
            columnList = "email"
        )
    }
)
public class User {}
```

### multi index

```java
@Entity
@Table(
    indexes = {
        @Index(
            name = "idx_email",
            columnList = "email"
        ),
        @Index(
            name = "idx_phone",
            columnList = "phone"
        )
    }
)
public class User {}
```

### composite index

```java
/*

*/
@Entity
@Table(
    indexes = {
        @Index(
            name = "idx_email_phone",
            columnList = "email, phone"
        )
    }
)
public class User {}
```

#### example

```java
@Entity
@Table(

    name = "users",

    schema = "admin",

    uniqueConstraints = {

        @UniqueConstraint(
            name = "uk_email",
            columnNames = "email"
        ),

        @UniqueConstraint(
            name = "uk_phone",
            columnNames = "phone"
        )
    },

    indexes = {

        @Index(
            name = "idx_name",
            columnList = "name"
        ),

        @Index(
            name = "idx_email_phone",
            columnList = "email, phone"
        )
    }
)
public class User {}
```
