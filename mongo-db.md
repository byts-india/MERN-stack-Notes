# mongo DB basics
- Document Oriented
- Stores Data in the forms of collections and documents
- Gained Popularity in mid 2000's
- MongoDB offers flexible schema

## Technical terms in MongoDB
- `database` group of collections
- `collections` group of Documents.
- `Documents` group of data
- `data` information in JSON format
- `field` eg: category : "hollywood", here category is field
- Role of `"_id"` in mongodb document

Advantages of MongoDB

- Best of SQL and NoSQL
- Open Source
- Flexible Scheme
- Reliable

Use cases of MongoDB

- Product Data Management
- CMS ( content management system )
- Operational Intelligence
- Online Application

Sharding in MongoDB

- Sharding is a type of database partitioning that separates large databases into smaller, faster, more easily managed parts.
- Distributing data in multiple machines
- Horizontal scaling.

Replica Sets in MongoDB

- A replica set is a group of mongod instances that maintain the same data set.

## disadvantage of mongodb

- as it is flexible scheme, complex query is difficutl.
- we cannot perform joins here .
- aggregation support are limited.

How MongoDB stores Data

- Stores data as document
- It looks like JSON.
- But it is exactly BSON ( Binary JSON )
- why BSON : less space, Faster traversal.
- improve query speed.



Relationship types:

- one to one     : citizen to aadhar
- one to many    : country to citizen
- many to one    : fans to actor
- many to many   : student to teachers

Relationships in MongoDB:

- Embedded Data
  - Document nested inside another document
- References
  - Refer one document with other document.

