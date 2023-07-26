test> show dbs
admin        40.00 KiB
bootcamp     56.00 KiB
config      108.00 KiB
local        72.00 KiB
playground   72.00 KiB
vidly        12.00 KiB
test> use bootcamp
switched to db bootcamp
bootcamp> show collections
employee
bootcamp> db.employee
bootcamp.employee
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  }
]
bootcamp> db.books.insertOne({ 
...     title: 'MongoDB insertOne',
...     isbn: '0-7617-6154-3'
... });
bootcamp> db.employee.insertOne({
... name: "xyz",
... department: "finance",
... age: 44;
Uncaught:
SyntaxError: Unexpected token, expected "," (4:7)

  2 | name: "xyz",
  3 | department: "finance",
> 4 | age: 44;
    |        ^
  5 |

bootcamp> db.employee.insertOne({
... name: "xyz", age: 45){
Uncaught:
SyntaxError: Unexpected token, expected "," (2:20)

  1 | db.employee.insertOne({
> 2 | name: "xyz", age: 45){
    |                     ^
  3 |

bootcamp> db.employee.insertOne({
... ... name: "xyz", age: 45)}
Uncaught:
SyntaxError: Unexpected token, expected "," (2:8)

  1 | db.employee.insertOne({
> 2 | ... name: "xyz", age: 45)}
    |         ^
  3 |

bootcamp> db.employee.insertOne({name: "ankit", age: 22)}
Uncaught:
SyntaxError: Unexpected token, expected "," (1:45)

> 1 | db.employee.insertOne({name: "ankit", age: 22)}
    |                                              ^
  2 |

bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  }
]
bootcamp> db.employee.insertOne({age: 32})
{
  acknowledged: true,
  insertedId: ObjectId("64c0a28930b0a7ac19cdf973")
}
bootcamp> db.employee.insertOne({name: "kapa", age: 22})
{
  acknowledged: true,
  insertedId: ObjectId("64c0a2aa30b0a7ac19cdf974")
}
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 }
]
bootcamp> db.employee.find().pretty()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 }
]
bootcamp> db.employee.insertMany([{age: 56}, {age, 46}])
Uncaught:
SyntaxError: Unexpected token (1:43)

> 1 | db.employee.insertMany([{age: 56}, {age, 46}])
    |                                            ^
  2 |

