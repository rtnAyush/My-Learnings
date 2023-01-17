# Basic Syntax for using mongoose (Alternative for mongoDB Native Driver)
### Install mongoose
    npm i mongoose

### Add Basic code(For localServer to create fruitsDB DataBase)
    const mongoose = require('mongoose');

    mongoose.set('strictQuery', false);
    mongoose.connect("mongodb://127.0.0.1:27017/fruitsDB", { useNewUrlParser: true });
    
# Create (Insert documents)
### Make Schema for bluePrint
    const fruitSchema = new mongoose.Schema ({
      name : String,
      rating : Number,
      review: String
    });

### Schema Validation(Link-> https://mongoosejs.com/docs/validation.html)
    const fruitSchema = new mongoose.Schema({
        name: {
            type: String,
            required: [true, "Name not inserted"]
        },
        rating: {
            type: Number,
            max: 10,
            min: 1
        },
        review: String
    });
### Create a Collection(it will be created as 'fruits' ,it uses Lodmon to make all collection pural)
    const Fruit = mongoose.model("Fruit", fruitSchema);

### To insert one document
    const fruit = new Fruit ({
      name : "Apple",
      rating : 7,
      review : "This very good apple."
    });
    // to save the document
    fruit.save();
    
### To insert Many document(Link-> https://mongoosejs.com/docs/api/model.html#model_Model-insertMany)
    const kiwi = new Fruit ({
      name : "Kiwi",
      rating : 6,
      review : "Good"
    });

    const orange = new Fruit ({
      name : "Orange",
      rating : 6,
      review : "Very Good"
    });

    const banana = new Fruit ({
      name : "Banana",
      rating : 7,
      review : "very very Good"
    });
    
    // it takes a array and a function with parameter err to show documents are inserted or not.
    
    Fruit.insertMany([kiwi,orange,banana], function(err){
      if (err) {
        console.log(err);
      } else {
        console.log("SuccussFully Inserted.");
      }
    });
    
# Read
#### collection.find contaions anomonus function with two paramerters, first one tell about error and if error does not happend then second one will read all the documents value inside it. 
    Fruit.find(function(err, fruits){
      if (err) {
        console.log(err);
      } else {
      
        fruits.forEach(function(fruit){
          console.log(fruit.name);
        });
        
      }
    });
