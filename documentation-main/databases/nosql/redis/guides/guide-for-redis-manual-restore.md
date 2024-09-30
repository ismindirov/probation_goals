### Guide for Redis Manual Restore

This guide will walk you through the process of manually restoring a Redis instance from a backup. The backup could be in the form of an RDB (Redis Database) file or an AOF (Append-Only File). We will cover both scenarios step by step.

### **Prerequisites:**

1. **Redis Installed**: Ensure Redis is installed on the server where you want to perform the restore.
2. **Backup File**: You should have a backup file (either `dump.rdb` or `appendonly.aof`) ready for restoration.
3. **Access to Redis Configuration**: You need to have access to the Redis configuration file (`redis.conf`) for configuring the server.

---

### **Step 1: Stop the Redis Server**

Before restoring from a backup, stop the running Redis instance to prevent data inconsistencies.

```bash
sudo systemctl stop redis
```

If you're not using systemd, you can stop Redis with the following command:

```bash
sudo service redis-server stop
```

**Explanation**: Stopping Redis ensures that no new data is written to the database during the restoration process, which could corrupt the backup data.

---

### **Step 2: Locate and Replace the Backup File**

#### **Restoring from an RDB File:**

1. **Navigate to the Redis data directory** (usually `/var/lib/redis` or `/var/redis`):

   ```bash
   cd /var/lib/redis
   ```

2. **Replace the existing `dump.rdb` file** with your backup file:

   ```bash
   sudo mv /path/to/your/backup/dump.rdb .
   ```

   Ensure that the `dump.rdb` file is placed directly in the Redis data directory.

#### **Restoring from an AOF File:**

1. **Enable AOF persistence** (if not already enabled) in the `redis.conf` file:

   ```bash
   sudo nano /etc/redis/redis.conf
   ```

   Find the line `appendonly no` and change it to `appendonly yes`. Save and exit.

2. **Navigate to the Redis data directory**:

   ```bash
   cd /var/lib/redis
   ```

3. **Replace the existing `appendonly.aof` file** with your backup file:

   ```bash
   sudo mv /path/to/your/backup/appendonly.aof .
   ```

**Explanation**: The `dump.rdb` or `appendonly.aof` files contain your database's snapshot or log of all commands, respectively. Replacing the existing files with backups restores your database to its previous state.

---

### **Step 3: Start the Redis Server**

After placing the backup file, start the Redis server:

```bash
sudo systemctl start redis
```

Or, if you're not using systemd:

```bash
sudo service redis-server start
```

**Explanation**: Starting Redis will load the data from the `dump.rdb` or `appendonly.aof` file, depending on your setup. Redis will either load the snapshot directly into memory (RDB) or replay the AOF to reconstruct the in-memory data.

---

### **Step 4: Verify the Restore**

Once Redis is running, verify that the data has been restored successfully:

1. **Connect to the Redis CLI**:

   ```bash
   redis-cli
   ```

2. **Check the data**:

   Run commands to inspect your data and ensure that the restore was successful. For example, list keys or retrieve values:

   ```bash
   keys *
   get your_key
   ```

**Explanation**: Verifying the data ensures that the restore process was successful and that your Redis instance is back to its expected state.

---

### **Step 5: (Optional) Optimize and Clean Up**

If you restored from an AOF file, you might want to optimize the file to reduce its size:

1. **Rewrite the AOF**:

   ```bash
   redis-cli BGREWRITEAOF
   ```

**Explanation**: The `BGREWRITEAOF` command rewrites the AOF file in the background to eliminate redundant commands, reducing file size and improving performance.

---

### **Conclusion:**

By following these steps, you can manually restore a Redis instance from an RDB or AOF backup. This process is crucial for disaster recovery and ensures that your Redis data is safe and can be restored when needed.