bootcamp> db.employee.insertMany([{age: 56}, {age: 46}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("64c0a37a30b0a7ac19cdf975"),
    '1': ObjectId("64c0a37a30b0a7ac19cdf976")
  }
}
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf975"), age: 56 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf976"), age: 46 }
]
bootcamp> db.employee.insertMany([{name: "safan", age: 22, profession: "teacher"},{name: "mahesh", age: 34},{name: "adarsh", age: 40, salary: 56789}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("64c0a44a30b0a7ac19cdf977"),
    '1': ObjectId("64c0a44a30b0a7ac19cdf978"),
    '2': ObjectId("64c0a44a30b0a7ac19cdf979")
  }
}
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf975"), age: 56 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf976"), age: 46 },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf977"),
    name: 'safan',
    age: 22,
    profession: 'teacher'
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf978"),
    name: 'mahesh',
    age: 34
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf979"),
    name: 'adarsh',
    age: 40,
    salary: 56789
  }
]
bootcamp> db.employee.findOne()
{
  _id: ObjectId("64c09c327ca4070377dcfbb2"),
  name: 'adarsh',
  department: 'data',
  age: 22
}
bootcamp> db.employee.findOne({})
{
  _id: ObjectId("64c09c327ca4070377dcfbb2"),
  name: 'adarsh',
  department: 'data',
  age: 22
}
bootcamp> db.employee.findOne({age: 22})
{
  _id: ObjectId("64c09c327ca4070377dcfbb2"),
  name: 'adarsh',
  department: 'data',
  age: 22
}
bootcamp> db.employee.find({age: 22})
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf977"),
    name: 'safan',
    age: 22,
    profession: 'teacher'
  }
]
bootcamp> db.employee.find({age: 22},{name: 1})
[
  { _id: ObjectId("64c09c327ca4070377dcfbb2"), name: 'adarsh' },
  { _id: ObjectId("64c09fac6897203ba81cdd58"), name: 'hello' },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa' },
  { _id: ObjectId("64c0a44a30b0a7ac19cdf977"), name: 'safan' }
]
bootcamp> db.employee.find({age: 22},{age: 1})
[
  { _id: ObjectId("64c09c327ca4070377dcfbb2"), age: 22 },
  { _id: ObjectId("64c09fac6897203ba81cdd58"), age: 22 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), age: 22 },
  { _id: ObjectId("64c0a44a30b0a7ac19cdf977"), age: 22 }
]
bootcamp> db.employee.find({age: 22},{department: 1})
[
  { _id: ObjectId("64c09c327ca4070377dcfbb2"), department: 'data' },
  { _id: ObjectId("64c09fac6897203ba81cdd58"), department: 'hr' },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974") },
  { _id: ObjectId("64c0a44a30b0a7ac19cdf977") }
]
bootcamp> db.employee.find({age: 22},{title: 1})
[
  { _id: ObjectId("64c09c327ca4070377dcfbb2") },
  { _id: ObjectId("64c09fac6897203ba81cdd58") },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974") },
  { _id: ObjectId("64c0a44a30b0a7ac19cdf977") }
]
bootcamp> db.employee.find({age: 22},{title: 1})
bootcamp> db.employee.find({age: 22},{department: 1, name: 1})
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data'
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr'
  },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa' },
  { _id: ObjectId("64c0a44a30b0a7ac19cdf977"), name: 'safan' }
]
bootcamp> db.table.insertOne({name: "hello"})
{
  acknowledged: true,
  insertedId: ObjectId("64c0a7b230b0a7ac19cdf97a")
}
bootcamp> show dbs
admin        40.00 KiB
bootcamp     80.00 KiB
config      108.00 KiB
local        72.00 KiB
playground   72.00 KiB
vidly        12.00 KiB
bootcamp> show collections
employee
table
bootcamp> db.product.insertOne({_id: 1, name: "virat", profession:"cricket"})
{ acknowledged: true, insertedId: 1 }
bootcamp> show collections
employee
product
table
bootcamp> db.product.find()
[ { _id: 1, name: 'virat', profession: 'cricket' } ]
bootcamp> db.table.find()
[ { _id: ObjectId("64c0a7b230b0a7ac19cdf97a"), name: 'hello' } ]
bootcamp> 
(To exit, press Ctrl+C again or Ctrl+D or type .exit)
bootcamp> 
 shubhamkumar@SHUBHAMs-MacBook-Pro  ~  brew services stop mongodb-community@6.0
