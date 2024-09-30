### ClickHouse Components: Objects

| Object                   | Description                                                                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Table**                | A table is a collection of rows and columns that stores data in a columnar format. Tables are the primary data storage objects in ClickHouse.           |
| **Row**                  | A row (or record) represents a single, structured data item in a table. Each row is made up of fields, which correspond to the columns of the table. |
| **Column**               | A column is a set of data values of a particular type, one for each row of the table. Columns define the structure of the table and are stored separately in ClickHouse for efficient query performance.                    |
| **Sequence**             | ClickHouse does not have a sequence object. Instead, it uses auto-incrementing columns or UUIDs to generate unique identifiers.                         |
| **Schema**               | In ClickHouse, the term schema refers to the structure of a table, defined by its columns and their data types. |
| **Index**                | An index in ClickHouse improves the speed of data retrieval operations. ClickHouse uses primary keys and other types of indexes like skip indexes and data skipping indices to optimize query performance.  |
| **View**                 | A view is a virtual table based on the result set of an SQL query. ClickHouse supports materialized views for storing the result of a query. |
| **Trigger**              | ClickHouse does not support triggers in the traditional sense. Instead, it uses materialized views to achieve similar functionality. |
| **Function**             | A function is a built-in or user-defined operation that performs specific calculations or data manipulation tasks. ClickHouse supports a wide range of functions, including aggregate, window, and table functions.       |
| **Constraint**           | ClickHouse does not enforce constraints like primary keys or foreign keys. Instead, it relies on the application logic to maintain data integrity. |
| **Primary Key**          | A primary key in ClickHouse is used to sort the data and optimize query performance. It is not used for enforcing uniqueness. |
| **Foreign Key**          | ClickHouse does not support foreign keys. |
| **Unique Key**           | ClickHouse does not support unique constraints. |
| **Check Constraint**     | ClickHouse does not support check constraints. |
| **Aggregate Function**   | Aggregate functions perform a calculation on a set of values and return a single value. Common aggregate functions in ClickHouse include `sum`, `avg`, `count`, `min`, and `max`. |
| **Data Type**            | Data types define the kind of data that can be stored in a column. Examples include `Int32`, `String`, `DateTime`, `Float64`, etc. |
| **Tablespace**           | ClickHouse does not use tablespaces. Data is stored in specified paths configured at the server level. |
| **User**                 | A user in ClickHouse is an account that can connect to the database and perform operations based on the granted permissions. Users are managed through access control settings. |
| **Database**             | A database is a collection of tables and other objects. ClickHouse can manage multiple databases on a single instance. |
| **Dictionary**           | Dictionaries in ClickHouse are used for external data sources integration and key-value storage optimization. |
| **MergeTree**            | MergeTree is an engine family for tables in ClickHouse that supports primary keys, partitions, and indexing for efficient data retrieval. |
| **Materialized View**    | A materialized view in ClickHouse stores the result of a query physically and updates it automatically as new data arrives. |
