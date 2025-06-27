# all http methods implementation in express
    
    - sampleRouter.get()    : get resource from server
    - sampleRouter.post()   : create new resource
    - sampleRouter.put()    : update resource
    - sampleRouter.delete() : delete resource
    - sampleRouter.patch()  : partially update resource
    - sampleRouter.all()    : handler executed with all http methods ( GET, PUT , etc... )
    

## How to get payload in routes

```javascript
const payload = req.body;
```

## Routes types;

- 01 - simple routes
- 02 - dynamic routes
- 03 - optional routes
- 04 - wildcard routes
- 05 - module routes

