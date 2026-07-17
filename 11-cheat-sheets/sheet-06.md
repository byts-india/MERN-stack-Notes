# Spring security cheat sheet

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(
            HttpSecurity http
    ) throws Exception {

        http
            .authorizeHttpRequests(auth -> auth

                .requestMatchers(
                        "/login",
                        "/register"
                )
                .permitAll()

                .anyRequest()
                .authenticated()
            )

            .formLogin(Customizer.withDefaults());

        return http.build();
    }
}
```


## URL authorization rule

| Rule                | Meaning              |
| ------------------- | -------------------- |
| `permitAll()`       | Anyone can access    |
| `authenticated()`   | Login required       |
| `denyAll()`         | Block everyone       |
| `hasRole("ADMIN")`  | ADMIN role required  |
| `hasAnyRole()`      | Multiple roles       |
| `hasAuthority()`    | Specific permission  |
| `hasAnyAuthority()` | Multiple permissions |

```java
// public 
.requestMatchers("/public/**")
.permitAll()
// login req
.anyRequest()
.authenticated()
// admin only
.requestMatchers("/admin/**")
.hasRole("ADMIN") // spring automatically adds ROLE_ADMIN
// multi role
.requestMatchers("/dashboard/**")
.hasAnyRole("ADMIN","USER")
// multi authorize
.requestMatchers("/reports/**")
.hasAnyAuthority("READ","WRITE")
```

## Custom Login Page

```java
.formLogin(form -> form
        .loginPage("/login")
        .defaultSuccessUrl(
                "/dashboard"
        )
        .failureUrl(
                "/login?error=true"
        )
        .permitAll()
)
```

## logout

```java
.logout(logout -> logout
        .logoutUrl("/logout")
        .logoutSuccessUrl("/login")
        .invalidateHttpSession(true)
        .deleteCookies(
                "JSESSIONID"
        )
)
```

## password encode

```java
@Bean
public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
}

// usage
String encoded = passwordEncoder.encode( "password" );
// compare
passwordEncoder.matches( "password", encoded);
```

### SECURITY FILTER ORDER

```bash
Request
   ↓
Security Filter Chain
   ↓
Authentication Filter
   ↓
Authorization Filter
   ↓
Controller
   ↓
Response
```
