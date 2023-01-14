### To start mongoDB terminal
    mongosh

### Show all dataBase
    show db

### Show collection
    show collection
    
### Make DataBase
    use shopDB

### Show current DataBase
    db

# CURD
Reference Link -->> https://www.mongodb.com/docs/manual/crud/

# AIM
![image](https://user-images.githubusercontent.com/98096047/212467257-52393ef2-f3ab-4cb3-aeea-e84faba9d54e.png)


# Create
   #### used to create a database 
    use shopDB
    
   #### Used to create Collection (they are the branches of any database(Link -> https://www.mongodb.com/docs/manual/reference/glossary/#std-term-collection)
   #### *The code will add all  the specified values to products collection 
     db.products.insertOne({_id:1, name: "Pen", price: 1.20})
     
![image](https://user-images.githubusercontent.com/98096047/212466906-6be2e6e6-5fef-4cbc-9af6-a7618919d6a9.png)

  
  
# Read
   ### To read all document
      db.products.find()
     
![image](https://user-images.githubusercontent.com/98096047/212466942-6d94b99d-5dd8-4f25-a8e2-ce6f92486c7b.png)


   ### To search with query
      db.products.find( {name: "Pen"} )
      
   #### To search with query and operator (Link-> https://www.mongodb.com/docs/manual/reference/operator/query/)
   ##### *Retuns documents which have price value greater than 1
      db.products.find( { price: {$gt: 1} } )
      
   ### To return values with projection
      db.products.find( {_id: 1}, {name: 1,_id: 0} )
![image](https://user-images.githubusercontent.com/98096047/212467148-72c3bf15-7aab-4eff-9394-eb0fa9e54977.png)

# Update
![image](https://user-images.githubusercontent.com/98096047/212467766-f9c95dd8-9368-41f0-bac5-9a9d9fab5f5b.png)

   ### To update values
      db.products.updateOne( {_id: 1}, {$set: {stock: 32}} )
![image](https://user-images.githubusercontent.com/98096047/212467702-9433ee74-d015-4dc8-87ea-75e44213509d.png)

# Delete
![image](https://user-images.githubusercontent.com/98096047/212469098-ab05f362-1ad3-4c00-bbdf-a248f9558ab1.png)

  ###  To delete a whole document
      db.products.deleteOne( {_id: 2} )
![image](https://user-images.githubusercontent.com/98096047/212469171-bae34a5c-0db6-47ab-8574-ba2b5a25d2a7.png)

