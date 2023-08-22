package com.github.larryloi.kafka.connect.smt;

import org.apache.kafka.connect.data.Field;
import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.SchemaBuilder;
import org.apache.kafka.connect.data.Struct;
import org.apache.kafka.connect.sink.SinkRecord;
import org.apache.kafka.connect.transforms.Transformation;
import org.apache.kafka.common.config.ConfigDef;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Map;

public class ConvertStringToJson implements Transformation<SinkRecord> {

    private static final String DETAIL_FIELD = "detail";
    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public SinkRecord apply(SinkRecord record) {
        if (record.value() == null) {
            return record;
        }

        final Struct value = (Struct) record.value();
        final Schema valueSchema = record.valueSchema();

        final String detailString = value.getString(DETAIL_FIELD);
        final Map<String, Object> detailMap;
        try {
            detailMap = objectMapper.readValue(detailString, Map.class);
        } catch (Exception e) {
            throw new RuntimeException("Failed to parse detail field as JSON", e);
        }

        final SchemaBuilder newValueSchemaBuilder = SchemaBuilder.struct();
        for (Field field : valueSchema.fields()) {
            if (field.name().equals(DETAIL_FIELD)) {
                newValueSchemaBuilder.field(DETAIL_FIELD, SchemaBuilder.map(Schema.STRING_SCHEMA, Schema.STRING_SCHEMA).optional().build());
            } else {
                newValueSchemaBuilder.field(field.name(), field.schema());
            }
        }
        final Schema newValueSchema = newValueSchemaBuilder.build();

        final Struct newValue = new Struct(newValueSchema);
        for (Field field : newValueSchema.fields()) {
            if (field.name().equals(DETAIL_FIELD)) {
                newValue.put(DETAIL_FIELD, detailMap);
            } else {
                newValue.put(field.name(), value.get(field));
            }
        }

        return record.newRecord(record.topic(), record.kafkaPartition(), record.keySchema(), record.key(), newValueSchema, newValue, record.timestamp());
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

