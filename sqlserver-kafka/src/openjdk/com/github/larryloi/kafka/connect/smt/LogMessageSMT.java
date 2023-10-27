package com.github.larryloi.kafka.connect.smt;

import org.apache.kafka.connect.connector.ConnectRecord;
import org.apache.kafka.connect.transforms.Transformation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.kafka.common.config.ConfigDef;
import java.util.Map;

public class LogMessageSMT<R extends ConnectRecord<R>> implements Transformation<R> {
    private static final Logger log = LoggerFactory.getLogger(LogMessageSMT.class);

    @Override
    public R apply(R record) {
        log.info("Key: {}", record.key());
        log.info("Value: {}", record.value());
        return record;
    }

    @Override
    public ConfigDef config() {
        return new ConfigDef();
    }

    @Override
    public void close() {}

    @Override
    public void configure(Map<String, ?> configs) {}
}

