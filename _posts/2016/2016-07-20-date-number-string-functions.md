---
title: "SQL Part 09: Date, Number, and String Functions"
date: 2016-07-20 08:40
modified: 2016-07-20
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  Oftentimes, data in columns of tables is not in the exact format we need to complete our desired analysis. We may need to extract a date from a full timestamp, manipulate a number, or combine first and last name columns to create a full name. 
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

Oftentimes, data in columns of tables is not in the exact format we need to complete our desired analysis. We may need to extract a date from a full timestamp, manipulate a number, or combine first and last name columns to create a full name. 

## Dates

Dates are often written in the following format:

1. Date: YYYY-MM-DD
2. Datetime or Timestamp: YYYY-MM-DD hh:mm:ss

We can use SQL's date functions to transform data into a desired format. Since date functions can be database specific, verify the functions that exist on your relational database management system.

For example, this statement

```sql
SELECT DATETIME(manufacture_time)
FROM baked_goods;
```

Would return the date and time for the `manufacture_time` column.

We can use the `DATE()` function to easily convert timestamps to dates and complete the following query:

```sql
SELECT DATE(manufacture_time), count(*) as count_baked_goods
FROM baked_goods
GROUP BY DATE(manufacture_time);
```

Similarly, we can query the time with

```sql
SELECT TIME(manufacture_time), count(*) as count_baked_goods
FROM baked_goods
GROUP BY TIME(manufacture_time);
```

Given a datepart and a column of date or timestamp data type, we can increment date or timestamp values by a specified interval. 

```sql
SELECT DATETIME(manufacture_time, '+2 hours', '30 minutes', '1 day') as inspection_time
FROM baked_goods;
```

## Numbers

Numeric functions can be used to transform numbers. Some common SQLite mathematical functions are included below that take numeric data types as inputs: 

- `SELECT (number1 + number2);`: Returns the sum of two numbers. Similar, SQL can be used for subtraction, multiplication, and division. 
- `SELECT CAST(number1 AS REAL) / number3;`: Returns the result as a real number by casting one of the values as a real number, rather than an integer.
- `SELECT ROUND(number, precision);`: Returns the numeric value rounded off to the next value specified.

```sql
SELECT ROUND(ingredients_cost, 4) as rounded_cost
FROM baked_goods;
```

A couple more useful numeric SQL functions are included below: `MAX` and `MIN`. 

`MAX(n1,n2,n3,...)`: returns the greatest value in the set of the input numeric expressions`MIN(n1,n2,n3,...)`: returns the least value in the set of the input numeric expressions.

```sql
SELECT id, MAX(ingredients_cost, packaging_cost)
FROM baked_goods;
```

## Strings

A common use case for string manipulation in SQL is concatenation of strings. In SQLite, this is written as

```sql
SELECT string1 || ' ' || string2;
```

```
SELECT string1 || ' ' || string2;

```

For example, the bakeries table contains both city and state columns. In order to create a route for these columns, we use the `||` function to concatenate them as in the following query: 

```sql
SELECT city || ' ' || state as location
FROM bakeries;
```

Another useful string function in SQL is `REPLACE()`:

```
REPLACE(string,from_string,to_string)

```

The function returns the string `string` with all occurrences of the string `from_string` replaced by the string `to_string`.

For example in `baked_goods`, there is a column named `ingredients`. The ingredients strings are formatted with underscores, such as `baking_soda` and `vanilla_extract`. To make these values more readable, we might like to replace the underscores with spaces. We can do so by using the following query: 

```sql
SELECT id, REPLACE(ingredients,'_',' ') as item_ingredients
from baked_goods;
```

## Summary

Date Functions:

- `DATETIME`; Returns the date and time of the column specified. This can be modified to return only the date or only the time.
- `DATETIME(time1, +X hours, Y minutes, Z days)`: Increments the specificed column by a given number of hours, minutes, or days.   

Numeric Functions:

- `(number1 + number2);`: Returns the sum of two numbers, or other mathematical operations, accordingly.
- `CAST(number1 AS REAL) / number2;`: Returns the result as a real number by casting one of numeric inputs as a real number
- `ROUND(number, precision);`: Returns the numeric value rounded off to the next value specified.

String Functions:

- `'string1' || ' ' || 'string2';`: Concatenates string1 and string 2, with a space between.
- `REPLACE(string,from_string,to_string)`: Returns the string with all occurrences of the string `from_string` replaced by the string `to_string`.
