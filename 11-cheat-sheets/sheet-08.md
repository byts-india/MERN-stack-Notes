# system design cheat sheet 

| Step | Component               | Purpose                      |
| ---- | ----------------------- | ---------------------------- |
| 1    | Client (Browser/Mobile) | Sends request                |
| 2    | DNS                     | Converts domain to IP        |
| 3    | Load Balancer           | Distributes traffic          |
| 4    | Web Server              | Receives request             |
| 5    | Application Server      | Executes business logic      |
| 6    | Cache                   | Returns frequently used data |
| 7    | Database                | Stores data                  |
| 8    | Queue                   | Handles async tasks          |
| 9    | CDN                     | Serves static files          |

| Component      | Examples                   | Why Use It            |
| -------------- | -------------------------- | --------------------- |
| Load Balancer  | Nginx, HAProxy, ALB        | Distribute traffic    |
| API Gateway    | Kong, Spring Cloud Gateway | Route APIs            |
| Cache          | Redis, Memcached           | Faster responses      |
| Database       | MySQL, PostgreSQL          | Structured data       |
| NoSQL          | MongoDB, DynamoDB          | Flexible schema       |
| Queue          | RabbitMQ, Kafka, SQS       | Async processing      |
| CDN            | CloudFront, Cloudflare     | Fast content delivery |
| Object Storage | S3, MinIO                  | Store files           |
| Search Engine  | Elasticsearch              | Fast searching        |

| Requirement        | SQL | NoSQL |
| ------------------ | --- | ----- |
| Complex joins      | ✅   | ❌     |
| ACID transactions  | ✅   | ❌     |
| Flexible schema    | ❌   | ✅     |
| Horizontal scaling | ⚠️  | ✅     |
| Banking systems    | ✅   | ❌     |
| Social media feeds | ❌   | ✅     |
| Analytics          | ⚠️  | ✅     |

## db to choose

| Feature        | SQL               | NoSQL              |
| -------------- | ----------------- | ------------------ |
| Schema         | Fixed             |                    |
| Flexible       |                   |                    |
| Scaling        | Vertical          | Horizontal         |
| Query Language | SQL               | Custom             |
| Examples       | MySQL, PostgreSQL | MongoDB, Cassandra |
| Transactions   | Strong            | Limited            |

## scaling

| Feature        | SQL               | NoSQL              |
| -------------- | ----------------- | ------------------ |
| Schema         | Fixed             |                    |
| Flexible       |                   |                    |
| Scaling        | Vertical          | Horizontal         |
| Query Language | SQL               | Custom             |
| Examples       | MySQL, PostgreSQL | MongoDB, Cassandra |
| Transactions   | Strong            | Limited            |

## load balancing algo

| Algorithm            | Description                       |
| -------------------- | --------------------------------- |
| Round Robin          | Send requests sequentially        |
| Weighted Round Robin | Powerful servers get more traffic |
| Least Connections    | Server with fewer connections     |
| IP Hash              | Same user → same server           |

## caching strategies

| Strategy      | Description                  |
| ------------- | ---------------------------- |
| Cache Aside   | Application manages cache    |
| Read Through  | Cache reads database         |
| Write Through | Update DB and cache together |
| Write Back    | Update cache first           |
| TTL           | Expire cache after time      |

## database scaling

| Technique    | Description         |
| ------------ | ------------------- |
| Replication  | Duplicate database  |
| Sharding     | Split data          |
| Partitioning | Divide large tables |
| Indexing     | Faster queries      |

## replication types

| Type          | Description           |
| ------------- | --------------------- |
| Master-Slave  | One write, many reads |
| Master-Master | Multiple write nodes  |

## cap theorem

| Property | Meaning             |
| -------- | ------------------- |
| C        | Consistency         |
| A        | Availability        |
| P        | Partition Tolerance |

| System Type | Supports                          |
| ----------- | --------------------------------- |
| CP          | Consistency + Partition           |
| AP          | Availability + Partition          |
| CA          | Impossible in distributed systems |

