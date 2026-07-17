# thymeleaf

- No, it is not mandatory. Your Thymeleaf templates will still render perfectly on the server even if you omit the xmlns:th attribute. 🔥

| Tag                  | Purpose          | Example                                      | mostly used |
| -------------------- | ---------------- | -------------------------------------------- | ----------- |
| XML Namespace        | Enable Thymeleaf | `<html xmlns:th="http://www.thymeleaf.org">` |  ✅ |
| Variable Expression  | Access variable  | `${user.name}`                               | ✅  |
| Selection Expression | Current object   | `*{name}`                                    |      |
| Message Expression   | Properties file  | `#{welcome.message}`                         | |
| Link Expression      | URLs             | `@{/login}`                                  | ✅ |
| Fragment Expression  | Reuse template   | `~{header :: navbar}`                        | |



| Attribute        | Purpose         | Example                    |
| ---------------- | --------------- | -------------------------- |
| `th:text`        | Replace text    | `th:text="${name}"`        |
| `th:value`       | Input value     | `th:value="${user.email}"` |
| `th:placeholder` | Placeholder     | `th:placeholder="${msg}"`  |
| `th:title`       | Title attribute | `th:title="${title}"`      |

| Attribute       | Example                                   | Output          |
| --------------- | ----------------------------------------- | --------------- |
| `th:href`       | `th:href="@{/login}"`                     | `/login`        |
| `th:src`        | `th:src="@{/images/logo.png}"`            | Image URL       |
| Path variable   | `th:href="@{/users/{id}(id=${user.id})}"` | `/users/10`     |
| Query parameter | `th:href="@{/users(page=1)}"`             | `/users?page=1` |

| Attribute      | Purpose          | Example                           |
| -------------- | ---------------- | --------------------------------- |
| `th:if`        | Show if true     | `th:if="${age > 18}"`             |
| `th:unless`    | Opposite of `if` | `th:unless="${loggedIn}"`         |
| Ternary        | Inline condition | `${age > 18 ? 'Adult' : 'Minor'}` |
| Elvis operator | Default value    | `${name ?: 'Guest'}`              |

---

| Attribute  | Example                           |
| ---------- | --------------------------------- |
| Basic loop | `th:each="user : ${users}"`       |
| Index loop | `th:each="user, stat : ${users}"` |
| List loop  | `th:each="item : ${list}"`        |
| Map loop   | `th:each="entry : ${map}"`        |

| Variable     | Meaning         |
| ------------ | --------------- |
| `stat.index` | Starts from `0` |
| `stat.count` | Starts from `1` |
| `stat.size`  | Total count     |
| `stat.first` | First element   |
| `stat.last`  | Last element    |
| `stat.even`  | Even index      |
| `stat.odd`   | Odd index       |

---

```html
<tr th:each="user, stat : ${users}">
    <td th:text="${stat.count}"></td>
    <td th:text="${user.name}"></td>
</tr>
```

---

| Attribute   | Purpose         | Example                  |
| ----------- | --------------- | ------------------------ |
| `th:action` | Form action URL | `th:action="@{/save}"`   |
| `th:method` | HTTP method     | `th:method="post"`       |
| `th:object` | Bind DTO        | `th:object="${userDto}"` |
| `th:field`  | Bind field      | `th:field="*{name}"`     |

## mapping object with form

```html
<form th:action="@{/register}"
      th:object="${userDto}"
      method="post">
    <input type="text" th:field="*{name}">
    <input type="email" th:field="*{email}">
    <button type="submit">
        Save
    </button>
</form>
```

## Spring boot folder structure

| Folder           | Purpose         |
| ---------------- | --------------- |
| `templates/`     | Thymeleaf pages |
| `static/css/`    | CSS             |
| `static/js/`     | JavaScript      |
| `static/images/` | Images          |

### Examples

```java
@GetMapping("/users")
public String users(Model model) {
    model.addAttribute(
            "name",
            "John"
    );
    return "index";
}
```

```java
@PostMapping("/register")
public String register( @ModelAttribute UserDto dto ) {
    return "success";
}
```

### common interview qns

| Question                                         | Answer                                     |
| ------------------------------------------------ | ------------------------------------------ |
| Template engine?                                 | Generates HTML on server                   |
| Folder location?                                 | `resources/templates`                      |
| CSS location?                                    | `resources/static/css`                     |
| Difference between `th:text` and `th:utext`?     | Escaped vs unescaped HTML                  |
| Difference between `th:insert` and `th:replace`? | Insert adds content, replace swaps element |
| Which annotation for forms?                      | `@ModelAttribute`                          |
| How to iterate?                                  | `th:each`                                  |
| How to show conditionally?                       | `th:if`                                    |
