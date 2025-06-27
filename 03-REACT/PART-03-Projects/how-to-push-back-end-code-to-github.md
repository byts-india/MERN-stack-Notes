# extra 2 things

## `.gitignore`

```md
# below code so that node_modules won't be pushed to github.
/node_modules
```

## `vercel.json`

```json
{
    "version": 2,
    "builds": [
        {
            "src": "./index.js",
            "use": "@vercel/node"
        }
    ],
    "routes": [
        {
            "src": "/(.*)",
            "dest": "/"
        }
    ]
}
```