| Consistency Model    | Description                |
| -------------------- | -------------------------- |
| Strong Consistency   | Latest data always visible |
| Eventual Consistency | Data syncs later           |
| Weak Consistency     | No guarantee               |

## communication pattern

| Pattern      | Example         |
| ------------ | --------------- |
| Synchronous  | REST API        |
| Asynchronous | Kafka, RabbitMQ |
| Streaming    | WebSocket       |
| RPC          | gRPC            |

## message queue

| Tool          | Best For           |
| ------------- | ------------------ |
| RabbitMQ      | Reliable messaging |
| Kafka         | High throughput    |
| SQS           | AWS queue          |
| Redis Pub/Sub | Lightweight events |


| Feature         | REST   | WebSocket | gRPC      |
| --------------- | ------ | --------- | --------- |
| Protocol        | HTTP   | TCP       | HTTP/2    |
| Real-time       | ❌      | ✅         | ✅         |
| Fast            | Medium | Fast      | Very Fast |
| Browser support | ✅      | ✅         | ⚠️        |

| Method  | Use Case         |
| ------- | ---------------- |
| Session | Traditional apps |
| JWT     | APIs             |
| OAuth2  | Google login     |
| API Key | Internal APIs    |

| Principle  | Example     |
| ---------- | ----------- |
| Use nouns  | `/users`    |
| Use plural | `/products` |
| GET        | Read        |
| POST       | Create      |
| PUT        | Replace     |
| PATCH      | Update      |
| DELETE     | Delete      |

| Code | Meaning      |
| ---- | ------------ |
| 200  | OK           |
| 201  | Created      |
| 204  | No Content   |
| 400  | Bad Request  |
| 401  | Unauthorized |
| 403  | Forbidden    |
| 404  | Not Found    |
| 409  | Conflict     |
| 500  | Server Error |

## micro service pattern

| Pattern           | Purpose                 |
| ----------------- | ----------------------- |
| API Gateway       | Single entry point      |
| Service Discovery | Find services           |
| Circuit Breaker   | Prevent failures        |
| Saga              | Distributed transaction |
| CQRS              | Separate read/write     |
| Event Sourcing    | Store events            |

## reliability pattern

| Pattern         | Purpose                    |
| --------------- | -------------------------- |
| Retry           | Retry failed request       |
| Timeout         | Stop waiting               |
| Circuit Breaker | Prevent cascading failures |
| Bulkhead        | Isolate failures           |
| Rate Limiting   | Control traffic            |

## performance metrics

| Metric        | Formula            |
| ------------- | ------------------ |
| Latency       | Time per request   |
| Throughput    | Requests/sec       |
| Availability  | Uptime %           |
| Error Rate    | Failed requests    |
| Response Time | Request → Response |

## db index 

| Index Type      | Use Case         |
| --------------- | ---------------- |
| Primary Index   | Primary key      |
| Unique Index    | Unique values    |
| Composite Index | Multiple columns |
| Full Text Index | Search           |
| Clustered Index | Sorted storage   |

## common qns

| System        | Main Challenge      |
| ------------- | ------------------- |
| WhatsApp      | Real-time messaging |
| Instagram     | Feed generation     |
| YouTube       | Video storage       |
| Uber          | Live location       |
| Netflix       | Streaming           |
| Amazon        | Inventory           |
| URL Shortener | Unique IDs          |
| Twitter/X     | Timeline            |

## golden rules

| Rule                          | Meaning               |
| ----------------------------- | --------------------- |
| Avoid single point of failure | Use redundancy        |
| Cache frequently used data    | Improve speed         |
| Scale horizontally            | Handle growth         |
| Make services stateless       | Easier scaling        |
| Use queues for heavy work     | Improve performance   |
| Monitor everything            | Detect issues         |
| Design for failure            | Servers can fail      |
| Keep it simple                | Avoid overengineering |
