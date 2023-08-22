package com.github.larryloi.kafka.connect.smt;

import org.apache.kafka.connect.source.SourceRecord;
import org.apache.kafka.connect.connector.ConnectRecord;
import org.apache.kafka.connect.data.Field;
import org.apache.kafka.connect.data.Schema;
import org.apache.kafka.connect.data.SchemaBuilder;
import org.apache.kafka.connect.data.Struct;
import org.apache.kafka.connect.transforms.Transformation;
import org.apache.kafka.common.config.ConfigDef;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

public class ConvertDateFields<R extends ConnectRecord<R>> implements Transformation<R> {

    private static final String DATE_BIRTH_FIELD_NAME = "date_birth";
    private static final String CREATED_AT_FIELD_NAME = "created_at";
    private static final String UPDATED_AT_FIELD_NAME = "updated_at";
    private static final String DATE_BIRTH_FORMATTED_FIELD_NAME = "date_birth_formatted";
    private static final String CREATED_AT_FORMATTED_FIELD_NAME = "created_at_formatted";
    private static final String UPDATED_AT_FORMATTED_FIELD_NAME = "updated_at_formatted";
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");

    @Override
    public R apply(R record) {
        if (record.value() == null) {
            return record;
        }

        Struct value = (Struct) record.value();
        Schema valueSchema = record.valueSchema();

        Field dateBirthField = valueSchema.field(DATE_BIRTH_FIELD_NAME);
        Field createdAtField = valueSchema.field(CREATED_AT_FIELD_NAME);
        Field updatedAtField = valueSchema.field(UPDATED_AT_FIELD_NAME);

        Integer dateBirthEpochDay = null;
        if (dateBirthField != null) {
            dateBirthEpochDay = value.getInt32(DATE_BIRTH_FIELD_NAME);
        }

        Long createdAtEpochMillis = null;
        if (createdAtField != null) {
            createdAtEpochMillis = value.getInt64(CREATED_AT_FIELD_NAME);
        }

        Long updatedAtEpochMillis = null;
        if (updatedAtField != null) {
            updatedAtEpochMillis = value.getInt64(UPDATED_AT_FIELD_NAME);
        }

        SchemaBuilder newValueSchemaBuilder = SchemaBuilder.struct();
        for (Field field : valueSchema.fields()) {
            newValueSchemaBuilder.field(field.name(), field.schema());
        }
        if (dateBirthEpochDay != null) {
            newValueSchemaBuilder.field(DATE_BIRTH_FORMATTED_FIELD_NAME, Schema.STRING_SCHEMA);
        }
        if (createdAtEpochMillis != null) {
            newValueSchemaBuilder.field(CREATED_AT_FORMATTED_FIELD_NAME, Schema.STRING_SCHEMA);
        }
        if (updatedAtEpochMillis != null) {
            newValueSchemaBuilder.field(UPDATED_AT_FORMATTED_FIELD_NAME, Schema.STRING_SCHEMA);
        }
        Schema newValueSchema = newValueSchemaBuilder.build();

        Struct newValue = new Struct(newValueSchema);
        for (Field field : valueSchema.fields()) {
            newValue.put(field.name(), value.get(field));
        }

        if (dateBirthEpochDay != null) {
            LocalDate dateBirth = LocalDate.ofEpochDay(dateBirthEpochDay);
            String dateBirthFormatted = DATE_FORMATTER.format(dateBirth);
            newValue.put(DATE_BIRTH_FORMATTED_FIELD_NAME, dateBirthFormatted);
        }

        if (createdAtEpochMillis != null) {
            ZonedDateTime createdAt = Instant.ofEpochMilli(createdAtEpochMillis).atZone(ZoneId.systemDefault());
            String createdAtFormatted = DATETIME_FORMATTER.format(createdAt);
            newValue.put(CREATED_AT_FORMATTED_FIELD_NAME, createdAtFormatted);
        }

        if (updatedAtEpochMillis != null) {
            ZonedDateTime updatedAt = Instant.ofEpochMilli(updatedAtEpochMillis).atZone(ZoneId.systemDefault());
            String updatedAtFormatted = DATETIME_FORMATTER.format(updatedAt);
            newValue.put(UPDATED_AT_FORMATTED_FIELD_NAME, updatedAtFormatted);
        }

        return record.newRecord(
                record.topic(),
                record.kafkaPartition(),
                record.keySchema(),
                record.key(),
                newValueSchema,
                newValue,
                record.timestamp()
        );
    }

    @Override
    public ConfigDef config() {
        return new ConfigDef();
    }

    @Override
    public void close() {
    }

    @Override
    public void configure(Map<String, ?> configs) {
    }
}

