### Understanding NoSQL vs SQL Databases

**Overview:**
NoSQL and SQL databases serve different purposes and have distinct characteristics. Understanding their differences helps in selecting the right type of database for specific applications, ensuring optimal performance, scalability, and flexibility.

**Key Points:**

- **Data Model**:
  - **SQL**: Uses a fixed schema and relational data model, which is ideal for structured data. The data is organized into tables with rows and columns, and relationships between data are defined using foreign keys. This rigid structure ensures data integrity and supports complex queries and transactions.
    - **Practical Task**:
      - **Objective**: Create a simple relational database using SQLite.
      - **Steps**:
        1. Install SQLite: `sudo apt-get install sqlite3` (Linux) or `brew install sqlite3` (macOS).
        2. Open SQLite: `sqlite3 test.db`.
        3. Create a table: `CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER);`.
        4. Insert data: `INSERT INTO users (name, age) VALUES ('Alice', 30), ('Bob', 25);`.
        5. Query data: `SELECT * FROM users;`.
      - **Definition of Done**: Successfully create a table, insert data, and query the data.

  - **NoSQL**: Offers a flexible schema and can be categorized into four types: document, key-value, wide-column, and graph databases. This flexibility allows for the storage of unstructured and semi-structured data, making NoSQL ideal for applications with evolving data requirements.
    - **Practical Task**:
      - **Objective**: Create a simple document database using MongoDB.
      - **Steps**:
        1. Install MongoDB: Follow [MongoDB installation instructions](https://docs.mongodb.com/manual/installation/).
        2. Start MongoDB: `sudo service mongod start`.
        3. Open Mongo Shell: `mongo`.
        4. Create a database: `use mydatabase`.
        5. Insert a document: `db.users.insert({name: 'Alice', age: 30});`.
        6. Query data: `db.users.find();`.
      - **Definition of Done**: Successfully create a database, insert a document, and query the data.

- **Scalability**:
  - **SQL**: Typically vertically scalable, meaning performance is improved by adding more resources (CPU, RAM) to a single server. While it can be scaled horizontally using techniques like sharding, it is generally more complex to achieve.
    - **Practical Task**:
      - **Objective**: Understand vertical scaling by upgrading the resources of a SQL server.
      - **Steps**:
        1. Set up a PostgreSQL instance on a small cloud server (e.g., AWS EC2 t2.micro).
        2. Perform a benchmark test using a tool like `pgbench`.
        3. Upgrade the server to a larger instance (e.g., AWS EC2 t2.large).
        4. Perform the benchmark test again and compare the results.
      - **Definition of Done**: Observe the performance improvement after upgrading the server resources.

  - **NoSQL**: Horizontally scalable, designed to scale out by adding more servers. This approach distributes the load across multiple servers, making it easier to handle large volumes of data and high traffic.
    - **Practical Task**:
      - **Objective**: Set up a horizontally scalable NoSQL database using MongoDB sharding.
      - **Steps**:
        1. Install MongoDB and configure three instances: one config server, one shard server, and one query router.
        2. Start the config server: `mongod --configsvr --dbpath /data/config --port 27019`.
        3. Start the shard server: `mongod --shardsvr --dbpath /data/shard1 --port 27018`.
        4. Start the query router: `mongos --configdb configServerHost:27019 --port 27017`.
        5. Add the shard to the cluster: `mongo --eval "sh.addShard('shardServerHost:27018')"`.
      - **Definition of Done**: Successfully configure and add a shard to the MongoDB cluster.

- **Query Language**:
  - **SQL**: Uses Structured Query Language (SQL) for defining and manipulating data. SQL is a powerful and standardized language that supports complex queries, joins, transactions, and data integrity constraints.
    - **Practical Task**:
      - **Objective**: Write and execute a complex SQL query.
      - **Steps**:
        1. Set up a PostgreSQL database with multiple tables (e.g., users, orders).
        2. Insert sample data into the tables.
        3. Write a query to join the tables and filter the results:

           ```sql
           SELECT users.name, orders.total 
           FROM users 
           JOIN orders ON users.id = orders.user_id 
           WHERE orders.total > 100;
           ```

        4. Execute the query and view the results.
      - **Definition of Done**: Successfully write and execute a complex SQL query that joins multiple tables.

  - **NoSQL**: Query languages vary by database type. Document databases like MongoDB use JSON-like query syntax, while other types may use specialized query languages or APIs.
    - **Practical Task**:
      - **Objective**: Write and execute a query in MongoDB using the mongo client CLI.
      - **Steps**:
        1. Set up a MongoDB database and collection.
        2. Insert multiple documents into the collection.
        3. Write a query to filter documents based on a specific field:

           ```bash
           mongo --eval 'db.users.find({age: {$gt: 25}}).forEach(printjson)'
           ```

        4. Execute the query and view the results.

### Additional Key Points

- **Consistency**:
  - **SQL**: Provides strong consistency, meaning all clients always have the same view of the data.
  - **NoSQL**: Can provide eventual consistency, where updates to a database will propagate to all nodes eventually, but not immediately.

- **Use Cases**:
  - **SQL**: Best for applications requiring complex queries, transactions, and data integrity (e.g., financial systems, enterprise applications).
  - **NoSQL**: Ideal for applications requiring flexibility, scalability, and fast access to large volumes of unstructured data (e.g., social media, real-time analytics).

- **ACID vs. BASE**:
  - **SQL (ACID)**: Adheres to Atomicity, Consistency, Isolation, Durability principles, ensuring reliable transactions.
  - **NoSQL (BASE)**: Emphasizes Basically Available, Soft state, Eventual consistency, prioritizing availability over consistency.

### Official Documentation and Resources

- [SQL vs NoSQL Databases: What's the Difference?](https://www.mongodb.com/nosql-explained/nosql-vs-sql)
- [Comparing SQL and NoSQL Databases](https://aws.amazon.com/nosql/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Redis Documentation](https://redis.io/documentation)

By understanding the key differences between SQL and NoSQL databases and performing practical tasks, you will gain a deeper appreciation for their unique characteristics and better determine which type of database is suitable for different applications.

[------------------------]

### USING EXAMPLES WITHIN MODERN SYSTEMS

### ACID (SQL) Example

#### ACID Principles

- **Atomicity**: Ensures that all operations within a transaction are completed; if not, the transaction is aborted.
- **Consistency**: Ensures that the database transitions from one valid state to another.
- **Isolation**: Ensures that concurrent transactions do not interfere with each other.
- **Durability**: Ensures that once a transaction is committed, it remains so, even in the event of a system failure.

#### Example: Bank Account Transfer

Imagine a scenario where you need to transfer money from Account A to Account B. This involves two operations: deducting the amount from Account A and adding it to Account B.

**SQL Transaction:**

```sql
BEGIN;

-- Deduct amount from Account A
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 'A';

-- Add amount to Account B
UPDATE accounts
SET balance = balance + 100
WHERE account_id = 'B';

COMMIT;
```

**Explanation**:

1. **Atomicity**: If either update fails, the transaction is aborted, and no changes are made.
2. **Consistency**: The total amount of money in both accounts remains the same.
3. **Isolation**: Other transactions cannot see the intermediate state until the transaction is complete.
4. **Durability**: Once the transaction is committed, the changes are permanent, even if the system crashes immediately after.

**Sources**:

- [PostgreSQL Documentation](https://www.postgresql.org/docs/current/tutorial-transactions.html)
- [Oracle Transactions](https://docs.oracle.com/cd/B28359_01/server.111/b28310/transact.htm)

### BASE (NoSQL) Example

#### BASE Principles

- **Basically Available**: Guarantees the availability of the data, even in the event of failures.
- **Soft state**: The state of the system may change over time, even without input (due to eventual consistency).
- **Eventual consistency**: The system will eventually become consistent once it stops receiving new updates.

#### Example: Shopping Cart System

Consider a shopping cart in an e-commerce application. Items are added to the cart, but the system ensures high availability and responsiveness.

**NoSQL (Cassandra) Implementation:**

```cql
-- Add item to cart
INSERT INTO shopping_cart (user_id, item_id, quantity)
VALUES ('user123', 'item456', 2);
```

**Explanation**:

1. **Basically Available**: The system remains available to accept and process requests even under high load or partial system failures.
2. **Soft state**: The state of the shopping cart may temporarily show inconsistent data (e.g., due to network delays).
3. **Eventual consistency**: All replicas of the shopping cart will eventually converge to show the same data, but not necessarily immediately after the update.

**Sources**:

- [Cassandra Documentation](https://cassandra.apache.org/doc/latest/)
- [Understanding BASE Properties](https://queue.acm.org/detail.cfm?id=1394128)


[------------------------]

### Project tasks

### Comprehensive PostgreSQL Task

This comprehensive task will guide you through setting up a PostgreSQL database from scratch, creating schemas, inserting specific types of data, and performing various SQL operations. The goal is to provide hands-on experience with PostgreSQL and enhance your understanding of SQL.

#### Task Overview

1. **Preparation**: Set up PostgreSQL database and environment.
2. **Schema Design**: Create and design schemas and tables.
3. **Data Insertion**: Insert different types of data into the tables.
4. **SQL Operations**: Perform complex queries and operations.

### Step 1: Setting Up PostgreSQL

**Objective**: Install PostgreSQL and set up the database environment.

**Steps**:

1. **Install PostgreSQL**:
   - On Ubuntu:

     ```bash
     sudo apt update
     sudo apt install postgresql postgresql-contrib
     ```

   - On macOS:

     ```bash
     brew install postgresql
     brew services start postgresql
     ```

   - On Windows: Download and install PostgreSQL from the [official website](https://www.postgresql.org/download/).

2. **Start PostgreSQL Service**:
   - On Linux:

     ```bash
     sudo service postgresql start
     ```

   - On macOS:

     ```bash
     brew services start postgresql
     ```

3. **Access PostgreSQL CLI**:

   ```bash
   sudo -i -u postgres
   psql
   ```

4. **Create a New Database**:

   ```sql
   CREATE DATABASE company_db;
   \c company_db
   ```

### Step 2: Designing Schemas and Tables

**Objective**: Create and design schemas and tables to represent a company database.

**Steps**:

1. **Create Schema**:

   ```sql
   CREATE SCHEMA company;
   ```

2. **Create Tables**:
   - **Employees Table**:

     ```sql
     CREATE TABLE company.employees (
       employee_id SERIAL PRIMARY KEY,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       email VARCHAR(100) UNIQUE NOT NULL,
       phone VARCHAR(15),
       hire_date DATE NOT NULL,
       job_id INTEGER NOT NULL,
       salary NUMERIC(10, 2) NOT NULL,
       department_id INTEGER,
       CONSTRAINT fk_department
         FOREIGN KEY(department_id) 
    REFERENCES company.departments(department_id)
     );
     ```

   - **Departments Table**:

     ```sql
     CREATE TABLE company.departments (
       department_id SERIAL PRIMARY KEY,
       department_name VARCHAR(50) NOT NULL
     );
     ```

   - **Jobs Table**:

     ```sql
     CREATE TABLE company.jobs (
       job_id SERIAL PRIMARY KEY,
       job_title VARCHAR(50) NOT NULL
     );
     ```

3. **Create Sequences for IDs** (if needed):

   ```sql
   CREATE SEQUENCE company.employee_id_seq;
   ```

### Step 3: Inserting Data

**Objective**: Insert different types of data into the tables.

**Steps**:

1. **Insert Data into Departments**:

   ```sql
   INSERT INTO company.departments (department_name) VALUES
   ('Human Resources'),
   ('IT'),
   ('Finance'),
   ('Marketing');
   ```

2. **Insert Data into Jobs**:

   ```sql
   INSERT INTO company.jobs (job_title) VALUES
   ('HR Manager'),
   ('Software Developer'),
   ('Financial Analyst'),
   ('Marketing Specialist');
   ```

3. **Insert Data into Employees**:

   ```sql
   INSERT INTO company.employees (first_name, last_name, email, phone, hire_date, job_id, salary, department_id) VALUES
   ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2022-01-15', 2, 80000.00, 2),
   ('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '2022-03-22', 3, 75000.00, 3),
   ('Emma', 'Jones', 'emma.jones@example.com', '345-678-9012', '2022-05-05', 4, 70000.00, 4),
   ('Robert', 'Brown', 'robert.brown@example.com', '456-789-0123', '2022-07-19', 1, 90000.00, 1);
   ```

### Step 4: Performing SQL Operations

**Objective**: Perform complex queries and operations to understand the data better.

**Steps**:

1. **Query to Retrieve All Employees**:

   ```sql
   SELECT * FROM company.employees;
   ```

2. **Query to Join Employees with Departments and Jobs**:

   ```sql
   SELECT e.first_name, e.last_name, e.email, d.department_name, j.job_title, e.salary
   FROM company.employees e
   JOIN company.departments d ON e.department_id = d.department_id
   JOIN company.jobs j ON e.job_id = j.job_id;
   ```

3. **Query to Find Employees in a Specific Department**:

   ```sql
   SELECT first_name, last_name, email
   FROM company.employees
   WHERE department_id = 2;
   ```

4. **Update Employee Salary**:

   ```sql
   UPDATE company.employees
   SET salary = salary * 1.10
   WHERE job_id = 2;
   ```

5. **Delete an Employee**:

   ```sql
   DELETE FROM company.employees
   WHERE email = 'emma.jones@example.com';
   ```

6. **Aggregate Query to Find Average Salary by Department**:

   ```sql
   SELECT d.department_name, AVG(e.salary) AS average_salary
   FROM company.employees e
   JOIN company.departments d ON e.department_id = d.department_id
   GROUP BY d.department_name;
   ```

### Additional Learning Points

- **Transactions**: Use transactions to ensure data integrity.

  ```sql
  BEGIN;
  INSERT INTO company.employees (first_name, last_name, email, phone, hire_date, job_id, salary, department_id) VALUES
  ('Alice', 'White', 'alice.white@example.com', '567-890-1234', '2022-09-01', 3, 85000.00, 3);
  COMMIT;
  ```

- **Indexes**: Create indexes to improve query performance.

  ```sql
  CREATE INDEX idx_employee_last_name ON company.employees(last_name);
  ```

- **Views**: Create views for simplified access to complex queries.

  ```sql
  CREATE VIEW company.employee_details AS
  SELECT e.first_name, e.last_name, e.email, d.department_name, j.job_title, e.salary
  FROM company.employees e
  JOIN company.departments d ON e.department_id = d.department_id
  JOIN company.jobs j ON e.job_id = j.job_id;
  ```

### Definition of Done

- Successfully set up the PostgreSQL database.
- Create the necessary schemas and tables.
- Insert sample data into the tables.
- Perform various SQL operations to query and manipulate the data.
- Demonstrate understanding of transactions, indexes, and views.

### Follow-up Tasks for the PostgreSQL Database


#### Task 1: Create and Use a Stored Procedure

**Objective**: Create a stored procedure that increases the salary of all employees in a specific department by a given percentage.

**Requirements**:

1. **Create the Procedure**:
   - The procedure should take two parameters: the department ID and the percentage increase.
2. **Execute the Procedure**:
   - Call the procedure with different department IDs and percentage increases.
3. **Verify the Results**:
   - Query the `employees` table to ensure the salaries have been updated correctly.

#### Task 2: Implement and Test a Trigger

**Objective**: Create a trigger that automatically logs changes to employee salaries into a separate audit table.

**Requirements**:

1. **Create the Audit Table**:
   - Design a table to store the employee ID, the old salary, the new salary, and the timestamp of the change.
2. **Create the Trigger**:
   - The trigger should fire before an update on the `employees` table.
   - The trigger should log the old and new salary values into the audit table.
3. **Test the Trigger**:
   - Update the salary of several employees.
   - Verify that the changes have been correctly logged in the audit table.

#### Task 3: Design and Query a Complex View

**Objective**: Create a view that provides a summary of employees, including their department and job title, and then write a query to extract specific information from this view.

**Requirements**:

1. **Create the View**:
   - The view should join the `employees`, `departments`, and `jobs` tables.
   - It should include columns for the employee's name, email, department name, job title, and salary.
2. **Write a Query**:
   - Write a query to find all employees in a specific department with a salary greater than a specified amount.
3. **Execute the Query**:
   - Run the query with different department names and salary thresholds to verify its accuracy.

