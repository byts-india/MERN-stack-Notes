# stream cheat sheet

```bash
Collection
    ↓
stream()
    ↓
Intermediate Operations
    ↓
Terminal Operation
    ↓
Result
```

| Category          | Method            | Return Type         | Example                              |
| ----------------- | ----------------- | ------------------- | ------------------------------------ |
| Create            | `stream()`        | `Stream<T>`         | `list.stream()`                      |
| Create            | `Stream.of()`     | `Stream<T>`         | `Stream.of(1, 2, 3)`                 |
| Create            | `Arrays.stream()` | `Stream<T>`         | `Arrays.stream(arr)`                 |
| Filter            | `filter()`        | `Stream<T>`         | `.filter(x -> x > 10)`               |
| Transform         | `map()`           | `Stream<R>`         | `.map(User::getName)`                |
| Flatten           | `flatMap()`       | `Stream<R>`         | `.flatMap(List::stream)`             |
| Remove duplicates | `distinct()`      | `Stream<T>`         | `.distinct()`                        |
| Sort ascending    | `sorted()`        | `Stream<T>`         | `.sorted()`                          |
| Sort descending   | `sorted()`        | `Stream<T>`         | `.sorted(Comparator.reverseOrder())` |
| Skip values       | `skip()`          | `Stream<T>`         | `.skip(5)`                           |
| Limit values      | `limit()`         | `Stream<T>`         | `.limit(10)`                         |
| Debug             | `peek()`          | `Stream<T>`         | `.peek(System.out::println)`         |
| Loop              | `forEach()`       | `void`              | `.forEach(System.out::println)`      |
| Convert to list   | `toList()`        | `List<T>`           | `.toList()`                          |
| Collect           | `collect()`       | Depends             | `.collect(Collectors.toList())`      |
| Count             | `count()`         | `long`              | `.count()`                           |
| First element     | `findFirst()`     | `Optional<T>`       | `.findFirst()`                       |
| Any element       | `findAny()`       | `Optional<T>`       | `.findAny()`                         |
| Minimum           | `min()`           | `Optional<T>`       | `.min(Integer::compareTo)`           |
| Maximum           | `max()`           | `Optional<T>`       | `.max(Integer::compareTo)`           |
| Reduce            | `reduce()`        | `T` / `Optional<T>` | `.reduce(Integer::sum)`              |
| Match             | `anyMatch()`      | `boolean`           | `.anyMatch(x -> x > 10)`             |
| Match             | `allMatch()`      | `boolean`           | `.allMatch(x -> x > 0)`              |
| Match             | `noneMatch()`     | `boolean`           | `.noneMatch(x -> x < 0)`             |

## collectors 

| Method                        | Return Type             | Example                                          |
| ----------------------------- | ----------------------- | ------------------------------------------------ |
| `Collectors.toList()`         | `List<T>`               | `.collect(Collectors.toList())`                  |
| `Collectors.toSet()`          | `Set<T>`                | `.collect(Collectors.toSet())`                   |
| `Collectors.toMap()`          | `Map<K,V>`              | `.collect(Collectors.toMap())`                   |
| `Collectors.joining()`        | `String`                | `.collect(Collectors.joining(","))`              |
| `Collectors.groupingBy()`     | `Map<K, List<T>>`       | `.collect(Collectors.groupingBy(User::getDept))` |
| `Collectors.counting()`       | `Long`                  | `.collect(Collectors.counting())`                |
| `Collectors.partitioningBy()` | `Map<Boolean, List<T>>` | `.collect(Collectors.partitioningBy())`          |
| `Collectors.mapping()`        | Nested collector        | `.collect(Collectors.mapping())`                 |

## primitive streams

| Stream Type    | Creation Method | Example                        |
| -------------- | --------------- | ------------------------------ |
| `IntStream`    | `range()`       | `IntStream.range(1, 10)`       |
| `IntStream`    | `rangeClosed()` | `IntStream.rangeClosed(1, 10)` |
| `LongStream`   | `range()`       | `LongStream.range(1, 10)`      |
| `DoubleStream` | `of()`          | `DoubleStream.of(1.2, 2.4)`    |

## common example

| Requirement         | Stream Code                                                |
| ------------------- | ---------------------------------------------------------- |
| Get even numbers    | `.filter(n -> n % 2 == 0)`                                 |
| Remove duplicates   | `.distinct()`                                              |
| Sort descending     | `.sorted(Comparator.reverseOrder())`                       |
| Convert to list     | `.toList()`                                                |
| Sum numbers         | `.reduce(0, Integer::sum)`                                 |
| Highest salary      | `.max(Comparator.comparing(Employee::getSalary))`          |
| Group by department | `.collect(Collectors.groupingBy(Employee::getDepartment))` |
| Count records       | `.count()`                                                 |
| Check existence     | `.anyMatch()`                                              |
| Get names only      | `.map(User::getName)`                                      |

| Intermediate Operations | Terminal Operations |
| ----------------------- | ------------------- |
| `filter()`              | `collect()`         |
| `map()`                 | `toList()`          |
| `flatMap()`             | `forEach()`         |
| `distinct()`            | `count()`           |
| `sorted()`              | `findFirst()`       |
| `limit()`               | `reduce()`          |
| `skip()`                | `min()`             |
| `peek()`                | `max()`             |
|                         | `anyMatch()`        |
|                         | `allMatch()`        |
|                         | `noneMatch()`       |
