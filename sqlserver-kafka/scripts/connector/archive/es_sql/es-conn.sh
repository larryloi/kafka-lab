#!/bin/bash

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '
{"name": "dst_es_emp_v1",
"config":  {
"connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
"connection.url": "http://es:9200",
"tasks.max": "1",
"topics": "v1.DB_Ecommerce.dbo.emp",
"type.name": "_doc",

"key.converter.schemas.enable": "true",
"key.converter.schema.registry.url": "http://schema-registry:8081",
"key.converter" : "org.apache.kafka.connect.storage.StringConverter",

"value.converter.schemas.enable": "true",
"value.converter.schema.registry.url": "http://schema-registry:8081",
"value.converter": "org.apache.kafka.connect.json.JsonConverter",

"errors.log.enable": "true",
"errors.log.include.messages": "true",

"behavior.on.null.values": "DELETE",
"behavior.on.malformed.documents": "IGNORE",

"schema.ignore": "true",

"key.ignore":"true",

"transforms": "ExtractFieldAfter,RenameFieldName,ConvertDateFields,ConvertStringToJson",

"transforms.ExtractFieldAfter.type": "org.apache.kafka.connect.transforms.ExtractField$Value",
"transforms.ExtractFieldAfter.field": "after",

"transforms.RenameFieldName.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
"transforms.RenameFieldName.renames": "name:Fname",

"transforms.ConvertDateFields.type": "com.github.larryloi.kafka.connect.smt.ConvertDateFields",

"transforms.ConvertStringToJson.type": "com.github.larryloi.kafka.connect.smt.ConvertStringToJson",
"transforms.ConvertStringToJson.field": "detail"

}
}'
