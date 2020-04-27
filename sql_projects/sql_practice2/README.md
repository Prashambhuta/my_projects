# mySQl 5.6.9 practice 2

## Interacting with mySQL

* To start: `mysql-ctl cli`

* To create database `cafe`:
    ```sql
    CREATE TABLE cafe (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    item VARCHAR(255),
    price FLOAT);
    ```
* To change column names:
    ```sql
    alter table cafe change name name varchar(255) NOT NULL;
    ```
* To insert data into columns:
    ```sql
    INSERT INTO cafe (column_name, column_name, ...) VALUES (`string_value`, integer/float, ...),
    (`string_value`, int/float, ...);
    ```
## SQL `WHERE`
* It is used to filter out records. Syntax:
    ```sql
    SELECT * FROM <table> WHERE <column> <condition>;
    ```
    Example:
    ```sql
    SELECT * FROM cafe WHERE price > 4.5;
    ```
    ```sql
    +----+---------+---------------+-------+
    | id | name    | item          | price |
    +----+---------+---------------+-------+
    |  2 | Paul    | Flat White    |   5.6 |
    |  4 | Willaim | Lemon bitters |   5.2 |
    +----+---------+---------------+-------+
    ```

## SQL `NOT`
* NOT operator displays a record if the condition is NOT TRUE.
    Example:
    ```sql
    SELECT * FROM cafe WHERE NOT price >4.5;
    ```

## SQL COMBINING WITH `AND` & `OR`
* `AND` & `OR` are used to combine conditions. Example
    ```sql
    SELECT * FROM cafe WHERE price > 4.5 AND NOT item = 'Flat White';
    
    +----+---------+---------------+-------+
    | id | name    | item          | price |
    +----+---------+---------------+-------+
    |  4 | Willaim | Lemon bitters |   5.2 |
    +----+---------+---------------+-------+
    ```

## SQL `ORDER BY`
* To sort the results in order. Syntax:
    ```sql
    SELECT * from <table> ORDER BY <column>, <column> ...
    ```
    Example:
    ```sql
    SELECT item, price from cafe ORDER BY price DESC;
    ```
    ```sql
    +---------------+-------+
    | item          | price |
    +---------------+-------+
    | Flat White    |   5.6 |
    | Lemon bitters |   5.2 |
    | Cold brew     |   4.5 |
    | Latte         |   4.5 |
    | Cold brew     |   4.5 |
    | Latte         |   4.5 |
    | Cappuccino    |   4.5 |
    | Latte         |   4.5 |
    | Vanilla Coke  |   4.3 |
    +---------------+-------+
    ```

## SQL `IN`
* `IN` operator allows to specify multiple WHERE clause. It is used to provide list of values for matching. Syntax:
    ```sql
    SELECT * FROM <table> WHERE <column> in (<list of values>);
    ```
    Example:
    ```sql
    SELECT name, item from cafe WHERE item in ('Cold brew', 'Vanilla Coke') ORDER BY price DESC;
    ```

## SQL `GROUP BY`
* Group by groups rows that have same values for compact analysis.
* Often used with functions such as (`COUNT`, `MAX`, `MIN`, `SUM`, `AVG`). Syntax:
    ```sql
    SELECT * FROM <table> WHERE <condition> GROUP BY <column> ORDER BY <column>;
    ```
    Example:
    ```sql
    SELECT COUNT(*), item FROM cafe GROUP BY item ORDER BY item;
    ```

## SQL `LIKE`
* Used to do partial matching, important regex symbols are:
    * `%` - means zero, one or multiple characters.
    * `_` - means a single character.
    
    Example:
    ```sql
    SELECT * FROM cafe where item LIKE 'L%';
    ```
    ```sql
    +----+---------+---------------+-------+
    | id | name    | item          | price |
    +----+---------+---------------+-------+
    |  4 | Willaim | Lemon bitters |   5.2 |
    |  5 | Alex    | Latte         |   4.5 |
    |  7 | Samuel  | Latte         |   4.5 |
    |  9 | Kim     | Latte         |   4.5 |
    +----+---------+---------------+-------+
    ```
    **Returns item which starts with `L`**
    
* Example: Select all customer names with item name of “tt” in any position:
    ```sql
    SELECT name, item from cafe where item LIKE '%tt%';
    ```
    ```sql
    +---------+---------------+
    | name    | item          |
    +---------+---------------+
    | Willaim | Lemon bitters |
    | Alex    | Latte         |
    | Samuel  | Latte         |
    | Kim     | Latte         |
    +---------+---------------+
    ```

## SQL `HAVING`
* `HAVING` clause was added to with used with aggregrate functions such as `MIN`, `MAX`, `COUNT` etc. Syntax:
    ```sql
    SELECT <column> FROM <table> WHERE <condition> GROUP BY <column> HAVING <condition>;
    ```
    Example:
    Lists the number of customers in each item. Only include item with less than $5.50.
    ```sql
    SELECT COUNT(*), item FROM cafe GROUP BY item HAVING MAX(price) < 5.5
    ```
    ```sql
    +----------+---------------+
    | COUNT(*) | item          |
    +----------+---------------+
    |        1 | Cappuccino    |
    |        2 | Cold brew     |
    |        3 | Latte         |
    |        1 | Lemon bitters |
    |        1 | Vanilla Coke  |
    +----------+---------------+
    ```

