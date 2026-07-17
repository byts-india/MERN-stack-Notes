# Repository cheat sheet. 

## JpaRepository Default Methods Cheat Sheet

- already provides CRUD, pagination, sorting, and batch operations.

### save methods

| Method                      | Return Type | Purpose                           |
| --------------------------- | ----------- | --------------------------------- |
| `save(entity)`              | `T`         | Insert or update one record       |
| `saveAll(entities)`         | `List<T>`   | Insert/update multiple records    |
| `saveAndFlush(entity)`      | `T`         | Save immediately to DB            |
| `saveAllAndFlush(entities)` | `List<T>`   | Save multiple records immediately |

### find methods

| Method                       | Return Type   | Purpose             |
| ---------------------------- | ------------- | ------------------- |
| `findById(id)`               | `Optional<T>` | Find by primary key |
| `findAll()`                  | `List<T>`     | Get all records     |
| `findAllById(ids)`           | `List<T>`     | Find multiple IDs   |
| `getReferenceById(id)`       | `T`           | Lazy-loaded proxy   |
| `findAll(Sort sort)`         | `List<T>`     | Find with sorting   |
| `findAll(Pageable pageable)` | `Page<T>`     | Pagination          |

### exists

| Method           | Return Type | Purpose             |
| ---------------- | ----------- | ------------------- |
| `existsById(id)` | `boolean`   | Check record exists |

### count methods

| Method    | Return Type | Purpose             |
| --------- | ----------- | ------------------- |
| `count()` | `long`      | Count total records |

### Delete methods

| Method                       | Return Type | Purpose                    |
| ---------------------------- | ----------- | -------------------------- |
| `delete(entity)`             | `void`      | Delete one record          |
| `deleteById(id)`             | `void`      | Delete by ID               |
| `deleteAll()`                | `void`      | Delete all records         |
| `deleteAll(entities)`        | `void`      | Delete selected records    |
| `deleteAllById(ids)`         | `void`      | Delete multiple IDs        |
| `deleteInBatch(entities)`    | `void`      | Batch delete               |
| `deleteAllInBatch()`         | `void`      | Delete everything in batch |
| `deleteAllInBatch(entities)` | `void`      | Batch delete selected      |

### Flush methods

| Method    | Return Type | Purpose                                 |
| --------- | ----------- | --------------------------------------- |
| `flush()` | `void`      | Synchronize persistence context with DB |

### pagination

```java
Pageable pageable = PageRequest.of(0, 10);
Page<User> users =
        repository.findAll(pageable);
```


| Method               | Purpose                 |
| -------------------- | ----------------------- |
| `getContent()`       | Current page data       |
| `getTotalPages()`    | Total pages             |
| `getTotalElements()` | Total records           |
| `hasNext()`          | Next page available     |
| `hasPrevious()`      | Previous page available |

### sortable 

```java
Sort sort = Sort.by("name");
Sort sort = Sort.by("salary").descending();
Sort sort =
        Sort.by("department")
            .ascending()
            .and(
                Sort.by("salary")
                    .descending()
            );

List<User> users = repository.findAll(sort);
```

## QUERY BY EXAMPLE ( QBE )

| Method             | Purpose      |
| ------------------ | ------------ |
| `findOne(example)` | Find one     |
| `findAll(example)` | Find all     |
| `count(example)`   | Count        |
| `exists(example)`  | Check exists |

## REPOSITORY HIERARCHY

```bash
Repository
    ↓
CrudRepository
    ↓
PagingAndSortingRepository
    ↓
ListCrudRepository
    ↓
JpaRepository
```  

### most frequently used

```java
save()
saveAll()
findById()
findAll()
existsById()
count()
deleteById()
delete()
findAll(Pageable)
findAll(Sort)
```

### Custom Derived Query Methods

- Spring Data JPA can generate queries automatically:

```java
findByName(String name)
findByEmail(String email)
findByAgeGreaterThan(int age)
findByDepartment(String dept)
findByNameContaining(String name)
existsByEmail(String email)
countByDepartment(String dept)
```

- method naming rule: `<prefix> + By + <field> + <condition>`

