---
title: "Python Part 14: Using databases and Structured Query Language (SQL)"
date: 2016-07-12 09:00
modified: 2016-07-12
categories:
  - Python
tags:
  - Python Application
  - Python 2.x
  - SQL
  - SQLite
  - Database
published: true
excerpt: |
  A database is a file that is organized for storing data. Most databases are organized like a dictionary in the sense that they map from keys to values.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

## What is a database?

A **database** is a file that is organized for storing data. Most databases are organized like a dictionary in the sense that they map from keys to values. The biggest difference is that the database is **on disk** (or other permanent storage), so it persists after the program ends.

**Like a dictionary**, database software is designed to keep the inserting and accessing of data very fast, even for large amounts of data. Database software maintains its performance by building **indexes** as data is added to the database to allow the computer to jump quickly to a particular entry.

When you first look at a database it looks **like a spreadsheet** with multiple sheets. The primary data structures in a database are:tables, rows, and columns. 

![img](http://www.pythonlearn.com/html-270/book016.png)

In technical descriptions of relational databases the concepts of **table**, **row**, and **column** are more formally referredto as relation, tuple, and attribute, respectively.We will use the less formal terms in this chapter.

A `relation` is defined as a set of `tuples` that have the same `attributes`.   A `tuple` usually represents an object and information about that object.  Objects are typically physical objects or concepts.   A `relation` is usually described as a table, which is organized into rows and columns.   All the data referenced by an attribute are in the same domain and conform to the same constraints. 

## SQL Basics

**Structured Query Language** is the language we use to issue commands to the database

* Create a table
* Retrieve some data
* Insert data
* Delete data 

A **database model** or **database schema** is the structure or format of a **database**, described in a formal language supported by the database management system. In other words, a “database model” is the application of a data model when used in conjunction with a database management system.

### Common Database Systems

* Three major Database Management Systems in wide use
  * **Oracle** - Large, commercial, enterprise-scale, very very tweakable
  * **MySql** - Simpler but very fast and scalable - commercial open source
  * **SqlServer** - Very nice - from Microsoft (also Access)
* Many other smaller projects, free and open source
  HSQL, **SQLite**, Postgres, ... 

### Creating a database table

When we create a database **table** we must tell the database in advance the names of each of the **columns** in the table and the type of data which we are planning to store in each column. When the database software knows the type of data in each column, it can choose the most efficient way to store and look up the data based on the type of data. 

The code to create a database file and a table named Tracks with two columns in the database is as follows:

```python
import sqlite3

conn = sqlite3.connect('music.sqlite3')
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Tracks ')
cur.execute('CREATE TABLE Tracks (title TEXT, plays INTEGER)')

conn.close()
```

The **connect** operation makes a “connection” to the database stored in the file `music.sqlite3` in the current directory. **If the file does not exist, it will be created**. The reason this is called a “connection” is that sometimes the database is stored on a separate “database server” from the server on which we are running our application.

A `cursor` is like a file handle that we can use to perform operations on the data stored in the database. **Calling `cursor()` is very similar conceptually to calling `open()` when dealing with text files.**

![img](http://www.pythonlearn.com/html-270/book017.png)

Once we have the `cursor`, we can begin to execute commands on the contents of the database using the `execute()` method.

**Database commands** are expressed in a special language that has been standardized across many different database vendors to allow us to learn a single database language. The database language is called **Structured Query Language** or **[SQL](http://en.wikipedia.org/wiki/SQL)** for short.

In our example, we are executing two SQL commands in our database. As a convention, we will show the SQL keywords in **uppercase** and the **parts** of the command that we are adding (such as the table and column names) will be shown in **lowercase**.

The **first** SQL command **removes** the `Tracks` table from the database if it exists. 

```python
cur.execute('DROP TABLE IF EXISTS Tracks ')
```

Note: The `DROP TABLE` command deletes the table and all of its contents from the database (i.e., there is no “undo”).

The **second** command **creates** a table named `Tracks` with a text column named `title` and an integer column named `plays`.

```python
cur.execute('CREATE TABLE Tracks (title TEXT, plays INTEGER)')
```

Now: We have created a table named `Tracks`, we can put some data into that table using the SQL `INSERT` operation. Again, we begin by making a connection to the database and obtaining the `cursor`.We can then execute SQL commands using the `ursor`.

The SQL `INSERT` command indicates which table we are using and then **defines a new row** by listing the fields we want to include (`title, plays`) followed by the `VALUES` we want placed in the new row. 

We specify the values as question **marks(?, ?)** to indicate that the actual values are passed in as a tuple ( ’My Way’, 15 )  as the second parameter to the `execute()` call.

```python
import sqlite3

conn = sqlite3.connect('music.sqlite3') # make a “connection” to the database file-music.sqlite3 
cur = conn.cursor() # like a file handle

cur.execute('INSERT INTO Tracks (title, plays) VALUES ( ?, ? )', 
    ( 'Thunderstruck', 20 ) ) # insert
cur.execute('INSERT INTO Tracks (title, plays) VALUES ( ?, ? )', 
    ( 'My Way', 15 ) )
conn.commit() # write

print 'Tracks:'
cur.execute('SELECT title, plays FROM Tracks') #  retrieve
for row in cur :
   print row

cur.execute('DELETE FROM Tracks WHERE plays < 100') # delete
conn.commit() # write

cur.close()
```

First we `INSERT` two rows into our table and use `commit()` to force the data to be **written** to the database file.

![img](http://www.pythonlearn.com/html-270/book018.png)

Then we use the `SELECT` command to retrieve the rows we just inserted from the table. 

After we execute the `SELECT` statement, the `cursor` is something we can **loop** through in a `for `statement.   

For efficiency, the `cursor` does not read all of the data from the database when we execute the `SELECT` statement. Instead, the data is read on demand as we loop through the rows in the `for `statement.

The output of the program is as follows:

```
Tracks:
(u'Thunderstruck', 20)
(u'My Way', 15)
```

Do not be concerned that the title strings are shown starting with `u’`. This is an indication that the strings are **Unicode** strings that are capable of storing non-Latin character sets.

## Spidering Twitter using a database

We will start by retrieving one person’s Twitter friends and their statuses, looping through the list of friends, and adding each of the friends to a database to be retrieved in the future. After we process one person’s Twitter friends, we check in our database and retrieve one of the friends of the friend. We do this over and over, picking an “unvisited” person, retrieving their friend list, and adding friends we have not seen to our list for a future visit.

This program is a bit complex. It is based on the code from the exercise earlier in the book that uses the Twitter API.

Here is the source code for our Twitter spidering application:

```sql
import urllib
import twurl
import json
import sqlite3

TWITTER_URL = 'https://api.twitter.com/1.1/friends/list.json'

conn = sqlite3.connect('spider.sqlite3')
cur = conn.cursor()

cur.execute('''
CREATE TABLE IF NOT EXISTS Twitter 
(name TEXT, retrieved INTEGER, friends INTEGER)''')

while True:
    acct = raw_input('Enter a Twitter account, or quit: ')
    if ( acct == 'quit' ) : break
    if ( len(acct) < 1 ) :
        cur.execute('SELECT name FROM Twitter WHERE retrieved = 0 LIMIT 1')
        try:
"""
To retrieve data after executing a SELECT statement, 
you can either treat the cursor as an iterator, 
call the cursor’s fetchone() method to retrieve a single matching row, 
or call fetchall() to get a list of the matching rows.
"""
            acct = cur.fetchone()[0] # fetchone() returns the row as a tuple. 
        except:
            print 'No unretrieved Twitter accounts found'
            continue

    url = twurl.augment(TWITTER_URL, 
               {'screen_name': acct, 'count': '20'} )
    print 'Retrieving', url
    connection = urllib.urlopen(url)
    data = connection.read()
    headers = connection.info().dict
    # print 'Remaining', headers['x-rate-limit-remaining']
    js = json.loads(data)
    # print json.dumps(js, indent=4)

    cur.execute('UPDATE Twitter SET retrieved=1 WHERE name = ?', (acct, ) )

    countnew = 0
    countold = 0
    for u in js['users'] :
        friend = u['screen_name']
        print friend
        cur.execute('SELECT friends FROM Twitter WHERE name = ? LIMIT 1', 
            (friend, ) )
        try:
            count = cur.fetchone()[0]
            cur.execute('UPDATE Twitter SET friends = ? WHERE name = ?', 
                (count+1, friend) )
            countold = countold + 1
        except:
            cur.execute('''INSERT INTO Twitter (name, retrieved, friends) 
                VALUES ( ?, 0, 1 )''', ( friend, ) )
            countnew = countnew + 1
    print 'New accounts=',countnew,' revisited=',countold
    conn.commit()

cur.close()
```

## Structured Query Language summary

Since there are so many different database vendors, the Structured Query Language (SQL) was standardized so we could communicate in a portable manner to database systems from multiple vendors.

**A relational database is made up of tables, rows, and columns.** The columns generally have a type such as text, numeric, or date data. When we **createa table**, we indicate the names and types of the columns:

```sql
CREATE TABLE Tracks (title TEXT, plays INTEGER)
```

To **insert a row** into a table, we use the SQL `INSERT` command:

```sql
INSERT INTO Tracks (title, plays) VALUES ('My Way', 15)
```

The `INSERT` statement specifies the table name, then a list of the fields/columns that you would like to set in the new row, and then the keyword `VALUES` and a list of corresponding values for each of the fields.

The SQL `SELECT` command is used to **retrieve** rows and columns from a database.The `SELECT` statement lets you specify which columns you would like to retrieve as well as a `WHERE` clause to select which rows you would like to see. It also allows an optional `ORDER BY` clause to control the sorting of the returned rows.

```sql
SELECT * FROM Tracks WHERE title = 'My Way'
```

Using `*` indicates that you want the database to **return all** of the columns for each row that matches the WHERE clause. 

Note, unlike in Python, in a SQL WHERE clause we use a single equal sign to indicate a test for equality rather than a double equal sign.Other logical operations allowed in a WHERE clause include `<`,`>`,`<=`,`>=`,`!=`,as well as `AND` and `OR` and parentheses to build your logical expressions.

You can request that the returned rows be sorted by one of the fields as follows:

```sql
SELECT title,plays FROM Tracks ORDER BY title
```

To remove a row, you need a `WHERE` clause on an SQL `DELETE`  statement. The `WHERE` clause determines which rows are to be deleted:

```sql
DELETE FROM Tracks WHERE title = 'My Way'
```

It is possible to `UPDATE` a column or columns within one or more rowsin a table using the SQL `UPDATE` statement as follows:

```sql
UPDATE Tracks SET plays = 16 WHERE title = 'My Way'
```

The `UPDATE` statement specifies a table and then a list of fields and values to change after the `SET` keyword and then an optional `WHERE` clause to select the rows that are to be updated.

A single `UPDATE` statement will change all of the rows that match the `WHERE` clause. If a `WHERE` clause is not specified, it performs the `UPDATE` on all of the rows in the table.

These four basic SQL commands (`INSERT`, `SELECT`, `UPDATE`, and `DELETE`) allow the four basic operations needed to create and maintain data.

## Building a Data Model

* Drawing a picture of the data objects for our application and then figuring out how to represent the objects and their relationships

* **Basic Rule**: Don’t put the same string data in twice - use a relationship instead

* When there is one thing in the “real world” there should be one copy of that thing in the database

### Three Kinds of Keys

* **Primary key** - generally an integer auto-increment field
* **Logical key** - What the outside world uses for lookup
* **Foreign key** - generally an integer key pointing to a row in another table

### Database Normalization 

* There is *tons* of database theory - way too much to understand without excessive predicate calculus
* **Do not replicate data** - reference data - point at data
* Use **integers for keys** and for references
* Add a special “**key**” column to each table which we will make references to.   By convention, many programmers call this column “**id**”

### The JOIN Operation

The `JOIN` operation **links across several tables** as part of a select operation.  

You must tell the `JOIN` how to use the keys that make the connection between the tables using an `ON` clause.  

```sql
select Album.title, Artist.name from Album join Artist on Album.artist_id = Artist.id
```

> Note: Joining two tables without an `ON` clause gives all possible combinations of rows.


## Many-To-Many Relationships

In [systems analysis](https://en.wikipedia.org/wiki/Systems_analysis), a **many-to-many** relationship is a type of [cardinality](https://en.wikipedia.org/wiki/Cardinality_%28data_modeling%29) that refers to the relationship between two [entities](https://en.wikipedia.org/wiki/Entity) A and B in which A may contain a [parent](https://en.wikipedia.org/wiki/Hierarchy#Nomenclature) instance for which there are many [children](https://en.wikipedia.org/wiki/Hierarchy#Nomenclature) in B and vice versa.

* Sometimes we need to model a relationship that is many-to-many

* We need to add a "connection" table with two foreign keys

* There is usually no separate primary key

[![File:CPT-Databases-ManytoMany.svg](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/CPT-Databases-ManytoMany.svg/460px-CPT-Databases-ManytoMany.svg.png)](https://en.wikipedia.org/wiki/Many-to-many_(data_model))

[![Databases-ManyToManyWJunction.jpg](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Databases-ManyToManyWJunction.jpg/800px-Databases-ManyToManyWJunction.jpg)](https://en.wikipedia.org/wiki/Many-to-many_(data_model))

An **associative entity(** **junction table**) is a term used in [relational](https://en.wikipedia.org/wiki/Relational_model) and [entity–relationship](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) theory. A relational database requires the implementation of a base relation (or base table) to resolve [many-to-many relationships](https://en.wikipedia.org/wiki/Many-to-many_%28data_model%29). This kind of base relation is called an **associative table**.

As mentioned above, associative entities are implemented in a database structure using **associative tables,** which are tables that can contain references to columns from the same or different database tables within the same database.

![Concept of a mapping table](https://upload.wikimedia.org/wikipedia/commons/d/d7/Mapping_table_concept.png)

```sql
CREATE TABLE User (
    id     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    name   TEXT UNIQUE,
    email  TEXT
)

CREATE TABLE Course (
    id     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    title  TEXT UNIQUE
)

CREATE TABLE Member (
    user_id     INTEGER,
    course_id   INTEGER,
	role        INTEGER,
    PRIMARY KEY (user_id, course_id)
)
```

## Programming with multiple tables

We will now redo the Twitter spider program using two tables, the primarykeys, and the key references as described above. Here is the code for the new version of the program:

```sql
import urllib
import twurl
import json
import sqlite3

TWITTER_URL = 'https://api.twitter.com/1.1/friends/list.json'

conn = sqlite3.connect('friends.sqlitesqlite3')
cur = conn.cursor()

cur.execute("'CREATE TABLE IF NOT EXISTS People 
    (id INTEGER PRIMARY KEY, name TEXT UNIQUE, retrieved INTEGER)"')
cur.execute("'CREATE TABLE IF NOT EXISTS Follows 
    (from_id INTEGER, to_id INTEGER, UNIQUE(from_id, to_id))"')

while True:
    acct = raw_input('Enter a Twitter account, or quit: ')
    if ( acct == 'quit' ) : break
    if ( len(acct) < 1 ) :
        cur.execute("'SELECT id, name FROM People 
            WHERE retrieved = 0 LIMIT 1"')
        try:
            (id, acct) = cur.fetchone()
        except:
            print 'No unretrieved Twitter accounts found'
            continue
    else:
        cur.execute('SELECT id FROM People WHERE name = ? LIMIT 1', 
            (acct, ) )
        try:
            id = cur.fetchone()[0]
        except:
            cur.execute("'INSERT OR IGNORE INTO People (name, retrieved) 
                VALUES ( ?, 0)"', ( acct, ) )
            conn.commit()
            if cur.rowcount != 1 : 
                print 'Error inserting account:',acct
                continue
            id = cur.lastrowid

    url = twurl.augment(TWITTER_URL, 
       {'screen_name': acct, 'count': '20'} )
    print 'Retrieving account', acct
    connection = urllib.urlopen(url)
    data = connection.read()
    headers = connection.info().dict
    print 'Remaining', headers['x-rate-limit-remaining']

    js = json.loads(data)
    # print json.dumps(js, indent=4)

    cur.execute('UPDATE People SET retrieved=1 WHERE name = ?', (acct, ) )

    countnew = 0
    countold = 0
    for u in js['users'] :
        friend = u['screen_name']
        print friend
        cur.execute('SELECT id FROM People WHERE name = ? LIMIT 1', 
            (friend, ) )
        try:
            friend_id = cur.fetchone()[0]
            countold = countold + 1
        except:
            cur.execute("'INSERT OR IGNORE INTO People (name, retrieved) 
                VALUES ( ?, 0)"', ( friend, ) )
            conn.commit()
            if cur.rowcount != 1 :
                print 'Error inserting account:',friend
                continue
            friend_id = cur.lastrowid
            countnew = countnew + 1
        cur.execute("'INSERT OR IGNORE INTO Follows (from_id, to_id) 
            VALUES (?, ?)"', (id, friend_id) )
    print 'New accounts=',countnew,' revisited=',countold
    conn.commit()

cur.close()
```

This program is starting to get a bit complicated, but it illustratesthe patterns that we need to use when we areusing integer keys to link tables. The basic patterns are:

1. Create tables with primary keys and constraints.
2. When we have a logical key for a person (i.e., accountname) and we need the id value for the person,depending on whether or not the person is alreadyin the People table we either need to: (1) look up the person in the People table and retrieve the id value for the person or (2) add the person to the People table and get the id value for the newly added row.
3. Insert the row that captures the “follows” relationship.

We will cover each of these in turn.

## More Info

[Many-to-many (data model)](https://en.wikipedia.org/wiki/Many-to-many_%28data_model%29)

[Associative entity](https://en.wikipedia.org/wiki/Associative_entity)

[使用SQLite](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001388320596292f925f46d56ef4c80a1c9d8e47e2d5711000)


[^1]: 使用Cursor对象执行select语句时，通过`featchall()`可以拿到结果集。结果集是一个list，每个元素都是一个tuple，对应一行记录。
