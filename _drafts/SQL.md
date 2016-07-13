# SQL

## SQL Basics

**SQL**, 'Structured Query Language', is a programming language designed to manage data stored in **relational databases**. SQL operates through simple, declarative statements. This keeps data accurate and secure, and helps maintain the integrity of databases, regardless of size.

The SQL language is widely used today across **web frameworks** and **database applications**. Knowing SQL gives you the freedom to explore your data, and the power to make better decisions. By learning SQL, you will also learn concepts that apply to nearly every data storage system.

A **relational database** is a database that organizes information into one or more tables. A **table** is a collection of data organized into rows and columns. Tables are sometimes referred to as **relations**.  A  **column**  is a set of data values of a particular type.  A  **row**  is a single record in a table. 

![img](http://www.pythonlearn.com/html-270/book016.png)

All data stored in a relational database is of a certain data type. Some of the most common data types are: 

1. *Integer*, a positive or negative whole number 
2. *Text*, a text string 
3. *Date*, the date formatted as YYYY-MM-DD for the year, month, and day 
4. *Real*, a decimal value 

##  SQL statements

```sql
CREATE TABLE table_name (
    column_1 data_type, 
    column_2 data_type, 
    column_3 data_type
  );
```

The above code is a SQL statement. A *statement* is text that the database recognizes as a valid command. Statements always end in a semi-colon `;`.

Let's break down the components of a statement:

1. `CREATE TABLE` is a *clause*. Clauses perform specific tasks in SQL. By convention, clauses are written in capital letters. Clauses can also be referred to as commands.
2. `table_name` refers to the name of the table that the command is applied to. 
3. `(column_1 data_type, column_2 data_type, column_3 data_type)` is a *parameter*. A parameter is a list of columns, data types, or values that are passed to a clause as an argument. Here, the parameter is a list of column names and the associated data type.

The number of lines used do not matter. A statement can be written all on one line, or split up across multiple lines if it makes it easier to read. 

### Create

```sql
CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);
```

This `CREATE` statement creates a new table in the database named `celebs`. You can use the `CREATE` statement anytime you want to create a new table from scratch.


1. `CREATE TABLE` is a clause that tells SQL you want to create a new table. 

2. `celebs` is the name of the table. 

3. `(id INTEGER, name TEXT, age INTEGER)` is a list of parameters defining each column in the table and its data type. 


### Insert

```sql
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);
```

This `INSERT` statement inserts new rows into a table. You can use the `INSERT` statement when you want to add new records.

1. `INSERT INTO` is a clause that adds the specified row or rows. 

2. `celebs` is the name of the table the row is added to. 

3. `(id, name, age)` is a parameter identifying the columns that data will be inserted into. 

4. `VALUES` is a clause that indicates the data being inserted. 
   `(1, 'Justin Bieber', 21)` is a parameter identifying the values being inserted.


### Select

```sql
SELECT name FROM celebs;
```

`SELECT` statements are used to fetch data from a database. Here, `SELECT` returns all data in the `name` column of the `celebs` table.

1. `SELECT` is a clause that indicates that the statement is a query. You will use `SELECT` every time you query data from a database. 
2. `name` specifies the column to query data from. 
3. `FROM celebs` specifies the name of the table to query data from. In this statement, data is queried from the `celebs` table. 


You can also query data from all columns in a table with `SELECT`.

```sql
SELECT * FROM celebs;
```

`*` is a special **wildcard character** that we have been using. It allows you to select every column in a table without having to name each one individually. Here, the result set contains every column in the `celebs` table.

`SELECT` statements always return a new table called the *result set*.

### Update

```sql
UPDATE celebs
SET age = 22
WHERE id = 1;
```

The `UPDATE` statement edits a row in the table. You can use the `UPDATE` statement when you want to change existing records.

1. `UPDATE` is a clause that edits a row in the table. 
2. `celebs` is the name of the table. 
3. `SET` is a clause that indicates the column to edit. 

    - `age` is the name of the column that is going to be updated
    - `22` is the new value that is going to be inserted into the `age` column.
4. `WHERE` is a clause that indicates which row(s) to update with the new column value. Here the row with a `1` in the `id` column is the row that will have the `age` updated to `22`.


### Alter

```sql
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;
```

The `ALTER TABLE` statement added a new column to the table. You can use this command when you want to add columns to a table.

1.  `ALTER TABLE` is a clause that lets you make the specified changes. 
2.  `celebs` is the name of the table that is being changed. 
3.  `ADD COLUMN` is a clause that lets you add a new column to a table. 

    - `twitter_handle` is the name of the new column being added
    - `TEXT` is the data type for the new column
4.  `NULL` is a special value in SQL that represents **missing or unknown data**. Here, the rows that existed before the column was added

    ```sql
              have `NULL` values for `twitter_handle`.
    ```

### Delete

```sql
DELETE FROM celebs WHERE twitter_handle IS NULL;
```

The `DELETE FROM` statement deletes one or more rows from a table. You can use the statement when you want to delete existing records.

1. `DELETE FROM` is a clause that lets you delete rows from a table.
2. `celebs` is the name of the table we want to delete rows from.
3. `WHERE` is a clause that lets you select which rows you want to delete. Here we want to delete all of the rows where the twitter_handle column `IS NULL`.
4. `IS NULL` is a condition in SQL that returns true when the value is `NULL` and false otherwise. 

## Summary

We've learned six commands commonly used to manage data stored in a relational database. What can we generalize so far?

- *SQL* is a programming language designed to manipulate and manage data stored in relational databases.
  - A *relational database* is a database that organizes information into one or more tables.
  - A *table* is a collection of data organized into rows and columns.
- A *statement* is a string of characters that the database recognizes as a valid command.
  - `CREATE TABLE` creates a new table.
  - `INSERT INTO` adds a new row to a table.
  - `SELECT` queries data from a table. 
  - `UPDATE` edits a row in a table.
  - `ALTER TABLE` changes an existing table.
  - `DELETE FROM` deletes rows from a table.

# Queries

One of the core purposes of the SQL language is to retrieve information stored in a database. This is commonly referred to as querying. **Queries** allow us to **communicate** with the **database** by asking **questions** and having the result set return data relevant to the question.

## Select-II

### SELECT DISTINCT

```sql
SELECT DISTINCT genre FROM movies;
```

`SELECT DISTINCT` is used to return **unique values** in the result set. **It filters out all duplicate values**. 

1. `SELECT DISTINCT` specifies that the statement is going to be a query that returns unique values in the specified column(s)
2. `genre` is the name of the column to display in the result set.
3. `FROM movies` indicates the table name to query from.


Filtering the results of a query is an important skill in SQL. 

### WHERE

```sql
  SELECT * FROM movies
  WHERE imdb_rating > 8;
```

This statement filters the result set to only include movies with IMDb ratings greater than 8. How does it work?

1. `WHERE` is a clause that indicates you want to filter the result set to include only rows where the following *condition* is true.

2. `imdb_rating > 8` is a condition that filters the result set. Here, only rows with a value greater than 8 in the `imdb_rating` column will be returned in the result set.

3. `>` is an *operator*. Operators create a condition that can be evaluated as either true or false. Common operators used with the `WHERE` clause are:

    - `=` equals
    - `!=` not equals
    - `>` greater than
    - `<` less than
    - `>=` greater than or equal to
    - `<=` less than or equal to


### LIKE I

```sql
SELECT * FROM movies
WHERE name LIKE 'Se_en';
```

`LIKE` can be a useful operator when you want to compare similar values. Here, we are comparing two movies with the same name but are spelled differently.

1. `LIKE` is a special operator used with the `WHERE` clause to search for a specific pattern in a column.
2. `name LIKE Se_en` is a condition evaluating the `name` column for a specific pattern.
3. `Se_en` represents a pattern with a *wildcard* character. The `_` means you can substitute any individual character here **without breaking the pattern**. The names `Seven` and `Se7en` both match this pattern.

### LIKE II

`%` is another wildcard character that can be used with `LIKE`. 

```sql
SELECT * FROM movies
WHERE name LIKE 'A%';
```

This statement filters the result set to only include movies with names that begin with the letter "A"

`%` is a wildcard character that matches zero or more missing letters in the pattern.

- `A%` matches all movies with names that begin with "A"
- `%a` matches all movies that end with "a"

```sql
SELECT * FROM movies WHERE name LIKE '%man%';
```

You can use `%` both before and after a pattern. Here, any movie that contains the word "man" in its name will be returned in the result set. 

Notice, that `LIKE` is not case sensitive. "Batman" and "Man Of Steel" both appear in the result set. 

### Between

The `BETWEEN` operator is used to filter the result set within a certain **range**. The values can be numbers, text or dates.

```sql
SELECT * FROM movies
WHERE name BETWEEN 'A' AND 'J';
```

This statement filters the result set to only include movies with `name`s that begin with letters "A" up to but **not including** "J".

```sql
SELECT * FROM movies WHERE year BETWEEN 1990 AND 2000;
```

In this statement, the `BETWEEN` operator is being used to filter the result set to only include movies with `year`s between 1990 up to and **including** 2000.