| Rule                | Example                      |
| ------------------- | ---------------------------- |
| Find records        | `findByName()`               |
| Check existence     | `existsByEmail()`            |
| Count records       | `countByDepartment()`        |
| Delete records      | `deleteById()`               |
| Multiple conditions | `findByNameAndAge()`         |
| OR condition        | `findByNameOrEmail()`        |
| Sorting             | `findByAgeOrderByNameAsc()`  |
| Top records         | `findTop5BySalary()`         |
| Distinct values     | `findDistinctByDepartment()` |

| Prefix     | Description     |
| ---------- | --------------- |
| `findBy`   | Fetch records   |
| `readBy`   | Fetch records   |
| `getBy`    | Fetch records   |
| `queryBy`  | Fetch records   |
| `countBy`  | Count rows      |
| `existsBy` | Check existence |
| `deleteBy` | Delete records  |
| `removeBy` | Delete records  |

#### Condition Keywords

| Keyword    | Example              |
| ---------- | -------------------- |
| `Is`       | `findByNameIs()`     |
| `Equals`   | `findByNameEquals()` |
| No keyword | `findByName()`       |

### String Conditions

| Keyword        | Example                    |
| -------------- | -------------------------- |
| `Containing`   | `findByNameContaining()`   |
| `StartingWith` | `findByNameStartingWith()` |
| `EndingWith`   | `findByNameEndingWith()`   |
| `Like`         | `findByNameLike()`         |
| `NotLike`      | `findByNameNotLike()`      |

### Comparison

| Keyword            | Example                          |
| ------------------ | -------------------------------- |
| `GreaterThan`      | `findBySalaryGreaterThan()`      |
| `GreaterThanEqual` | `findBySalaryGreaterThanEqual()` |
| `LessThan`         | `findBySalaryLessThan()`         |
| `LessThanEqual`    | `findBySalaryLessThanEqual()`    |
| `Between`          | `findBySalaryBetween()`          |

### Null Checks

| Keyword     | Example                    |
| ----------- | -------------------------- |
| `IsNull`    | `findByAddressIsNull()`    |
| `IsNotNull` | `findByAddressIsNotNull()` |

### boolean

| Keyword | Example               |
| ------- | --------------------- |
| `True`  | `findByActiveTrue()`  |
| `False` | `findByActiveFalse()` |

### collections

| Keyword | Example                   |
| ------- | ------------------------- |
| `In`    | `findByDepartmentIn()`    |
| `NotIn` | `findByDepartmentNotIn()` |

### date conditions

| Keyword   | Example                    |
| --------- | -------------------------- |
| `Before`  | `findByCreatedAtBefore()`  |
| `After`   | `findByCreatedAtAfter()`   |
| `Between` | `findByCreatedAtBetween()` |

### ignore cases

| Keyword         | Example                            |
| --------------- | ---------------------------------- |
| `IgnoreCase`    | `findByEmailIgnoreCase()`          |
| `AllIgnoreCase` | `findByNameAndCityAllIgnoreCase()` |


### sorting

| Keyword             | Example                               |
| ------------------- | ------------------------------------- |
| `OrderByNameAsc`    | `findByAgeOrderByNameAsc()`           |
| `OrderBySalaryDesc` | `findByDepartmentOrderBySalaryDesc()` |

### limit results

| Keyword | Example                   |
| ------- | ------------------------- |
| `Top`   | `findTop5BySalary()`      |
| `First` | `findFirstByDepartment()` |

### combining conditions

| Method                                   |
| ---------------------------------------- |
| `findByNameAndEmail()`                   |
| `findByNameOrEmail()`                    |
| `findByDepartmentAndSalaryGreaterThan()` |
| `findByNameContainingAndActiveTrue()`    |
| `findBySalaryBetweenAndDepartment()`     |

---

## A EXAMPLE WITH TABLE


```java
@Entity
@Table(name = "employees")
public class Employee {

    @Id
    private Long id;

    private String name;

    private String email;

    private Integer age;

    private Double salary;

    private Boolean active;

    private LocalDate joiningDate;

    private LocalDateTime createdAt;

    private Character grade;

    private Long phone;

    private BigDecimal bonus;

    @Enumerated(EnumType.STRING)
    private Role role;
}
```

### Custom query examples

