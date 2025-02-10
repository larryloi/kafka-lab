# kafka-lab

### Create Network
make network.create




### Upgrade connect server image for MySQL 8.4
docker build -t custom-connect:latest -f ./Dockerfile-connect .

### Check connect container java version
docker run -it --rm custom-connect:latest bash
java -version
mvn -version

### Lab environment

Running docker image below

```bash
    image: confluentinc/cp-zookeeper:7.1.0
    image: confluentinc/cp-server:7.1.0
    image: confluentinc/cp-schema-registry:7.1.0
    image: cnfldemos/cp-server-connect-datagen:0.5.3-7.1.0
    image: confluentinc/cp-enterprise-control-center:7.1.0
    image: confluentinc/cp-ksqldb-server:7.1.0
    image: confluentinc/cp-ksqldb-cli:7.1.0
    image: confluentinc/ksqldb-examples:7.1.0
    image: confluentinc/cp-kafka-rest:7.1.0
```

### Connect service upgrade (Jdbc, Debezium connector upgrade)

Stop connect service

Remove old version jdbc and debezium connect plugins from plugins path

```bash
confluentinc-kafka-connect-jdbc-10.7.4
debezium-debezium-connector-mysql-2.4.2
```

### Install java 17

```bash
apt-get install -y openjdk-17-jdk
```

Download confluentinc-kafka-connect-jdbc-10.8.0.zip

https://www.confluent.io/hub/confluentinc/kafka-connect-jdbc

Download mysql-connector-j-9.1.0.tar.gz

https://dev.mysql.com/downloads/connector/j/

Download debezium-connector-mysql-3.0.6.Final-plugin.tar.gz

https://debezium.io/documentation/reference/3.0/install.html

Download `confluentinc-kafka-connect-jdbc-10.8.0.zip` extract to plugins path

Download `mysql-connector-j-9.1.0.tar.gz` and extract `mysql-connector-j-9.1.0.jar` to plugins path `connect-plugins/confluentinc-kafka-connect-jdbc-10.8.0/lib`

Download `debezium-connector-mysql-3.0.6.Final-plugin.tar.gz` and extract to plugins path

Starup up connect service.