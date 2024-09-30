### ClickHouse Commands

| Command                  | Description                                                                                                                                       |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **SELECT**               | Retrieves data from one or more tables.                                                                                                           |
| **INSERT**               | Adds new rows to a table.                                                                                                                         |
| **CREATE TABLE**         | Creates a new table in the database.                                                                                                              |
| **ALTER TABLE**          | Modifies an existing table's structure, such as adding or dropping columns.                                                                                                           |
| **DROP TABLE**           | Deletes a table and all of its data.                                                                                                              |
| **CREATE INDEX**         | ClickHouse does not support traditional indexes. It uses primary keys and data skipping indices for optimization.                                                                                         |
| **DROP INDEX**           | ClickHouse does not support dropping indexes separately. Indexes are defined within the table creation.                                                                                                                    |
| **CREATE VIEW**          | Creates a virtual table based on the result set of an SQL query.                                                                                  |
| **DROP VIEW**            | Deletes a view from the database.                                                                                                                 |
| **CREATE USER**          | Creates a new user account with specified permissions.                                                                                                                       |
| **DROP USER**            | Deletes a user account.                                                                                                                           |
| **CREATE DATABASE**      | Creates a new database.                                                                                                                           |
| **DROP DATABASE**        | Deletes a database and all its contents.                                                                                                          |
| **CREATE DICTIONARY**    | Creates a new dictionary for external data sources.                                                                                                                   |
| **DROP DICTIONARY**      | Deletes a dictionary from the database.                                                                                                                     |
| **SHOW TABLES**          | Lists all tables in the current database.                                                                                                         |
| **DESCRIBE TABLE**       | Provides detailed information about the structure of a table.                                                                                     |
| **SHOW DATABASES**       | Lists all databases managed by the ClickHouse server.                                                                                                  |
| **SHOW CREATE TABLE**    | Shows the CREATE TABLE statement that can be used to re-create the specified table.                                                                                                  |
| **ANALYZE TABLE**        | ClickHouse does not require explicit analyze operations; it handles statistics automatically.                                                                                             |
| **EXPLAIN**              | Shows the execution plan for a statement, useful for debugging query performance.                                                                 |
| **OPTIMIZE TABLE**       | Merges data parts in the table to optimize read performance.                                                                               |
| **ATTACH TABLE**         | Attaches an existing table to the current database.                                                                                                       |
| **DETACH TABLE**         | Detaches a table from the current database without deleting the data.                                                                                 |
| **SYSTEM SYNC REPLICA**  | Synchronizes the replica with the master in a replicated table.                                                                                                       |

**References:**
- [ClickHouse Documentation](https://clickhouse.com/docs/en/)
- [ClickHouse SQL Reference](https://clickhouse.com/docs/en/sql-reference/)
- [ClickHouse Tutorial](https://clickhouse.com/docs/en/getting-started/)