| Field Type      | Field       | Method Example                  |
| --------------- | ----------- | ------------------------------- |
| `String`        | name        | `findByName()`                  |
| `String`        | email       | `findByEmailIgnoreCase()`       |
| `String`        | name        | `findByNameContaining()`        |
| `Integer`       | age         | `findByAgeGreaterThan()`        |
| `Integer`       | age         | `findByAgeBetween()`            |
| `Double`        | salary      | `findBySalaryLessThan()`        |
| `Double`        | salary      | `findTop5ByOrderBySalaryDesc()` |
| `Boolean`       | active      | `findByActiveTrue()`            |
| `Boolean`       | active      | `findByActiveFalse()`           |
| `LocalDate`     | joiningDate | `findByJoiningDateAfter()`      |
| `LocalDate`     | joiningDate | `findByJoiningDateBefore()`     |
| `LocalDateTime` | createdAt   | `findByCreatedAtBetween()`      |
| `Character`     | grade       | `findByGrade()`                 |
| `Long`          | phone       | `findByPhone()`                 |
| `BigDecimal`    | bonus       | `findByBonusGreaterThan()`      |
| `Enum`          | role        | `findByRole()`                  |

### Interview Rules

- Method names are case-sensitive.
- Field names must exactly match entity fields.
- Spring splits:
  - `find + By + Name + And + Age`

### The return type depends on how many records you expect

- Single record
  - `User findByEmail(String email);`
- Optional
  - `Optional<User> findByEmail(String email);`
- Multiple Records
  - `List<User> findByDepartment(String department);`
- Set ( remove duplicates )
  - `Set<User> findByDepartment(String department);`
- Boolean
  - `boolean existsByEmail(String email);`
- Count
  - `long countByDepartment(String department);`
  - `Long countByDepartment(String department);`

### Projection DTO

- A record in java, is simple way to create a 
- private final fielded class with both getter. 
- which means, only one time value created. and we can get the value. 
- but not update the value.
- So it is immutable.
- In here a class `UserDTO` is created.
- with getter like 

```java
public record UserDto( String name, String email) { }

// usage eg
UserDto u1 = new UserDto("shinchan","my@gmail.com");
String name = u1.name();
String email = u1.email();
```

```java
// Now below code only fields inside UserDto is picked. 
// it is like 
// SELECT name, email FROM user WHERE department = ?;
List<UserDto> findByDepartment(
        String department
);
```


### complete eg table

| Method                          | Return Type      |
| ------------------------------- | ---------------- |
| `findById()`                    | `Optional<User>` |
| `findByEmail()`                 | `Optional<User>` |
| `findByPhone()`                 | `Optional<User>` |
| `findByDepartment()`            | `List<User>`     |
| `findByActiveTrue()`            | `List<User>`     |
| `findByAgeGreaterThan()`        | `List<User>`     |
| `findTopByOrderBySalaryDesc()`  | `User`           |
| `findTop5ByOrderBySalaryDesc()` | `List<User>`     |
| `existsByEmail()`               | `boolean`        |
| `countByDepartment()`           | `long`           |
| `deleteByEmail()`               | `long`           |
| `findByDepartment(Pageable)`    | `Page<User>`     |
| `findByDepartment(Pageable)`    | `Slice<User>`    |
| `findBySalaryGreaterThan()`     | `Stream<User>`   |

### recommended rules

| Situation                    | Return Type          |
| ---------------------------- | -------------------- |
| One record may exist         | `Optional<Entity>` ✅ |
| One record definitely exists | `Entity`             |
| Multiple records             | `List<Entity>` ✅     |
| Need pagination              | `Page<Entity>` ✅     |
| Need infinite scroll         | `Slice<Entity>`      |
| Need count                   | `long`               |
| Need existence check         | `boolean`            |
| Need streaming               | `Stream<Entity>`     |

### common examples

```java
Optional<User>     findByEmail(String email);
List<Employee>     findByDepartment(String department);
Page<Product>      findByCategory( String category, Pageable pageable );
boolean            existsByUsername( String username );
long               countByStatus(String status);
User               findTopByOrderBySalaryDesc();
List<User>         findTop10ByActiveTrue();
long               deleteByCreatedAtBefore( LocalDate date );
```
