# Serving static files in Express

To serve static files such as images, CSS files, and JavaScript files, use the express.static built-in middleware function in Express.

The function signature is:

`express.static(root, [options])`

```javascript
app.use(express.static('public'));
```

