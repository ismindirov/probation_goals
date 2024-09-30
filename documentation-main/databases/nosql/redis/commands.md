### Redis Commands

| Command                  | Description                                                                                                                                       |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **GET**                  | Retrieves the value associated with a key.                                                                                                        |
| **SET**                  | Sets the value of a key.                                                                                                                          |
| **HGET**                 | Retrieves the value associated with a field in a hash.                                                                                            |
| **HSET**                 | Sets the value of a field in a hash.                                                                                                              |
| **LPUSH**                | Inserts an element at the head of a list.                                                                                                         |
| **RPUSH**                | Inserts an element at the tail of a list.                                                                                                         |
| **LPOP**                 | Removes and returns the first element of a list.                                                                                                  |
| **RPOP**                 | Removes and returns the last element of a list.                                                                                                   |
| **SADD**                 | Adds one or more members to a set.                                                                                                                |
| **SREM**                 | Removes one or more members from a set.                                                                                                           |
| **ZSADD**                | Adds a member to a sorted set with a specified score.                                                                                             |
| **ZREM**                 | Removes a member from a sorted set.                                                                                                               |
| **BITSET**               | Sets or clears the bit at a specified offset in the string value stored at a key.                                                                 |
| **PFADD**                | Adds elements to the HyperLogLog data structure.                                                                                                  |
| **XADD**                 | Appends a new entry to a stream.                                                                                                                  |
| **GEOADD**               | Adds geospatial items (latitude, longitude, and name) to a geospatial index.                                                                      |
| **MODULE LOAD**          | Loads a Redis module.                                                                                                                             |
| **PUBLISH**              | Publishes a message to a channel.                                                                                                                 |
| **SUBSCRIBE**            | Subscribes to a channel to receive messages.                                                                                                      |
| **MULTI**                | Marks the start of a transaction block.                                                                                                           |
| **EXEC**                 | Executes all commands issued after MULTI.                                                                                                         |
| **WATCH**                | Marks keys to be watched for conditional execution of a transaction.                                                                              |
| **UNWATCH**              | Unwatches all keys watched by the WATCH command.                                                                                                  |
| **EVAL**                 | Evaluates a Lua script on the server.                                                                                                             |
| **SLAVEOF**              | Sets up replication, making the current instance a replica of another instance.                                                                   |
| **CLUSTER MEET**         | Adds a node to the cluster.                                                                                                                       |
| **SAVE**                 | Creates a snapshot of the current dataset.                                                                                                        |
| **BGSAVE**               | Creates a snapshot of the dataset in the background.                                                                                              |
| **BGREWRITEAOF**         | Rewrites the Append-Only File to reduce its size.                                                                                                 |
| **INFO**                 | Provides information and statistics about the Redis server.                                                                                       |
| **CONFIG GET**           | Retrieves the value of a configuration parameter.                                                                                                |
| **CONFIG SET**           | Sets the value of a configuration parameter.                                                                                                      |

**References:**
- [Redis Documentation](https://redis.io/documentation)
- [Redis Commands](https://redis.io/commands)
- [Redis Tutorial](https://www.tutorialspoint.com/redis/index.htm)