### NATS CLI Commands

**General Commands:**

1. **nats help**
   - **Description**: Displays help information about the NATS CLI.
   - **Example**:
     ```bash
     nats help
     ```

2. **nats server**
   - **Description**: Manages NATS server instances.
   - **Example**:
     ```bash
     nats server start
     nats server stop
     ```

3. **nats pub**
   - **Description**: Publishes a message to a subject.
   - **Example**:
     ```bash
     nats pub <subject> <message>
     ```

4. **nats sub**
   - **Description**: Subscribes to a subject and receives messages.
   - **Example**:
     ```bash
     nats sub <subject>
     ```

**Server Commands:**

1. **nats server start**
   - **Description**: Starts a NATS server.
   - **Example**:
     ```bash
     nats server start
     ```

2. **nats server stop**
   - **Description**: Stops a running NATS server.
   - **Example**:
     ```bash
     nats server stop
     ```

3. **nats server restart**
   - **Description**: Restarts a NATS server.
   - **Example**:
     ```bash
     nats server restart
     ```

4. **nats server info**
   - **Description**: Displays information about a running NATS server.
   - **Example**:
     ```bash
     nats server info
     ```

**Subject Commands:**

1. **nats sub add**
   - **Description**: Adds a subscription to a subject.
   - **Example**:
     ```bash
     nats sub add <subject>
     ```

2. **nats sub list**
   - **Description**: Lists all active subscriptions.
   - **Example**:
     ```bash
     nats sub list
     ```

3. **nats sub remove**
   - **Description**: Removes a subscription from a subject.
   - **Example**:
     ```bash
     nats sub remove <subject>
     ```

**Stream Commands:**

1. **nats stream add**
   - **Description**: Adds a new stream.
   - **Example**:
     ```bash
     nats stream add <stream_name>
     ```

2. **nats stream list**
   - **Description**: Lists all streams.
   - **Example**:
     ```bash
     nats stream list
     ```

3. **nats stream info**
   - **Description**: Displays information about a specific stream.
   - **Example**:
     ```bash
     nats stream info <stream_name>
     ```

4. **nats stream delete**
   - **Description**: Deletes a stream.
   - **Example**:
     ```bash
     nats stream delete <stream_name>
     ```

**Consumer Commands:**

1. **nats consumer add**
   - **Description**: Adds a new consumer.
   - **Example**:
     ```bash
     nats consumer add <stream_name> <consumer_name>
     ```

2. **nats consumer list**
   - **Description**: Lists all consumers for a stream.
   - **Example**:
     ```bash
     nats consumer list <stream_name>
     ```

3. **nats consumer info**
   - **Description**: Displays information about a specific consumer.
   - **Example**:
     ```bash
     nats consumer info <stream_name> <consumer_name>
     ```

4. **nats consumer delete**
   - **Description**: Deletes a consumer.
   - **Example**:
     ```bash
     nats consumer delete <stream_name> <consumer_name>
     ```

**Account Commands:**

1. **nats account add**
   - **Description**: Adds a new account.
   - **Example**:
     ```bash
     nats account add <account_name>
     ```

2. **nats account list**
   - **Description**: Lists all accounts.
   - **Example**:
     ```bash
     nats account list
     ```

3. **nats account info**
   - **Description**: Displays information about a specific account.
   - **Example**:
     ```bash
     nats account info <account_name>
     ```

4. **nats account delete**
   - **Description**: Deletes an account.
   - **Example**:
     ```bash
     nats account delete <account_name>
     ```

**Other Useful Commands:**

1. **nats bench**
   - **Description**: Benchmarks NATS performance.
   - **Example**:
     ```bash
     nats bench -s <server> -np <num_publishers> -ns <num_subscribers>
     ```

2. **nats status**
   - **Description**: Displays the status of the NATS system.
   - **Example**:
     ```bash
     nats status
     ```

3. **nats ping**
   - **Description**: Pings the NATS server to check connectivity.
   - **Example**:
     ```bash
     nats ping <server>
     ```

4. **nats top**
   - **Description**: Displays the top NATS clients by activity.
   - **Example**:
     ```bash
     nats top
     ```

For more detailed usage and options for each command, refer to the official NATS CLI documentation and [NATS CLI GitHub Repository](https://github.com/nats-io/natscli).