Embedded data example:
```json
{
    "_id":"asdfa213232342",
    "username": "123xyz",
    "contact": {
        "phone": "123-456-7898",
        "email": "xyz@example.com" 
    }
}
```
Reference data example
```json
// user document
{   "_id":"main213232342",
    "username": "123xyz",    }
// contact document
```json
{
    "_id": "sa1234asdf",
    "user_id":"main213232342",
    "phone": "123-456-7898",
    "email": "xyz@example.com" 
}
```

## there are 2 ways to use mongodb

1. local mongodb.
1. using cloud version.  mongodb atlas

# mongosh ( mongodb + shell )
- The MongoDB Shell is a modern command-line experience, full with features to make it easier to work with your database. 
- mongosh is built on top of the node.js runtime.
- features available
	- v8(node.js) being used
	- auto complete 
	- uses Modern ES6
NOTE: `CTRL + L`  : to clear the screen
## database operations
> show dbs;
  - list all available databases.
> use <db_name>;
  - switched to mentioned db 
    or create new one.
> db.dropDatabase();
  - delete a database which has been selected.
  - we won't pass any db name as argument.
## Collection operations
> db.createCollection("<collection_name>");
  - it will create a new collection.
> show collections;
  - to list all collections available.
> db.<collection_name>.drop();
  - to delete a collection.

### EXAMPLE:
test-db> use kongu_db;
switched to db kongu_db
kongu_db> show collections;
kongu_db> db.createCollection("students");
{ ok: 1 }

## INSERT DOCUMENTS
db.students.insertOne({
	name: "Alice",
	age: 18
});
db.students.insertMany([
	{ name: "Bob", age: 19 },
	{ name: "Anderson", age: 17 },	
]);

## READ OPERATIONS
db.students.find();
db.students.find({ age: 19 });
db.students.find({ age: { $gte: 18 } });
db.students.findOne({ age: { $gt: 18 }});

## DELETE OPERATIONS
db.students.deleteOne({ age: 19 });
db.students.deleteMany({ age: { $gte: 18 }});

## UPDATE OPERATIONS
db.students.updateOne({ age: 18 }, { $set: { age: 20 }});
db.students.updateMany(
	{ age: { $lte: 18 } }, 
	{ $inc: { age: 1 } }
);

### EXAMPLES:
kongu_db> show collections;
students
kongu_db> db.students.find().count();
3
kongu_db> db.students.deleteMany({ });
...
kongu_db> db.students.find().count();
0
kongu_db> db.students.insertMany({ ... });
kongu_db> db.students.find().count();
30

## COMPARISION OPERATORS
$eq $ne $gt $lt $gte $lte

## LOGICAL OPERATORS
$and $or $not $nor 

### EXAMPLES
kongu_db> db.students.findOne();
{
  _id: ObjectId('6a016d6b09761b631146b79c'),
  name: 'Arun Kumar',
  registerNo: '22CS001',
  department: 'CSE',
  marks: { maths: 85, physics: 78, chemistry: 82 },
  total: 245,
  grade: 'A'
}
## PROJECTION
- { field: 1 }  where 1 means show 
- { field: 0 }  don't show the field
kongu_db> db.students.find({},{department:1, _id:0});
[
  { department: 'CSE' },  { department: 'CSE' },
  ...
]
## usage of distinct() 
- will get array of mentioned field with unique values.
kongu_db> db.students.distinct("department");
[ 'CSE', 'ECE', 'IT', 'MECH' ]
## OTHER EXAMPLES
kongu_db> db.students.find(
	{ department: "CSE" }, 
	{ name: 1, department:1, _id: 0}
);
[
  { name: 'Arun Kumar', department: 'CSE' },
  ...
]
## EXAMPLE FOR REGEX ( regular expression )
- `a$` means ends with character `a`.
kongu_db> db.students.find({ name: /a$/ },{ name: 1 , _id: 0});
[
  { name: 'Divya' },
  { name: 'Meena' },
  ...
]
### BASIC REGEX SYMOBOLS
. 		Any character       a.c    it matches "abc"
^ 		starts with 	    ^A     it matches "Apple" "Ant"
$       ends with 			a$     it matches "priya" "divya"
*       0 or more
+       1 or more
?       0 or one (optional)
eg:  /a+/    - `a` must appear atleast once.
     a
     aa
     aaa
eg:  /lo+l/  
	 lol
	 lool
	 loool
eg:  /ha*i/   - `a` appear 0 or more times
	 hi
	 hai
	 haai
	 haaai	 
eg:  /colou?r/  - `u` is optional
	 color
	 colour
- examples
kongu_db> db.students.find(
	{ 
		$and: [
			{ department: 'CSE' }, 
			{ "marks.maths": { $gte: 80 }},
			{ "marks.maths": { $lte: 90 }}
		]
	},
	{ _id:0, department:1, "marks.maths":1 });
kongu_db> db.students.find(
	{
		department: 'CSE',
		"marks.maths": { $gte: 80, $lte: 90 }
	},
	{ _id:0, department:1, "marks.maths":1 });
- sAME OUTPUT FOR BOTH ABOVE QUERY

----------------------------------------------------


Element Operators
-----------------
01. $type
> Most commonly used types. 
	- "string" 					- "int" 						- "double"
	- "bool" 						- "array"						- "object"
	- "date"						- "objectId"				- "null"

db.students.find({
 marks: { $type: ["int","double"] }
});
db.users.find({
 skills: { $type: "array" }
});

02. $exists
- checks if give field is exists or not.
SYNTAX:   { field: { $exists: true } }

	db.students.find({
	 	age: { $exists: true }
	});
	db.students.find({
	 	age: { $exists: true, $gt: 21 }
	});
	db.students.find({
	 	"marks.maths": { $exists: true }
	});

	USAGE: 
		- Data cleaning
		- Finding incomplete records

----------------------------------------------------

Other comparison operator

$in   - in an array
$nin  - not in an array

db.students.find({
 department: { $in: ["CSE", "IT"] }
});
db.students.find({
 department: { $nin: ["CSE", "IT"] }
});
----------------------------------------------------
Evaluation Operators 
$regex
------
	db.users.find({
	 email: { $regex: /@gmail\.com$/ }
	})
	- email ends with @gmail.com 
	db.users.find({
	 email: { $regex: /^[0-9]/ }
	})
	- email starts with number
	- $regex: /^a/i    to check if start with a and case insensitive
	- $regex: /^[A-Za-z]+$/ 
					should contain A-Z, a-Z starts and ends 
					+ 1 or more
					eg: 
						hello   ✅ 						no21    ❌ 

$expr (EXPRESSION)
- we can perform aggregation operations like
	- $add $subtract $multiply $divide etc.
	db.students.find({
	 $expr: { 
	 		$lte: [
	 			{ $add: ["$marks.maths","$marks.physics"] },
	 			150
	 		] 
	 	}
	})
	- we cannot compare two fields without using $expr

$mod    modulus operator
	db.numbers.find({
	 total: { $mod: [0, 5] }
	})

$text
-----
- Used for full-text search on indexed text fields.
db.students.createIndex({ name: "text" });
db.students.find({ $text: { $search: "kumar" } })
db.students.find({ $text: { $search: "kumar M" } })
- check if word 'kumar' or 'manoj' is there. 
- multiples words can be search in second eg. 
	words should be seperated by space.
- it will search for word not text. 

$where
-------
- $where allows JavaScript expressions inside queries.

db.students.find({
 $where: "this.marks.maths > this.marks.physics"
})
db.students.find({ $where: "this.name.length > 10" });
db.students.find({
 $where: "this.marks.maths + this.marks.physics > 160"
})
db.students.find({ $where: "this.total < 180" });

$jsonSchema
- Used to validate document structure.

db.students.find({
 $jsonSchema: {
   required: ["name", "department"]
 }
})
- For above example, we will get docs where only following 
  field is there "name" and "department"
db.students.find({
 $jsonSchema: {
   properties: {
     age: { bsonType: "int" }
   }
 }
})

------------------------------------

Array operator
--------------
$all - must contain all mentioned values in the array field.
db.employees.find({
 skills: { $all: ["JavaScript","React"] }
})  
$elemMatch - multiple conditions must apply 
eg document structure
{  name: "Bala",
   marks: [
     { subject: "maths", score: 60 },
     { subject: "physics", score: 85 }
   ]  
}
db.students.find({  marks: {
   							$elemMatch: { 
   								subject: "maths", score: { $gt: 75 } 
   						} }
						})

$size - Used to check array length.

db.students.find({
 subjects: { $size: 2 }
})

---------------------------------------------------

Update operator
---------------
$set   - add a new field or update an existing field.
db.students.updateMany(
	{ grade: { $exists: false }},
	{ $set: { grade:"A" }}
);
$unset - remove a field
db.students.updateOne(
 { name: "Arun" },
 { $unset: { age: "" } }     <-- value doesn't matter.
)
$rename - rename a field.
db.students.updateOne(
 { name: "Arun" },
 { $rename: { name: "student_name" } }
);

--------------------------------------------------------

Number Updates
--------------
$inc - increment                     # no seperate operator for dec.
	db.employees.updateOne(            # use neg value for decrement.
	 { name: "Arun" },
	 { $inc: { salary: 5000 } }
	)
$mul - multiply
db.employees.updateOne(
 { name: "Arun" },
 { $mul: { salary: 2 } }
)
$min - Updates the field only if the new value is smaller.
db.employees.updateOne(
 { name: "Arun" },
 { $min: { salary: 45000 } }
)
$max - the field only if the new value is larger.
db.employees.updateOne(
 { name: "Arun" },
 { $max: { salary: 60000 } }
)

Array Updates
--------------
$push - add a new item in arr
db.students.updateOne(
 { name: "Arun" },
 { $push: { skills: "MongoDB" } }
)

$pull - remove a item in arr
db.students.updateOne(
 { name: "Arun" },
 { $pull: { skills: "Python" } }
)

$addToSet - Adds a value only if it does not already exist.
db.students.updateOne(
 { name: "Arun" },
 { $addToSet: { skills: "JavaScript" } }
)
$pop - Removes first or last element from array.
 1  → remove last element
-1 → remove first element
db.students.updateOne(
 { name: "Arun" },
 { $pop: { skills: 1 } }
)
$each - Used with $push or $addToSet to add multiple values.
db.students.updateOne(
 { name: "Arun" },
 { $push: {
     skills: {
       $each: ["React","NodeJS"]
     }    }
  }
)

### METHODS

insert
--------
insertOne()
insertMany()

query method
-------------
find()
findOne()
distinct()
countDocuments()
	- Used to count documents that match a condition.
	- Accurate count
  - Can apply filters
  - Slightly slower because MongoDB scans documents or indexes
	db.students.countDocuments({ department: "CSE" })
estimatedDocumentCount()
	- quickly estimate the total number of documents
	- Very fast
	- Cannot apply filters
  - Uses collection metadata
  - Result may be slightly inaccurate in some cases
  db.students.estimatedDocumentCount()

update
---------
update() : deprecated ( no suggested to use )
updateOne()
updateMany()
replaceOne()
	- replace an entire document with a new document
	- db.collection.replaceOne(filter, replacement, options)
	- `updateOne` + $set → modify fields
	- `replaceOne` → replace entire document
db.students.replaceOne(
 { name: "Bala" }, 														👈 condition
 { name: "Bala", age: 23, department: "IT" }, 👈 new doc
 { upsert: true } 														👈 options
)
	- option { upsert: true }   means: update or insert
	- if condition is matching it will update
	- if condition is not matching it will create new one


delete
------
deleteOne()
deleteMany()

cursor methods
--------------
limit()
	- to display limited values
	- eg: 
	 db.students.find({ department: "MECH" }).limit(2)
	 - after filter, give me first 2 values
	- neg values dosn't change anything. 
	- it is advised to use pos values alone.

skip()
	- eg:
		db.students.find({ department: "CSE"}).skip(5).limit(5)
	- lets assume for CSE department there are 20 values
	- now first 5 values will be skipped
	- next 5 values will be shown.

>> get last 4 values after condition
eg:
	db.students.find({ department: "CSE" })
	  .sort({ _id: -1 })
	  .limit(5);
## sort()
---------
syntax:
	sort({ field: 1 })   			1 for acending
	sort({ field: -1 })      -1 for decending
	- we can do sort on multiple fields
	sort({ field1: 1, field2: -1 })

count()  -> get count of result
eg:
	db.students.find({ dept: "CSE" }).count();

pretty()  -> get formated result
eg:
	db.students.find({ dept: "CSE" },{ _id: 0, name: 1 }).pretty();
--



### aggregation
### INDEX

