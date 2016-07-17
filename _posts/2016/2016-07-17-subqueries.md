---
title: "SQL Part 06: Subqueries"
date: 2016-07-17 10:20
modified: 2016-07-17
categories:
  - SQL
tags:
  - SQL
  - Database
published: true
excerpt: |
  Use subqueries to transform table data by nesting one query within another query. 
series: "Intro to SQL"	
---
{% include series.html %}

* TOC
{:toc}

A **Subquery** or **Inner query** or **Nested query** is a query within another SQL query and embedded within the `WHERE` clause.

A **subquery** is used to return data that will be used in the main query as a condition to further restrict the data to be retrieved.

**Subqueries** can be used with the `SELECT`, `INSERT`, `UPDATE`, and `DELETE` statements along with the operators like `=`, `<`, `>`, `>=`, `<=`, `IN`, `BETWEEN` etc.

There are a few rules that subqueries must follow:

- Subqueries must be enclosed within parentheses.
- A subquery can have only one column in the `SELECT` clause, unless multiple columns are in the main query for the subquery to compare its selected columns.
- An `ORDER BY` **cannot be used in a subquery**, although the main query can use an ORDER BY. The `GROUP BY` can be used to perform the same function as the `ORDER BY` in a subquery.
- Subqueries that return more than one row can only be used with multiple value operators, such as the `IN` operator.
- The `SELECT` list cannot include any references to values that evaluate to a BLOB, ARRAY, CLOB, or NCLOB.
- A subquery cannot be immediately enclosed in a set function.
- The `BETWEEN` operator **cannot be used with a subquery**; however, the `BETWEEN` operator can be used within the subquery.

## Non-Correlated Subquery

A **non-correlated subquery** is a subquery that can be run independently of the outer query and as we saw, can be used to complete a multi-step transformation. 

```sql
SELECT * 
FROM flights 
WHERE origin in (
    SELECT code 
    FROM airports 
    WHERE fac_type = 'SEAPLANE_BASE');
```

## Correlated Subquery

In a **correlated subquery**, the subquery can not be run independently of the outer query. The order of operations is important in a correlated subquery:

1. A row is processed in the outer query. 
2. Then, for that particular row in the outer query, the subquery is executed.

This means that for each row processed by the outer query, the subquery will also be processed for that row. 

Here is an example for a typical correlated subquery. In this example[^1], the object is to find all employees whose salary is above average for their department.

```sql
 SELECT employee_number, name
   FROM employees AS Bob
   WHERE salary > (
     SELECT AVG(salary)
       FROM employees
       WHERE department = Bob.department);
```

In the above query the outer query is

```sql
 SELECT employee_number, name
   FROM employees AS Bob
   WHERE salary > ...
```

and the inner query (the correlated subquery) is

```sql
 SELECT AVG(salary)
   FROM employees
   WHERE department = Bob.department
```

In the above nested query the inner query has to be re-executed for each employee.


## Subqueries with the SELECT Statement:

Subqueries are most frequently used with the SELECT statement. The basic syntax is as follows:

```sql
SELECT column_name [, column_name ]
FROM   table1 [, table2 ]
WHERE  column_name OPERATOR
      (SELECT column_name [, column_name ]
      FROM table1 [, table2 ]
      [WHERE])
```

## Example:

Consider the `CUSTOMERS` table having the following records:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  35 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
|  6 | Komal    |  22 | MP        |  4500.00 |
|  7 | Muffy    |  24 | Indore    | 10000.00 |
+----+----------+-----+-----------+----------+
```

Now, let us check following subquery with `SELECT` statement:

```sql
SELECT * 
FROM CUSTOMERS 
WHERE ID IN (SELECT ID 
             FROM CUSTOMERS 
             WHERE SALARY > 4500) ;
