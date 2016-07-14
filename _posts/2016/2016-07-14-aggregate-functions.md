---
title: "SQL Part 04: Aggregate Functions"
date: 2016-07-14 12:36
modified: 2016-07-14
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  *Aggregate functions* compute a single result from a set of input values. 
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

*Aggregate functions* compute a single result from a set of input values. For instance, when we need the sum or average of a particular column, we can use aggregate functions to quickly compute it for us.

## Count

```sql
SELECT COUNT(*) FROM fake_apps;
```

The fastest way to calculate the number of rows in a table is to use the `COUNT()` function.

`COUNT()` is a function that takes the name of a column as an argument and **counts the number of rows** where the column is not NULL. Here, we want to count every row so we pass `*` as an argument.

## Group by

```sql
SELECT price, COUNT(*) FROM fake_apps
GROUP BY price;
```

Aggregate functions are more useful when they organize data into groups.

`GROUP BY` is a clause in SQL that is **only** used with **aggregate functions**. It is used in collaboration with the `SELECT` statement to **arrange identical data into groups**.

Here, our aggregate function is `COUNT()` and we are passing `price` as an argument to `GROUP BY`. SQL will count the total number of apps for each price in the table.

It is usually helpful to `SELECT` the column you pass as an argument to `GROUP BY`. Here we select `price` and `COUNT(*)`. You can see that the result set is organized into two columns making it easy to see the number of apps at each price.

Count the total number of apps at each price that have been downloaded more than 20,000 times:

```sql
SELECT price, COUNT(*) FROM fake_apps
WHERE downloads > 20000
GROUP BY price;
```

## Sum

```sql
SELECT SUM(downloads) FROM fake_apps;
```

SQL makes it easy to add all values in a particular column using `SUM()`.

`SUM()` is a function that takes the name of a column as an argument and returns the sum of all the values in that **column**. Here, it adds all the values in the `downloads` column.

Calculate the total number of downloads for each category: 

```sql
SELECT category, SUM(downloads) FROM fake_apps
GROUP BY category;
```
## Max

```sql
SELECT MAX(downloads) FROM fake_apps;
```

You can find the largest value in a column by using `MAX()`.

`MAX()` is a function that takes the name of a column as an argument and returns the largest value in that column. Here, we pass downloads as an argument so it will return the largest value in the `downloads` column.

Return the names of the most downloaded apps in each category:

```sql
SELECT name, category, MAX(downloads) FROM fake_apps
GROUP BY category;
```

## Min

```sql
SELECT MIN(downloads) FROM fake_apps;
```

Similar to `MAX()`, SQL also makes it easy to return the smallest value in a column by using the `MIN()` function.

`MIN()` is a function that takes the name of a column as an argument and returns the smallest value in that column. Here, we pass `downloads` as an argument so it will return the smallest value in the `downloads` column.

Return the names of the apps that have been downloaded the least number of times in each category:

```sql
SELECT name, category, MIN(downloads) FROM fake_apps
GROUP BY category;
```

## Avg

```sql
SELECT AVG(downloads) FROM fake_apps;
```

This statement returns the average number of downloads for an app in our database. SQL uses the `AVG()` function to quickly calculate the average value of a particular column.

The `AVG()` function works by taking a column name as an argument and returns the average value for that column.

Calculate the average number of downloads at each price:

```sql
SELECT price, AVG(downloads) FROM fake_apps
GROUP BY price;
```

## Round

```sql
SELECT price, ROUND(AVG(downloads), 2) FROM fake_apps
GROUP BY price;
```

By default, SQL tries to be as precise as possible without rounding. We can make the result set easier to read using the `ROUND()` function.

`ROUND()` is a function that takes a column name and an integer as an argument. It rounds the values in the column to the number of decimal places specified by the integer. Here, we pass the column `AVG(downloads)` and `2` as arguments. SQL first calculates the average for each price and then rounds the result to two decimal places in the result set.

Round the average number of downloads to the nearest integer for each price.:

```sql
SELECT price, ROUND(AVG(downloads)) FROM fake_apps
GROUP BY price;
```

# Summary

* *Aggregate functions* combine multiple rows together to form a single value of more meaningful information.

* `COUNT` takes the name of a column(s) as an argument and counts the number of rows where the value(s) is not `NULL`.
* `GROUP BY` is a clause used with aggregate functions to combine data from one or more columns.
* `SUM()` takes the column name as an argument and returns the sum of all the values in that column.
* `MAX()` takes the column name as an argument and returns the largest value in that column.
* `MIN()` takes the column name as an argument and returns the smallest value in that column.
* `AVG()` takes a column name as an argument and returns the average value for that column.
* `ROUND()` takes two arguments, a column name and the number of decimal places to round the values in that column.

{% include series.html %}
