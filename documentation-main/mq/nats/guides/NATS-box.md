### Tools for Checking Messages in NATS

#### 1. **NATS Box**

NATS Box is a Docker image that includes various tools for interacting with NATS, such as `nats` CLI, `nats-top`, and others. It allows you to monitor and manage your NATS server easily.

- **Installation and Usage**:

  ```bash
  docker run -ti natsio/nats-box
  ```

- **Example Command**:

  ```bash
  nats sub -s nats://<server>:4222 <subject>
  ```

**Official Documentation**: [NATS Box on GitHub](https://github.com/nats-io/nats-box)

#### 2. **NATS CLI**

The NATS Command Line Interface (`nats` CLI) allows you to publish, subscribe, and manage NATS resources directly from the command line.

- **Installation**:

  ```bash
  brew install nats-io/nats-tools/nats
  ```

  or download the binary from [NATS CLI Releases](https://github.com/nats-io/natscli/releases).

- **Example Commands**:

  ```bash
  nats sub <subject> -s nats://<server>:4222
  nats pub <subject> "Message"
  ```

**Official Documentation**: [NATS CLI Documentation](https://docs.nats.io/nats-tools/natscli)

#### 3. **NATS Web UI (NATS Streaming Server)**

For NATS Streaming, you can use a web-based admin console called `stan-pubsub`.

- **Installation**:

  ```bash
  npm install -g stan-pubsub
  ```

  or download from [NATS Streaming Server Tools](https://github.com/nats-io/stan-tools).

- **Running the Web UI**:

  ```bash
  stan-pubsub -s nats://<server>:4222
  ```

**Official Documentation**: [NATS Streaming Server Tools](https://github.com/nats-io/stan-tools)

#### 4. **NATS Management UI**

Various community-supported management UIs are available for NATS. One example is the `NATS-Management-UI`.

- **Installation**:
  Clone the repository from [NATS Management UI](https://github.com/jwskinner/nats-management-ui).
  
- **Running the UI**:

  ```bash
  npm install
  npm start
  ```

**Official Documentation**: [NATS Management UI](https://github.com/jwskinner/nats-management-ui)

#### 5. **NATS Monitoring**

NATS servers come with a built-in monitoring endpoint that provides metrics and status information.

- **Accessing Monitoring Endpoints**:

  ```
  http://<server>:8222/varz
  http://<server>:8222/connz
  http://<server>:8222/subsz
  ```

**Official Documentation**: [NATS Monitoring](https://docs.nats.io/nats-server/configuration/monitoring)

### Summary

- **NATS Box**: Docker-based tool suite.
- **NATS CLI**: Command-line interface for NATS operations.
- **NATS Web UI (Streaming)**: Web-based interface for NATS Streaming.
- **NATS Management UI**: Community-supported web UI for NATS management.
- **NATS Monitoring**: Built-in monitoring endpoints for metrics and status.

By utilizing these tools, you can effectively monitor and manage messages in NATS queues, ensuring smooth operation of your messaging infrastructure.
