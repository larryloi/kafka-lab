FROM confluentinc/cp-server-connect:7.6.0

# Switch to root user to install packages
USER root

# Install Java 17 and Maven using yum
RUN yum update -y && \
    yum install -y java-17-openjdk-devel unzip && \
    yum clean all

# Online Installing connector plugins 
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.8.0 && \
    curl -L "https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/9.1.0/mysql-connector-j-9.1.0.jar" -o /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib/mysql-connector-j-9.1.0.jar && \
    confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:2.5.4 && \
    confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:2.0.65

# Offline Installing connector plugins
# Debezium MySQL Connector version 3.0.8
RUN curl -L "https://hub-downloads.confluent.io/api/plugins/debezium/debezium-connector-mysql/versions/3.0.8/debezium-debezium-connector-mysql-3.0.8.zip" -o /tmp/debezium-debezium-connector-mysql-3.0.8.zip && \
    mkdir -p /usr/share/confluent-hub-components/debezium-connector-mysql && \    
    unzip /tmp/debezium-debezium-connector-mysql-3.0.8.zip -d /usr/share/confluent-hub-components/debezium-connector-mysql && \
    rm -f /tmp/debezium-debezium-connector-mysql-3.0.8.zip 

# RUN curl -L "https://hub-downloads.confluent.io/api/plugins/confluentinc/kafka-connect-spooldir/versions/2.0.67/confluentinc-kafka-connect-spooldir-2.0.67.zip" -o /tmp/confluentinc-kafka-connect-spooldir-2.0.67.zip && \
#     mkdir -p /usr/share/confluent-hub-components/jcustenborder-kafka-connect-spooldir && \
#     unzip /tmp/confluentinc-kafka-connect-spooldir-2.0.67.zip -d /usr/share/confluent-hub-components/jcustenborder-kafka-connect-spooldir && \
#     rm -f /tmp/confluentinc-kafka-connect-spooldir-2.0.67.zip

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Update PATH
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Switch back to the non-root user
USER appuser

