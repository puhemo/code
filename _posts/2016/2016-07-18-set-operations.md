---
title: "SQL Part 07: Set operations"
date: 2016-07-18 10:20
modified: 2016-07-18
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  **Set operations** allow the results of multiple queries to be combined into a single result set.[[1\]](https://en.wikipedia.org/wiki/Set_operations_%28SQL%29#cite_note-1) Set operators include `UNION`, `INTERSECT`, and `EXCEPT`. 
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

**Set operations** allow the results of multiple queries to be combined into a single result set.[[1\]](https://en.wikipedia.org/wiki/Set_operations_%28SQL%29#cite_note-1) Set operators include `UNION`, `INTERSECT`, and `EXCEPT`.


## Unions

Sometimes, in order to answer certain questions based on data, we need to merge two tables together and then query the merged result. 

There are two ways of doing this:

1. Merge the rows, called a **join**. 
2. Merge the columns, called a **union**.

The SQL **UNION** clause/operator is used to combine the results of two or more SELECT statements without returning any duplicate rows.

### Syntax:

```sql
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```

Each `SELECT` statement within the `UNION` must have the same number of columns with similar data types. The columns in each `SELECT` statement must be in the same order. By default, the `UNION` operator selects only distinct values.

### Example:

Consider the following two tables, (a) `CUSTOMERS` table is as follows:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
|  6 | Komal    |  22 | MP        |  4500.00 |
|  7 | Muffy    |  24 | Indore    | 10000.00 |
+----+----------+-----+-----------+----------+
```

(b) Another table is `ORDERS` as follows:

```
+-----+---------------------+-------------+--------+
|OID  | DATE                | CUSTOMER_ID | AMOUNT |
+-----+---------------------+-------------+--------+
| 102 | 2009-10-08 00:00:00 |           3 |   3000 |
| 100 | 2009-10-08 00:00:00 |           3 |   1500 |
| 101 | 2009-11-20 00:00:00 |           2 |   1560 |
| 103 | 2008-05-20 00:00:00 |           4 |   2060 |
+-----+---------------------+-------------+--------+
```

Now, let us join these two tables in our SELECT statement as follows:

```sql
SELECT  ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
UNION
SELECT  ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
```

This would produce the following result:

```
+------+----------+--------+---------------------+
| ID   | NAME     | AMOUNT | DATE                |
+------+----------+--------+---------------------+
|    1 | Ramesh   |   NULL | NULL                |
|    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
|    3 | kaushik  |   3000 | 2009-10-08 00:00:00 |
|    3 | kaushik  |   1500 | 2009-10-08 00:00:00 |
|    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
|    5 | Hardik   |   NULL | NULL                |
|    6 | Komal    |   NULL | NULL                |
|    7 | Muffy    |   NULL | NULL                |
+------+----------+--------+---------------------+
```

## The UNION ALL Clause

The `UNION ALL` operator is used to combine the results of two `SELECT` statements including **duplicate** rows.

```sql
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
```
Given these two tables[^1]:

sales2005

| person | amount |
| ------ | ------ |
| Joe    | 1000   |
| Alex   | 2000   |
| Bob    | 5000   |

sales2006

| person | amount |
| ------ | ------ |
| Joe    | 2000   |
| Alex   | 2000   |
| Zach   | 35000  |

```sql
SELECT * FROM sales2005
UNION ALL
SELECT * FROM sales2006;
```

would give these results, again allowing variance for the lack of an `ORDER BY` statement:

| person | amount |
| ------ | ------ |
| Joe    | 1000   |
| Joe    | 2000   |
| Alex   | 2000   |
| Alex   | 2000   |
| Bob    | 5000   |
| Zach   | 35000  |

## INTERSECT 

`INTERSECT` is used to combine two `SELECT` statements, but returns rows only from the first `SELECT` statement that are identical to a row in the second `SELECT` statement. This means that it returns only **common rows** returned by the two `SELECT` statements.

```sql
SELECT column_name(s) FROM table1

INTERSECT

SELECT column_name(s) FROM table2;
```

## EXCEPT

`EXCEPT` is constructed in the same way, but returns distinct rows from the first `SELECT` statement that aren’t output by the second `SELECT` statement.This means `EXCEPT ` returns only rows, which are not available in second `SELECT` statement.

```sql
SELECT column_name(s) FROM table1

EXCEPT

SELECT column_name(s) FROM table2;
```

## Summary

- The `UNION` clause allows us to utilize information from multiple tables in our queries.
- The `UNION ALL` clause allows us to utilize information from multiple tables in our queries, including duplicate values. 
- `INTERSECT` is used to combine two `SELECT` statements, but returns rows only from the first `SELECT` statement that are identical to a row in the second `SELECT` statement. 
- `EXCEPT` returns distinct rows from the first `SELECT` statement that aren’t output by the second `SELECT` statement.

[^1]: [Set operations (SQL)](https://en.wikipedia.org/wiki/Set_operations_(SQL))