Stopping `mongodb-community`... (might take a while)
==> Successfully stopped `mongodb-community` (label: homebrew
 shubhamkumar@SHUBHAMs-MacBook-Pro  ~  brew services start mongodb-community@6.0
==> Successfully started `mongodb-community` (label: homebrew
 shubhamkumar@SHUBHAMs-MacBook-Pro  ~  mongod --config /usr/local/etc/mongod.conf --fork
about to fork child process, waiting until server is ready for connections.
forked process: 11313
ERROR: child process failed, exited with 48
To see additional information in this output, start without the "--fork" option.
 ✘ shubhamkumar@SHUBHAMs-MacBook-Pro  ~  mongosh
Current Mongosh Log ID:	64c0b3c8f164a19222b93c11
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.10.1
Using MongoDB:		6.0.6
Using Mongosh:		1.10.1

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2023-07-26T11:18:42.739+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
  You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
test> shoow dbs
Uncaught:
SyntaxError: Missing semicolon. (1:5)

> 1 | shoow dbs
    |      ^
  2 |

test> show dbs
admin        40.00 KiB
bootcamp    152.00 KiB
config      108.00 KiB
local        72.00 KiB
playground   72.00 KiB
vidly        12.00 KiB
test> use bootcamp
switched to db bootcamp
bootcamp> show collections
employee
product
table
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf975"), age: 56 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf976"), age: 46 },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf977"),
    name: 'safan',
    age: 22,
    profession: 'teacher'
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf978"),
    name: 'mahesh',
    age: 34
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf979"),
    name: 'adarsh',
    age: 40,
    salary: 56789
  }
]
bootcamp> db.products.insertMany([
...     { "_id" : 1, "name" : "xPhone", "price" : 799, "releaseDate": ISODate("2011-05-14"), "spec" : { "ram" : 4, "screen" : 6.5, "cpu" : 2.66 },"color":["white","black"],"storage":[64,128,256]},
...     { "_id" : 2, "name" : "xTablet", "price" : 899, "releaseDate": ISODate("2011-09-01") , "spec" : { "ram" : 16, "screen" : 9.5, "cpu" : 3.66 },"color":["white","black","purple"],"storage":[128,256,512]},
...     { "_id" : 3, "name" : "SmartTablet", "price" : 899, "releaseDate": ISODate("2015-01-14"), "spec" : { "ram" : 12, "screen" : 9.7, "cpu" : 3.66 },"color":["blue"],"storage":[16,64,128]},
...     { "_id" : 4, "name" : "SmartPad", "price" : 699, "releaseDate": ISODate("2020-05-14"),"spec" : { "ram" : 8, "screen" : 9.7, "cpu" : 1.66 },"color":["white","orange","gold","gray"],"storage":[128,256,1024]},
...     { "_id" : 5, "name" : "SmartPhone", "price" : 599,"releaseDate": ISODate("2022-09-14"), "spec" : { "ram" : 4, "screen" : 9.7, "cpu" : 1.66 },"color":["white","orange","gold","gray"],"storage":[128,256]}
...  ])
{
  acknowledged: true,
  insertedIds: { '0': 1, '1': 2, '2': 3, '3': 4, '4': 5 }
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 799,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> show collections
employee
product
products
table
bootcamp> db.products.find({
...     price: {
...         $eq: 899
...     }
... }, {
...     name: 1,
...     price: 1
... })
[
  { _id: 2, name: 'xTablet', price: 899 },
  { _id: 3, name: 'SmartTablet', price: 899 }
]
bootcamp> db.products.find({
...     color: {
...         $eq: "black"
...     }
... }, {
...     name: 1,
...     color: 1
... })
[
  { _id: 1, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 2, name: 'xTablet', color: [ 'white', 'black', 'purple' ] }
]
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 799,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 799,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 533,
    name: 'SmartPhone',
    price: 599,
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> db.products.find(price: {$eq: 2000}})
Uncaught:
SyntaxError: Unexpected token, expected "," (1:22)

> 1 | db.products.find(price: {$eq: 2000}})
    |                       ^
  2 |

bootcamp> db.products.find({price: {$eq: 2000}})

bootcamp> db.products.find({price: {$eq: 20}})

bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 799,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 533,
    name: 'SmartPhone',
    price: 599,
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> db.products.find({price: {$eq: 20}})

