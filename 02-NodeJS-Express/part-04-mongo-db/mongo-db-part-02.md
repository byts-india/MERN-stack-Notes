# mongodb queries

The MongoDB Query API can be used two ways:

- CRUD Operations
- Aggregation Pipelines

## mongosh

- Welcome to MongoDB Shell ( mongosh ).
- The MongoDB Shell, mongosh , is a JavaScript and Node.js REPL environment for interacting with MongoDB deployments

### queries example

```json

db.posts.insertOne({
  title: "Post Title 1",
  body: "Body of post.",
  category: "News",
  likes: 1,
  tags: ["news", "events"],
  date: Date()
})

db.posts.updateOne( {
     title: "Post Title 1" 
}, { 
    $set: { likes: 2 } 
})
 
```

### Query Operators

Comparison

- The following operators can be used in queries to compare values:
  - $eq: Values are equal
  - $ne: Values are not equal
  - $gt: Value is greater than another value
  - $gte: Value is greater than or equal to another value
  - $lt: Value is less than another value
  - $lte: Value is less than or equal to another value
  - $in: Value is matched within an array

Logical

- The following operators can logically compare multiple queries.
  - $and: Returns documents where both queries match
  - $or: Returns documents where either query matches
  - $nor: Returns documents where both queries fail to match
  - $not: Returns documents where the query does not match

Evaluation

- The following operators assist in evaluating documents.
  - $regex: Allows the use of regular expressions when evaluating field values
  - $text: Performs a text search
  - $where: Uses a JavaScript expression to match documents

### Mongodb aggregation

Aggregation Pipelines

```json

db.posts.aggregate([
  // Stage 1: Only find documents that have more than 1 like
  {
    $match: { likes: { $gt: 1 } }
  },
  // Stage 2: Group documents by category and sum each categories likes
  {
    $group: { _id: "$category", totalLikes: { $sum: "$likes" } }
  }
])
```

- aggregations some examples
  - $group
  - $limit
  - $sort
  - $match
  - $count

References:

- <https://www.mongodb.com/docs/drivers/node/current/>

YOUTUBE REFERENCE :

- tamil : <https://www.youtube.com/watch?v=Svo-tPQ4GGU>
- english : <https://www.youtube.com/watch?v=ExcRbA7fy_A&list=PL4cUxeGkcC9h77dJ-QJlwGlZlTd4ecZOA&index=1>
