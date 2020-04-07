# Introduction to MySQL

## Setting up GoormIDE
* Signup and create `new container`
* Select `python` stack and install `MySQL` dependencies
* Run the container and enter `mysql-ctl cli` to run MySQL CLI

## Interacting with MySQL
* To display database enter -

    ```sql
    show databases;
    ```
* To use particular database -
    ```sql
    use database_name;
    ```
* To create tables -
    ```sql
    CREATE table person(
    PersonID int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    age int
    );
    ```
    ```sql
    CREATE table orders(
    OrderID int auto_increment primary key,
    item varchar(255),
    Person_ID int,
    foreign key(Person_ID) references person(PersonID));
    ```
* To display tables in database -
    ```sql
    show tables;
    +------------------+
    | Tables_in_test_1 |
    +------------------+
    | orders           |
    | person           |
    +------------------+
    ```
* To get `desc`ription of tables - 
    ```sql
    desc orders;
    +----------+--------------+------+-----+---------+----------------+
    | Field    | Type         | Null | Key | Default | Extra          |
    +----------+--------------+------+-----+---------+----------------+
    | OrderID  | int(11)      | NO   | PRI | NULL    | auto_increment |
    | Item     | varchar(255) | YES  |     | NULL    |                |
    | PersonID | int(11)      | YES  | MUL | NULL    |                |
    +----------+--------------+------+-----+---------+----------------+
    ```

    ```sql
    desc orders;
    +----------+--------------+------+-----+---------+----------------+
    | Field    | Type         | Null | Key | Default | Extra          |
    +----------+--------------+------+-----+---------+----------------+
    | OrderID  | int(11)      | NO   | PRI | NULL    | auto_increment |
    | Item     | varchar(255) | YES  |     | NULL    |                |
    | PersonID | int(11)      | YES  | MUL | NULL    |                |
    +----------+--------------+------+-----+---------+----------------+
    ```

* To insert values into table -
    ```sql
    insert into person(LastName, FirstName, Age) VALUES ('Hudson', 'Stanley', 45), ('Scott', 'Michael'
    , 41), ('Schrute', 'Dwight', 39);
    ```

    ```sql
    insert into orders(Item, PersonID) VALUES ('Beets', 3), ('Pretzel', 1), ('Magic Kit', 2);
    ```

* To add DEFAULT to columns -
    * Adding DEFAULT to Item -
        ```sql
        ALTER TABLE orders ALTER Item SET DEFAULT 'chicken';
        ```