bootcamp> db.products.find({price: {$gt: 20}})
[
  {
    _id: 1,
    name: 'xPhone',
    price: 799,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 533,
    name: 'SmartPhone',
    price: 599,
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> db.products.find({price: {$eq: 599}})
[
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 533,
    name: 'SmartPhone',
    price: 599,
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  }
]
bootcamp> db.products.find({
...     $and: [{
...         price: 699
...     }, {
...         price: {
...             $exists: true
...         }
...     }]
... }, {
...     name: 1,
...     price: 1,
...     color: 1
... })
[
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    color: [ 'white', 'orange', 'gold', 'gray' ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    color: [ 'white', 'orange', 'gold', 'gray' ]
  }
]
bootcamp> db.products.find({ $and: [{ price: 699 }, { price: { $exists: true } }] })
[
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  }
]
bootcamp> db.products.updateOne({
...     _id: 1
... }, {
...     $set: {
...         price: 899
...     }
... })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
bootcamp> db.products.updateOne({
...     _id: 1
... }, {
...     $set: {
...         price: 899
...     }
...         price: 899
bootcamp> db.products.updateOne({
...     _id: 1
... }, {
...     $set: {
...         price: 899
...     }
...         price: 899
bootcamp> db.products.deleteOne({ _id: 10 })
{ acknowledged: true, deletedCount: 0 }
bootcamp> db.products.deleteOne({ _id: 533 })
{ acknowledged: true, deletedCount: 1 }
Last login: Wed Jul 26 11:28:23 on ttys001
 shubhamkumar@SHUBHAMs-MacBook-Pro  ~  mongosh
Current Mongosh Log ID:	64c0dbe0e2393f387c6d111a
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.10.1
Using MongoDB:		6.0.6
Using Mongosh:		1.10.1

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2023-07-26T11:18:42.739+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
  You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
test> show dbs
admin        40.00 KiB
bootcamp    256.00 KiB
config       68.00 KiB
local        72.00 KiB
playground   72.00 KiB
vidly        12.00 KiB
test> use bootcamp
switched to db bootcamp
bootcamp> show collections
employee
product
products
table
bootcamp> db.employee.find()
[
  {
    _id: ObjectId("64c09c327ca4070377dcfbb2"),
    name: 'adarsh',
    department: 'data',
    age: 22
  },
  {
    _id: ObjectId("64c09fac6897203ba81cdd58"),
    name: 'hello',
    department: 'hr',
    age: 22,
    bonus: 34567
  },
  { _id: ObjectId("64c0a28930b0a7ac19cdf973"), age: 32 },
  { _id: ObjectId("64c0a2aa30b0a7ac19cdf974"), name: 'kapa', age: 22 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf975"), age: 56 },
  { _id: ObjectId("64c0a37a30b0a7ac19cdf976"), age: 46 },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf977"),
    name: 'safan',
    age: 22,
    profession: 'teacher'
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf978"),
    name: 'mahesh',
    age: 34
  },
  {
    _id: ObjectId("64c0a44a30b0a7ac19cdf979"),
    name: 'adarsh',
    age: 40,
    salary: 56789
  }
]
bootcamp> db.products.find(0
... 
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  }
]
bootcamp> db.products.insertOne({name: "iphone5s", id: 2332, contact: [123, 456, 789]});
{
  acknowledged: true,
  insertedId: ObjectId("64c0df52e2393f387c6d111b")
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332,
    contact: [ 123, 456, 789 ]
  }
]
bootcamp> db.products.find({contact: {$size: 2}})

bootcamp> db.products.find({
...     color: {
...         $size: 2
...     }
... }, {
...     name: 1,
...     color: 1
... })
[
  { _id: 1, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 101, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 1011, name: 'xPhone', color: [ 'white', 'black' ] }
]
bootcamp> db.products.find({ contact: { $size: 2 } }, { name: 1, color: 1 })

bootcamp> db.products.find({ contact: { $size: 2 } })

bootcamp> db.products.find({ contact: { $size: 3 } })
[
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332,
    contact: [ 123, 456, 789 ]
  }
]
bootcamp> db.products.find({
...     color: {
...         $all: ["black", "white"]
...     }
... }, {
...     name: 1,
...     color: 1
... })
[
  { _id: 1, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 2, name: 'xTablet', color: [ 'white', 'black', 'purple' ] },
  { _id: 101, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 1011, name: 'xPhone', color: [ 'white', 'black' ] },
  { _id: 2044, name: 'xTablet', color: [ 'white', 'black', 'purple' ] }
]
bootcamp> db.products.find({
...     storage: {
...         $elemMatch: {
...             $lt: 128
...         }
...     }
... }, {
...     name: 1,
...     storage: 1
... });
[
  { _id: 1, name: 'xPhone', storage: [ 64, 128, 256 ] },
  { _id: 3, name: 'SmartTablet', storage: [ 16, 64, 128 ] },
  { _id: 101, name: 'xPhone', storage: [ 64, 128, 256 ] },
  { _id: 33, name: 'SmartTablet', storage: [ 16, 64, 128 ] }
]
bootcamp> db.products.find({contact: {$elemMatch: 123}})
MongoServerError: $elemMatch needs an Object
bootcamp> db.products.find({contact: {$elemMatch: {$eq: 123}}})
[
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332,
    contact: [ 123, 456, 789 ]
  }
]
bootcamp> db.products.updateOne({_id: 1}, {$set: {contact: [123, 456]}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ],
    contact: [ 123, 456 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332,
    contact: [ 123, 456, 789 ]
  }
]
bootcamp> db.products.updateMany({}, {$unset:  {contact: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 11,
  modifiedCount: 2,
  upsertedCount: 0
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332
  }
]
bootcamp> db.products.updateMany({_id: 2}, {$unset:  {contact: "5678"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 0,
  upsertedCount: 0
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332
  }
]
bootcamp> db.products.updateMany({_id: 2}, {$set:  {contact: "5678"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ],
    contact: '5678'
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332
  }
]
bootcamp> db.products.updateMany({_id: 2}, {$set:  {contact: "56789"}}, {$upsert: true})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
bootcamp> d.products.find()
ReferenceError: d is not defined
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ],
    contact: '56789'
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332
  }
]
bootcamp> db.products.updateMany({_id: 2332}, {$set:  {contact: "56789"}}, {$upsert: true})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
bootcamp> db.products.find()
[
  {
    _id: 1,
    name: 'xPhone',
    price: 899,
    releaseDate: ISODate("2011-05-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 2,
    name: 'xTablet',
    price: 899,
    releaseDate: ISODate("2011-09-01T00:00:00.000Z"),
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ],
    contact: '56789'
  },
  {
    _id: 3,
    name: 'SmartTablet',
    price: 899,
    releaseDate: ISODate("2015-01-14T00:00:00.000Z"),
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 4,
    name: 'SmartPad',
    price: 699,
    releaseDate: ISODate("2020-05-14T00:00:00.000Z"),
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: 5,
    name: 'SmartPhone',
    price: 599,
    releaseDate: ISODate("2022-09-14T00:00:00.000Z"),
    spec: { ram: 4, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256 ]
  },
  {
    _id: 101,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ],
    storage: [ 64, 128, 256 ]
  },
  {
    _id: 1011,
    name: 'xPhone',
    price: 799,
    spec: { ram: 4, screen: 6.5, cpu: 2.66 },
    color: [ 'white', 'black' ]
  },
  {
    _id: 2044,
    name: 'xTablet',
    price: 899,
    spec: { ram: 16, screen: 9.5, cpu: 3.66 },
    color: [ 'white', 'black', 'purple' ],
    storage: [ 128, 256, 512 ]
  },
  {
    _id: 33,
    name: 'SmartTablet',
    price: 899,
    spec: { ram: 12, screen: 9.7, cpu: 3.66 },
    color: [ 'blue' ],
    storage: [ 16, 64, 128 ]
  },
  {
    _id: 433,
    name: 'SmartPad',
    price: 699,
    spec: { ram: 8, screen: 9.7, cpu: 1.66 },
    color: [ 'white', 'orange', 'gold', 'gray' ],
    storage: [ 128, 256, 1024 ]
  },
  {
    _id: ObjectId("64c0df52e2393f387c6d111b"),
    name: 'iphone5s',
    id: 2332
  }
]
# exercise----------------------------
Last login: Wed Jul 26 14:38:07 on ttys001
 shubhamkumar@SHUBHAMs-MacBook-Pro  ~  mongosh
