
### Types of Database Setups: Standalone, Cluster, and Master-Slave

#### 1. Standalone Instance

**Overview:**
A standalone instance is a single database server that handles all database operations independently. It is the simplest and most common setup for development and small-scale applications.

**Characteristics:**

- **Simplicity**: Easy to set up and manage.
- **Cost-Effective**: Requires minimal resources.
- **Single Point of Failure**: If the server fails, the database becomes unavailable.
- **Performance**: Suitable for low to moderate workloads.

**Use Cases:**

- Development and testing environments.
- Small-scale applications with low traffic.

**References:**

- [MySQL Standalone Installation](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/)
- [PostgreSQL Standalone Setup](https://www.postgresql.org/docs/current/tutorial-start.html)
- [Redis Standalone Setup](https://redis.io/topics/quickstart)

#### 2. Cluster

**Overview:**
A cluster setup involves multiple database servers working together to provide high availability, load balancing, and scalability. Clusters can distribute the load across multiple nodes and provide redundancy.

**Characteristics:**

- **High Availability**: Redundancy ensures that if one node fails, others can take over.
- **Scalability**: Can handle large amounts of data and high traffic by adding more nodes.
- **Complexity**: More complex to set up and manage compared to standalone instances.
- **Performance**: Improved performance due to load distribution and parallel processing.

**Use Cases:**

- Large-scale applications with high traffic and data volume.
- Applications requiring high availability and disaster recovery.

**Types of Clusters:**

- **Sharded Clusters**: Data is partitioned across multiple nodes. Common in MongoDB.
- **Replicated Clusters**: Data is replicated across nodes. Common in Redis and ClickHouse.

**References:**

- [MongoDB Sharding](https://docs.mongodb.com/manual/sharding/)
- [ClickHouse Cluster Setup](https://clickhouse.com/docs/en/operations/cluster-setup/)
- [Redis Cluster Setup](https://redis.io/topics/cluster-tutorial)

#### 3. Master-Slave (Primary-Replica)

**Overview:**
A master-slave setup consists of one primary (master) server and one or more secondary (slave) servers. The master handles all write operations and replicates the data to the slaves, which handle read operations.

**Characteristics:**

- **Read Scalability**: Offloads read operations to slaves, improving read performance.
- **Data Redundancy**: Provides data redundancy, enhancing data availability.
- **Eventual Consistency**: Slaves may lag behind the master, leading to eventual consistency.
- **Complexity**: Requires careful configuration to ensure proper replication and consistency.

**Use Cases:**

- Applications with high read-to-write ratios.
- Scenarios requiring data redundancy and backup.

**Benefits:**

- **Load Balancing**: Distributes read queries across multiple nodes.
- **Backup**: Slaves can be used as backups for disaster recovery.
- **Maintenance**: Allows for maintenance on the master with minimal downtime by directing traffic to slaves.

**Challenges:**

- **Data Lag**: Slaves may not have the most recent data due to replication delay.
- **Complexity**: Managing replication and ensuring data consistency can be complex.

**References:**

- [PostgreSQL Streaming Replication](https://www.postgresql.org/docs/current/warm-standby.html)
- [MySQL Replication](https://dev.mysql.com/doc/refman/8.0/en/replication.html)
- [Redis Replication](https://redis.io/topics/replication)

By understanding these different types of database setups, you can choose the appropriate configuration based on the needs of your application, whether it requires high availability, scalability, or simple development environments.

### Introduction to Databases: MongoDB, ClickHouse, PostgreSQL, Redis

#### 1. MongoDB

**Overview:**
MongoDB is a NoSQL, document-oriented database designed for high scalability and flexibility. It stores data in flexible, JSON-like documents, making it easy to work with structured, semi-structured, or unstructured data.

**Key Points:**

- **Document-Oriented**: MongoDB uses BSON (binary JSON) to store data, which allows for complex data structures like arrays and nested documents.
- **Scalable**: MongoDB is designed to scale out by distributing data across multiple servers using sharding, which allows it to handle large amounts of data and high throughput.
- **Flexible Schema**: Unlike relational databases, MongoDB does not require a predefined schema, making it ideal for applications with evolving data models.

**Official Documentation and Resources:**

- [MongoDB Documentation](https://docs.mongodb.com/manual/) - Comprehensive guide to MongoDB.
- [Getting Started with MongoDB](https://docs.mongodb.com/manual/tutorial/getting-started/) - Tutorial for beginners.

#### 2. ClickHouse

**Overview:**
ClickHouse is a columnar database management system (DBMS) for online analytical processing (OLAP). It is optimized for fast query performance on large datasets, making it ideal for real-time analytics.

**Key Points:**

- **Columnar Storage**: ClickHouse stores data by columns rather than rows, which improves query performance for analytical workloads.
- **Real-Time Analytics**: Designed to process large volumes of data quickly, ClickHouse can provide real-time query responses.
- **Scalability**: ClickHouse can scale horizontally, allowing it to handle petabytes of data across distributed clusters.

**Official Documentation and Resources:**

- [ClickHouse Documentation](https://clickhouse.com/docs/en/) - Official documentation and guides.
- [Introduction to ClickHouse](https://clickhouse.com/docs/en/getting-started/) - Getting started guide.

#### 3. PostgreSQL

**Overview:**
PostgreSQL is a powerful, open-source relational database management system (RDBMS). It is known for its robustness, extensibility, and support for both SQL and NoSQL data models.

**Key Points:**

- **ACID Compliance**: PostgreSQL ensures reliable transactions through Atomicity, Consistency, Isolation, and Durability (ACID) properties.
- **Extensibility**: Users can define their own data types, operators, and index methods, making PostgreSQL highly adaptable.
- **Advanced Features**: Includes features like advanced indexing, full-text search, and support for JSON, XML, and other data types.

**Official Documentation and Resources:**

- [PostgreSQL Documentation](https://www.postgresql.org/docs/) - Comprehensive official documentation.
- [Getting Started with PostgreSQL](https://www.postgresql.org/docs/current/tutorial-start.html) - Tutorial for new users.

#### 4. Redis

**Overview:**
Redis is an open-source, in-memory data structure store, used as a database, cache, and message broker. It supports various data structures and provides high performance for read and write operations.

**Key Points:**

- **In-Memory Storage**: Redis stores data in memory, which allows for fast data access and low-latency responses.
- **Data Structures**: Supports a variety of data structures, including strings, hashes, lists, sets, and more.
- **Persistence Options**: Offers different levels of data persistence, including snapshotting and append-only file (AOF) logging.

**Official Documentation and Resources:**

- [Redis Documentation](https://redis.io/documentation) - Comprehensive guide to Redis.
- [Getting Started with Redis](https://redis.io/topics/quickstart) - Quickstart guide for beginners.



### Practical Tasks for "Introduction to Databases: MongoDB, ClickHouse, PostgreSQL, Redis"

#### 1. Deploy All Types of Databases Using Docker

**Objective:** Learn to deploy MongoDB, ClickHouse, PostgreSQL, and Redis using Docker containers.

**Tasks:**

1. **Set Up Docker Environment:**
   - Install Docker on your system if not already installed.
   - Ensure Docker is running properly by executing `docker --version`.

2. **Deploy MongoDB:**
   - Pull the MongoDB image: `docker pull mongo`
   - Run a MongoDB container:

     ```bash
     docker run --name mongodb -d -p 27017:27017 mongo
     ```

3. **Deploy ClickHouse:**
   - Pull the ClickHouse image: `docker pull yandex/clickhouse-server`
   - Run a ClickHouse container:

     ```bash
     docker run --name clickhouse-server -d -p 8123:8123 -p 9000:9000 yandex/clickhouse-server
     ```

4. **Deploy PostgreSQL:**
   - Pull the PostgreSQL image: `docker pull postgres`
   - Run a PostgreSQL container:

     ```bash
     docker run --name postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
     ```

5. **Deploy Redis:**
   - Pull the Redis image: `docker pull redis`
   - Run a Redis container:

     ```bash
     docker run --name redis -d -p 6379:6379 redis
     ```

**Definition of Done:**

- Verify that all databases are running by checking their respective ports.

#### 2. Create All Objects to Start Working with DBs

**Objective:** Explore basic operations and objects in MongoDB, ClickHouse, PostgreSQL, and Redis by creating users, tables, and inserting initial data.

**Tasks:**

1. **MongoDB:**
   - Connect to MongoDB container:

     ```bash
     docker exec -it mongodb mongo
     ```

   - Create a new database and collection:

     ```javascript
     use mydatabase;
     db.createCollection("mycollection");
     ```

   - Insert a document:

     ```javascript
     db.mycollection.insert({name: "Alice", age: 25});
     ```

   - Create a user:

     ```javascript
     db.createUser({
       user: "myuser",
       pwd: "mypassword",
       roles: [{ role: "readWrite", db: "mydatabase" }]
     });
     ```

2. **ClickHouse:**
   - Connect to ClickHouse container:

     ```bash
     docker exec -it clickhouse-server clickhouse-client
     ```

   - Create a database and table:

     ```sql
     CREATE DATABASE mydatabase;
     CREATE TABLE mydatabase.mytable (id UInt32, name String) ENGINE = Log;
     ```

   - Insert data:

     ```sql
     INSERT INTO mydatabase.mytable VALUES (1, 'Alice'), (2, 'Bob');
     ```

3. **PostgreSQL:**
   - Connect to PostgreSQL container:

     ```bash
     docker exec -it postgres psql -U postgres
     ```

   - Create a database, user, and table:

     ```sql
     CREATE DATABASE mydatabase;
     \c mydatabase;
     CREATE USER myuser WITH PASSWORD 'mypassword';
     CREATE TABLE mytable (id SERIAL PRIMARY KEY, name VARCHAR(50));
     ```

   - Insert data:

     ```sql
     INSERT INTO mytable (name) VALUES ('Alice'), ('Bob');
     ```

4. **Redis:**
   - Connect to Redis container:

     ```bash
     docker exec -it redis redis-cli
     ```

   - Set and get a key-value pair:

     ```bash
     SET mykey "Hello"
     GET mykey
     ```

**Definition of Done:**

- Successfully create databases, tables/collections, users, and insert initial data into each type of database.

#### 3. Install CLI Tools for Connecting to Databases from Local Machine

**Objective:** Install CLI tools on your local machine to connect to the databases running inside Docker containers.

**Tasks:**

1. **MongoDB CLI (Mongo Shell):**
   - Install MongoDB CLI:

     ```bash
     # On Ubuntu
     sudo apt-get install -y mongodb-clients
     # On macOS
     brew tap mongodb/brew
     brew install mongodb-community-shell
     ```

   - Connect to MongoDB container:

     ```bash
     mongo --host localhost --port 27017
     ```

2. **ClickHouse CLI:**
   - Install ClickHouse CLI:

     ```bash
     # On Ubuntu
     sudo apt-get install clickhouse-client
     # On macOS
     brew install clickhouse
     ```

   - Connect to ClickHouse container:

     ```bash
     clickhouse-client --host localhost --port 9000
     ```

3. **PostgreSQL CLI (psql):**
   - Install PostgreSQL CLI:

     ```bash
     # On Ubuntu
     sudo apt-get install postgresql-client
     # On macOS
     brew install libpq
     brew link --force libpq
     ```

   - Connect to PostgreSQL container:

     ```bash
     psql -h localhost -p 5432 -U postgres
     ```

4. **Redis CLI:**
   - Install Redis CLI:

     ```bash
     # On Ubuntu
     sudo apt-get install redis-tools
     # On macOS
     brew install redis
     ```

   - Connect to Redis container:

     ```bash
     redis-cli -h localhost -p 6379
     ```

**Definition of Done:**

- Successfully install the CLI tools on your local machine and connect to each of the databases running in Docker containers.

---

**Additional Resources:**

- [Docker Documentation](https://docs.docker.com/)
- [MongoDB Docker Documentation](https://hub.docker.com/_/mongo)
- [ClickHouse Docker Documentation](https://hub.docker.com/r/yandex/clickhouse-server)
- [PostgreSQL Docker Documentation](https://hub.docker.com/_/postgres)
- [Redis Docker Documentation](https://hub.docker.com/_/redis)
- [MongoDB CLI Documentation](https://docs.mongodb.com/manual/mongo/)
- [ClickHouse CLI Documentation](https://clickhouse.tech/docs/en/interfaces/cli/)
- [PostgreSQL CLI Documentation](https://www.postgresql.org/docs/current/app-psql.html)
- [Redis CLI Documentation](https://redis.io/topics/rediscli)

By completing these practical tasks, students will gain hands-on experience in deploying, initializing, and interacting with MongoDB, ClickHouse, PostgreSQL, and Redis databases.