```

This would produce the following result:

```
+----+----------+-----+---------+----------+
| ID | NAME     | AGE | ADDRESS | SALARY   |
+----+----------+-----+---------+----------+
|  4 | Chaitali |  25 | Mumbai  |  6500.00 |
|  5 | Hardik   |  27 | Bhopal  |  8500.00 |
|  7 | Muffy    |  24 | Indore  | 10000.00 |
+----+----------+-----+---------+----------+
```

## Subqueries with the INSERT Statement:

Subqueries also can be used  with INSERT statements. The INSERT statement uses the data returned from the subquery to insert into another table. The selected data in the subquery can be modified with any of the character, date or number functions.

The basic syntax is as follows:

```sql
INSERT INTO table_name [ (column1 [, column2 ]) ]
           SELECT [ *|column1 [, column2 ]
           FROM table1 [, table2 ]
           [ WHERE VALUE OPERATOR ]
```

## Example:

Consider a table CUSTOMERS_BKP with similar structure as  CUSTOMERS table. Now to copy complete CUSTOMERS table into CUSTOMERS_BKP, following is the syntax:

```sql
SQL> INSERT INTO CUSTOMERS_BKP
     SELECT * FROM CUSTOMERS 
     WHERE ID IN (SELECT ID 
                  FROM CUSTOMERS) ;
```

## Subqueries with the UPDATE Statement:

The subquery can be used in conjunction with the UPDATE statement. Either single or multiple columns in a table can be updated when using a subquery with the UPDATE statement.

The basic syntax is as follows:

```sql
UPDATE table
SET column_name = new_value
[ WHERE OPERATOR [ VALUE ]
   (SELECT COLUMN_NAME
   FROM TABLE_NAME)
   [ WHERE) ]
```

## Example:

Assuming, we have CUSTOMERS_BKP table available which is backup of CUSTOMERS table.

Following example updates SALARY by 0.25 times in CUSTOMERS table for all the customers whose AGE is greater than or equal to 27:

```sql
SQL> UPDATE CUSTOMERS
     SET SALARY = SALARY * 0.25
     WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP
                   WHERE AGE >= 27 );
```

This would impact two rows and finally CUSTOMERS table would have the following records:

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  35 | Ahmedabad |   125.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  2125.00 |
|  6 | Komal    |  22 | MP        |  4500.00 |
|  7 | Muffy    |  24 | Indore    | 10000.00 |
+----+----------+-----+-----------+----------+
```

## Subqueries with the DELETE Statement:

The subquery can be used in conjunction with the DELETE statement like with any other statements mentioned above.

The basic syntax is as follows:

```sql
DELETE FROM TABLE_NAME
[ WHERE OPERATOR [ VALUE ]
   (SELECT COLUMN_NAME
   FROM TABLE_NAME)
   [ WHERE) ]
```

## Example:

Assuming, we have CUSTOMERS_BKP table available which is backup of CUSTOMERS table.

Following example deletes records from CUSTOMERS table for all the customers whose AGE is greater than or equal to 27:

```sql
SQL> DELETE FROM CUSTOMERS
     WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP
                   WHERE AGE > 27 );
```

This would impact two rows and finally CUSTOMERS table would have the following records:

```
+----+----------+-----+---------+----------+
| ID | NAME     | AGE | ADDRESS | SALARY   |
+----+----------+-----+---------+----------+
|  2 | Khilan   |  25 | Delhi   |  1500.00 |
|  3 | kaushik  |  23 | Kota    |  2000.00 |
|  4 | Chaitali |  25 | Mumbai  |  6500.00 |
|  6 | Komal    |  22 | MP      |  4500.00 |
|  7 | Muffy    |  24 | Indore  | 10000.00 |
+----+----------+-----+---------+----------+
```



## References

[SQL - Sub Queries](http://www.tutorialspoint.com/sql/sql-sub-queries.htm)

[Subqueries](https://www.codecademy.com/en/courses/sql-table-transformation/lessons/subqueries/exercises/table-transformation)

[^1]: [Correlated subquery](https://en.wikipedia.org/wiki/Correlated_subquery)

