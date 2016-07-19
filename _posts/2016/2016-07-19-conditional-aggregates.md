---
title: "SQL Part 08: Conditional Aggregates"
date: 2016-07-19 08:20
modified: 2016-07-19
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  Conditional Aggregates are aggregate functions that compute a result set based on a given set of conditions.
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

**Aggregate functions** compute a single result from a set of multiple input values. You can think of aggregate data as data collected from multiple rows at a time. 

**Conditional Aggregates** are aggregate functions that compute a result set based on a given set of conditions.

## NULL

The SQL **NULL** is the term used to represent a missing value. A NULL value in a table is a value in a field that appears to be blank.

A field with a NULL value is a field with no value. It is very important to understand that a NULL value is different than a zero value or a field that contains spaces.

The `NULL` value can cause problems when selecting data, however, because when comparing an unknown value to any other value, the result is always unknown and not included in the final results.

You must use the **IS NULL** or **IS NOT NULL** operators (`= NULL` does not work) in order to check for a `NULL` value.

Consider the following table, `CUSTOMERS`[^1] having the following records:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
|  6 | Komal    |  22 | MP        |          |
|  7 | Muffy    |  24 | Indore    |          |
+----+----------+-----+-----------+----------+
```

Now, following is the usage of **IS NOT NULL** operator:

```sql
SELECT  ID, NAME, AGE, ADDRESS, SALARY
FROM CUSTOMERS
WHERE SALARY IS NOT NULL;
```

This would produce the following result:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
+----+----------+-----+-----------+----------+
```

Now, following is the usage of **IS NULL** operator:

```sql
SELECT  ID, NAME, AGE, ADDRESS, SALARY
FROM CUSTOMERS
WHERE SALARY IS NULL;
```

This would produce the following result:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  6 | Komal    |  22 | MP        |          |
|  7 | Muffy    |  24 | Indore    |          |
+----+----------+-----+-----------+----------+
```

## CASE WHEN

SQL has the `case/when/then/else/end` expression. In its most general form, which is called a "searched case" in the SQL standard, it works like [else if](https://en.wikipedia.org/wiki/Conditional_%28programming%29#Else_if) in other programming languages:

```sql
CASE WHEN n > 0
          THEN 'positive'
     WHEN n < 0
          THEN 'negative'
     ELSE 'zero'
END
```

```sql
SELECT
    CASE
        WHEN elevation < 500 THEN 'Low'
        WHEN elevation BETWEEN 500 AND 1999 THEN 'Medium'
        WHEN elevation >= 2000 THEN 'High'
        ELSE 'Unknown'
    END AS elevation_tier
    , COUNT(*)
FROM airports
GROUP BY 1;
```

In the above statement, `END` is required to terminate the statement, but `ELSE` is optional. If `ELSE` is not included, the result will be `NULL`. Also notice the shorthand method of referencing columns to use in `GROUP BY`, so we don't have to rewrite the entire `Case Statement`.

## COUNT(CASE WHEN)

Sometimes you want to look at an entire result set, but want to implement conditions on certain aggregates. 

```sql
SELECT    state, 
    COUNT(CASE WHEN elevation >= 2000 THEN 1 ELSE NULL END) as count_high_elevation_aiports 
FROM airports 
GROUP BY state;
```

## SUM(CASE WHEN)

We can do that same thing for other aggregates like `SUM()`. 

For instance, if we wanted to sum the total flight distance and compare that to the sum of flight distance from a particular airline (in this 
case, United Airlines) by origin airport, we could run the following 
query: 

```sql
SELECT origin, sum(distance) as total_flight_distance, sum(CASE WHEN carrier = 'UA' THEN distance ELSE 0 END) as total_united_flight_distance 
FROM flights 
GROUP BY origin;
```

## Combining aggregates

Oftentimes we'd like to combine aggregates, to create percentages or ratios. 

In the instance of the last query, we might want to find out the percent of flight distance that is from United by origin airport. We can do this simply by using the mathematical operators we need in SQL: 

```sql
SELECT     origin, 
    100.0*(sum(CASE WHEN carrier = 'UN' THEN distance ELSE 0 END)/sum(distance)) as percentage_flight_distance_from_united FROM flights 
GROUP BY origin;
```

## Summary

- **Conditional Aggregates** are aggregate functions the compute a result set based on a given set of conditions. 
- `NULL` can be used to denote an empty field value
- `CASE` statements allow for custom classification of data
- `CASE` statements can be used inside aggregates (like `SUM()` and `COUNT()`) to provide filtered measures


[^1]: [SQL - NULL Values](http://www.tutorialspoint.com/sql/sql-null-values.htm)