Current Mongosh Log ID:	64c0f56045b14dbec2d7f149
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.10.1
Using MongoDB:		6.0.6
Using Mongosh:		1.10.1

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2023-07-26T11:18:42.739+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
  You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
test> db.movies.insert({title:"Fight Club", writer: "Chuck Palahniuk", year: "1999", actors:["Brad Pitt", "Edward Norton"]})
DeprecationWarning: Collection.insert() is deprecated. Use insertOne, insertMany, or bulkWrite.
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f83a45b14dbec2d7f14a") }
}
test> db.movies.find()
[
  {
    _id: ObjectId("64c0f83a45b14dbec2d7f14a"),
    title: 'Fight Club',
    writer: 'Chuck Palahniuk',
    year: '1999',
    actors: [ 'Brad Pitt', 'Edward Norton' ]
  }
]
test>  db.movies.insert({title:"Pulp Fiction", writer:"Quentin Tarantino", year:"2009", actors:["John Travolta", "Uma Thurman"]})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f84e45b14dbec2d7f14b") }
}
test> 

test> db.movies.insert({title:"Inglorious Basterds", writer:"Quentin Tarantino", year:"2009", actors:["Brad Pitt", "Diane Kruger", "Eli Roth"]})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f85745b14dbec2d7f14c") }
}
test> db.movies.insert({title:"The Hobbit: An unexpected Journey", writer:"J.R.R. Tolkein", year:"2012",franchise:"The Hobbit"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f86145b14dbec2d7f14d") }
}
test> db.movies.insert({title:"The Hobbit: The Desolation of Smaug", writer:"J.R.R Tolkien", year:"2013", franchise:"The Hobbit"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f8b145b14dbec2d7f14e") }
}
test> 

test> db.movies.insert({title:"The Hobbit: The Battle of the Five Armies", writer:"J.R.R Tolkien", year:"2002", franchise:"The Hobbit", synopsis:"Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness."})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f8bf45b14dbec2d7f14f") }
}
test> db.movies.insert({title:"Pee Wee Herman's Big Adventures"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("64c0f8cb45b14dbec2d7f150") }
}
test> db.movies.find()
[
  {
    _id: ObjectId("64c0f83a45b14dbec2d7f14a"),
    title: 'Fight Club',
    writer: 'Chuck Palahniuk',
    year: '1999',
    actors: [ 'Brad Pitt', 'Edward Norton' ]
  },
  {
    _id: ObjectId("64c0f84e45b14dbec2d7f14b"),
    title: 'Pulp Fiction',
    writer: 'Quentin Tarantino',
    year: '2009',
    actors: [ 'John Travolta', 'Uma Thurman' ]
  },
  {
    _id: ObjectId("64c0f85745b14dbec2d7f14c"),
    title: 'Inglorious Basterds',
    writer: 'Quentin Tarantino',
    year: '2009',
    actors: [ 'Brad Pitt', 'Diane Kruger', 'Eli Roth' ]
  },
  {
    _id: ObjectId("64c0f86145b14dbec2d7f14d"),
    title: 'The Hobbit: An unexpected Journey',
    writer: 'J.R.R. Tolkein',
    year: '2012',
    franchise: 'The Hobbit'
  },
  {
    _id: ObjectId("64c0f8b145b14dbec2d7f14e"),
    title: 'The Hobbit: The Desolation of Smaug',
    writer: 'J.R.R Tolkien',
    year: '2013',
    franchise: 'The Hobbit'
  },
  {
    _id: ObjectId("64c0f8bf45b14dbec2d7f14f"),
    title: 'The Hobbit: The Battle of the Five Armies',
    writer: 'J.R.R Tolkien',
    year: '2002',
    franchise: 'The Hobbit',
    synopsis: 'Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness.'
  },
  {
    _id: ObjectId("64c0f8cb45b14dbec2d7f150"),
    title: "Pee Wee Herman's Big Adventures"
  }
]
test> 

test> db.movies.find({writer:"Quentin Tarantino"})
[
  {
    _id: ObjectId("64c0f84e45b14dbec2d7f14b"),
    title: 'Pulp Fiction',
    writer: 'Quentin Tarantino',
    year: '2009',
    actors: [ 'John Travolta', 'Uma Thurman' ]
  },
  {
    _id: ObjectId("64c0f85745b14dbec2d7f14c"),
    title: 'Inglorious Basterds',
    writer: 'Quentin Tarantino',
    year: '2009',
    actors: [ 'Brad Pitt', 'Diane Kruger', 'Eli Roth' ]
  }
]
test> db.movies.find({actors:"Brad Pitt"})
[
  {
    _id: ObjectId("64c0f83a45b14dbec2d7f14a"),
    title: 'Fight Club',
    writer: 'Chuck Palahniuk',
    year: '1999',
    actors: [ 'Brad Pitt', 'Edward Norton' ]
  },
  {
    _id: ObjectId("64c0f85745b14dbec2d7f14c"),
    title: 'Inglorious Basterds',
    writer: 'Quentin Tarantino',
    year: '2009',
    actors: [ 'Brad Pitt', 'Diane Kruger', 'Eli Roth' ]
  }
]
test> 

test> db.movies.find({franchise:"The Hobbit"})
[
  {
    _id: ObjectId("64c0f86145b14dbec2d7f14d"),
    title: 'The Hobbit: An unexpected Journey',
    writer: 'J.R.R. Tolkein',
    year: '2012',
    franchise: 'The Hobbit'
  },
  {
    _id: ObjectId("64c0f8b145b14dbec2d7f14e"),
    title: 'The Hobbit: The Desolation of Smaug',
    writer: 'J.R.R Tolkien',
    year: '2013',
    franchise: 'The Hobbit'
  },
  {
    _id: ObjectId("64c0f8bf45b14dbec2d7f14f"),
    title: 'The Hobbit: The Battle of the Five Armies',
    writer: 'J.R.R Tolkien',
    year: '2002',
    franchise: 'The Hobbit',
    synopsis: 'Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness.'
  }
]
test> db.movies.find({year:{$gt:"1990", $lt:"2000"}})
[
  {
    _id: ObjectId("64c0f83a45b14dbec2d7f14a"),
    title: 'Fight Club',
    writer: 'Chuck Palahniuk',
    year: '1999',
    actors: [ 'Brad Pitt', 'Edward Norton' ]
  }
]
test> db.movies.update({_id:ObjectId("5c9f98e5e5c2dfe9b3729bfe")}, {$set:{synopsis:"A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home - and the gold within it - from the dragon Smaug."}})
DeprecationWarning: Collection.update() is deprecated. Use updateOne, updateMany, or bulkWrite.
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
test> db.movies.update({_id:ObjectId("5c9fa42ae5c2dfe9b3729c03")}, {$set:{synopsis:"The dwarves, along with Bilbo Baggins and Gandalf the Grey, continue their quest to reclaim Erebor, their homeland, from Smaug. Bilbo Baggins is in possession of a mysterious and magical ring."}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
test> 

test> db.movies.update({_id:ObjectId("5c9f983ce5c2dfe9b3729bfc")}, {$push:{actors:"Samuel L. Jackson"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
test> db.movies.find({synopsis:{$regex:"Bilbo"}})
[
  {
    _id: ObjectId("64c0f8bf45b14dbec2d7f14f"),
    title: 'The Hobbit: The Battle of the Five Armies',
    writer: 'J.R.R Tolkien',
    year: '2002',
    franchise: 'The Hobbit',
    synopsis: 'Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness.'
  }
]
test> db.movies.find({synopsis:{$regex:"Gandalf"}})

test> db.movies.find({$and:[{synopsis:{$regex:"Bilbo"}}, {synopsis:{$not:/Gandalf/}}]})
[
  {
    _id: ObjectId("64c0f8bf45b14dbec2d7f14f"),
    title: 'The Hobbit: The Battle of the Five Armies',
    writer: 'J.R.R Tolkien',
    year: '2002',
    franchise: 'The Hobbit',
    synopsis: 'Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness.'
  }
]
test> 


