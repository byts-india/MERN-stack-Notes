# spring boot project folder usages

## Layer-based organization

    1. controller                   ( for REST or MVC controllers), 
    2. service                      ( for business logic), 
    3. repository                   ( for data access), 
    4. model or domain or entity    ( for entity classes),  
    5. config (for configuration classes).

## Order to follow while write code, 

- Example you want to write code for movies details
- Entity > Repository > service (optional) > Dto (optional) > controller

