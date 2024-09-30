### Redis Components: Objects

| Object                   | Description                                                                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Key**                  | In Redis, a key is used to uniquely identify a data item. Keys are the primary means of accessing and manipulating data in Redis.                      |
| **String**               | A string is the most basic data type in Redis. Strings can hold any type of data, such as text, numbers, or binary data up to 512 MB.                  |
| **Hash**                 | A hash is a collection of key-value pairs, similar to a dictionary or a map. Hashes are ideal for representing objects.                                |
| **List**                 | A list is a collection of ordered elements. Lists can hold multiple elements, and elements can be added or removed from both ends.                    |
| **Set**                  | A set is a collection of unique, unordered elements. Sets are useful for storing unique items and performing set operations.                           |
| **Sorted Set**           | A sorted set is similar to a set but maintains the elements in a specified order. Each element is associated with a score that determines the order.    |
| **Bitmap**               | A bitmap is a data structure that allows for the manipulation of individual bits within a string.                                                     |
| **HyperLogLog**          | A HyperLogLog is a probabilistic data structure used for approximating the cardinality (number of unique elements) of a dataset.                       |
| **Stream**               | A stream is a data type that allows for the storage and retrieval of a series of events in an append-only log structure.                               |
| **Geospatial Index**     | Redis supports geospatial data and can store, query, and perform operations on geospatial indexes.                                                   |
| **Module**               | Modules extend Redis functionality by adding new data types, commands, or features.                                                                  |
| **Pub/Sub**              | Redis provides a publish/subscribe messaging paradigm for sending and receiving messages in real-time.                                               |
| **Transaction**          | Transactions in Redis allow for the execution of a group of commands in a single, atomic operation.                                                  |
| **Pipeline**             | Pipelining allows for the batching of multiple commands to be sent to the server in a single network call.                                            |
| **Script**               | Redis supports scripting using Lua, which allows for the execution of complex operations directly on the server.                                      |
| **Replication**          | Replication allows for the creation of copies of the Redis database for redundancy and scalability.                                                  |
| **Cluster**              | Redis Cluster provides automatic sharding and high availability by distributing data across multiple nodes.                                          |
| **Snapshot**             | Snapshots provide a point-in-time copy of the database, useful for backups and recovery.                                                             |
| **AOF (Append-Only File)**| The AOF is a persistence mechanism that logs every write operation received by the server, ensuring data durability.                                  |
