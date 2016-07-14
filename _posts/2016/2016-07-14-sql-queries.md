---
title: "SQL Part 03: Queries"
date: 2016-07-14 12:30
modified: 2016-07-14
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  One of the core purposes of the SQL language is to **retrieve information stored in a database**. This is commonly referred to as querying. **Queries** allow us to **communicate** with the **database** by asking **questions** and having the result set return data relevant to the question.
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

One of the core purposes of the SQL language is to **retrieve information stored in a database**. This is commonly referred to as querying. **Queries** allow us to **communicate** with the **database** by asking **questions** and having the result set return data relevant to the question.

## Select-II

Using `SELECT` filter queries to make the information more specific and useful.

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

### And

```sql
SELECT * FROM movies
WHERE year BETWEEN 1990 and 2000
AND genre = 'comedy';
```

Sometimes you want to combine multiple conditions in a `WHERE` clause to make the result set more specific and useful. One way of doing this is to use the `AND` operator.

1. `year BETWEEN 1990 and 2000` is the first condition in the WHERE clause.
2. `AND genre = 'comedy'` is the second condition in the WHERE clause.
3. `AND` is an operator that combines two conditions. **Both** conditions must be **true** for the row to be included in the result set. Here, we use the `AND` operator to only return movies made between 1990 and 2000 that are also comedies.

### Or

```sql
SELECT * FROM movies
WHERE genre = 'comedy'
OR year < 1980;
```

The `OR` operator can also be used to combine more than one condition in a `WHERE` clause. The `OR` operator evaluates each condition separately and if **any** of the conditions are **true** then the row is added to the result set.


1. `WHERE genre = 'comedy'` is the first condition in the WHERE clause.

2. `OR year < 1980` is the second condition in the WHERE clause.

3. `OR` is an operator that filters the result set to only include rows where either condition is true. Here, we return movies that either have a genre of comedy or were released before 1980.

### Order by

```sql
SELECT * FROM movies
ORDER BY imdb_rating DESC;
```

You can sort the results of your query using `ORDER BY`. Sorting the results often makes the data more useful and easier to analyze.

1. `ORDER BY` is a clause that indicates you want to sort the result set by a particular column either alphabetically or numerically.

2. `imdb_rating` is the name of the column that will be sorted.

3. `DESC` is a keyword in SQL that is used with `ORDER BY` to sort the results in **descending order** (high to low or Z-A). Here, it sorts all of the movies from highest to lowest by their IMDb rating.


It is also possible to sort the results in ascending order. `ASC` is a keyword in SQL that is used with `ORDER BY` to sort the results in **ascending order** (low to high or A-Z).

### Limit

```sql
SELECT * FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;
```

Sometimes even filtered results can return thousands of rows in large databases. In these situations it becomes important to cap the number of rows in a result set.

`LIMIT` is a clause that lets you specify the maximum number of rows the result set will have. Here, we specify that the result set can not have more than three rows.

## Summary

1. `SELECT` is the clause you use every time you want to query information from a database.
2. `WHERE` is a popular command that lets you filter the results of the query based on conditions that you specify.
3. `LIKE` and `BETWEEN` are special operators that can be used in a `WHERE` clause
4. `AND` and `OR` are special operators that you can use with `WHERE` to filter the query on two or more conditions.
5. `ORDER BY` lets you sort the results of the query in either ascending or descending order.
6. `LIMIT` lets you specify the maximum number of rows that the query will return. This is especially important in large tables that have thousands or even millions of rows.
