---
title: "SQL Part 02: SQL Basics"
date: 2016-07-14 12:20
modified: 2016-07-14
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  A statement is text that the database recognizes as a valid command.
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

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
