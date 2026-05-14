
# SCHEMA / MODEL CREATION

## special properties

- type
- required
- default
- select
- validate
- get		: custom getter
- set 		: custom setter
- INDEXES
	- {index: true}
	- {unique: true}
	- {sparse: true}
- STRING 
	- lowercase
	- uppercase
	- trim
	- match
	- enum
	- minLength
	- maxLength
- NUMBER
	- min
	- max
- DATE
	- min
	- max
	- expires
- OBJECT ID
	- populate

## validations

eggs: {
    type: Number,
    min: [6, 'Too few eggs'],
    max: { value: 12, message: "More eggs"},
    required: [true, 'User phone number required']
  },



## QUERY methods

- Model.deleteMany()
- Model.deleteOne()
- Model.find()
- Model.findById()
- Model.findByIdAndDelete()
- Model.findByIdAndRemove()
- Model.findByIdAndUpdate()
- Model.findOne()
- Model.findOneAndDelete()
- Model.findOneAndReplace()
- Model.findOneAndUpdate()
- Model.replaceOne()
- Model.updateMany()
- Model.updateOne()

Example:

await Person.
  find({ occupation: /host/ }).
  where('name.last').equals('Ghost').
  where('age').gt(17).lt(66).
  where('likes').in(['vaporizing', 'talking']).
  limit(10).
  sort('-occupation').
  select('name occupation').
  exec();

### USAGE OF LEAN


### middelewares

- pre
- post

- validate
- save
- updateOne
- deleteOne
- init

>> pre middleware to save password

userSchema.pre("save", async function(next) {
    // check if password is modified
    if (!this.isModified("password")) { // important.
        return next();
    }
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(this.password, salt);
        this.password = hashedPassword;
        next();
    } catch (error) {
        next(error);
    }
});

>> post for sending email after user created. 

userSchema.post("save", function(doc, next) {
    console.log(`Welcome email sent to ${doc.email}`);
    // sendEmail(doc.email)
    next();
});

### REFERENCES

child: {
    type: mongoose.ObjectId,
    ref: 'Child'
  }

Post.find().populate("author", "name email");

### TIMESTAMP

createdAt: a date representing when this document was created
updatedAt: a date representing when this document was last updated

const userSchema = new Schema({ name: String }, { timestamps: true });


