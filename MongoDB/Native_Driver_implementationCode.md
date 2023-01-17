## Node.js Documentation Link-> https://www.mongodb.com/docs/drivers/node/current/
### Basic Code
    const {MongoClient} = require("mongodb");

    // Replace the uri string with your MongoDB deployment's connection string.
    const uri = "mongodb://127.0.0.1:27017";

    const client = new MongoClient(uri, {useUnifiedTopology: true});

    async function run() {
        try {
          await client.connect();
          console.log("Connected Successfully to server");

          const database = client.db('friutsDB');
          const myCollection = database.collection('friuts');

### To Read documents
          if ((await myCollection.countDocuments()) === 0) {
              console.log("No documents found!");
          }

          const allDocuments = myCollection.find();
          await allDocuments.forEach((document) => {
            console.log(document);
          });

### To Insert documents
          await myCollection.insertMany([
            { name: 'Apple', score: '6' ,review:"Good"},
            { name: 'Gauva', score: '9' ,review:"Very Good"},
            { name: 'Grappes', score: '7' ,review:"nice"}
         ]);

### To Close dataBase Reading collection
        } finally {
          // Ensures that the client will close when you finish/error
          await client.close();
        }
    }
### To perform written task
    run().catch(console.dir);
