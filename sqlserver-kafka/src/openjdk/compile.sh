#!/bin/bash
JAR_SRC_PATH=/code/jars
JAVA_SRC_PATH=com/github/larryloi/kafka/connect/smt
JAVA_SRC_NAME=LogMessageSMT

COMPILE()
    {
        echo "Executing: javac -cp \"${JAR_SRC_PATH}/*\" ${JAVA_SRC_PATH}/${JAVA_SRC_NAME}.java"
        javac -cp "${JAR_SRC_PATH}/*" ${JAVA_SRC_PATH}/${JAVA_SRC_NAME}.java
    }

JAR()
    {
        echo "Executing: jar cvf \"${JAR_SRC_PATH}/${JAVA_SRC_NAME}.jar\" ${JAVA_SRC_PATH}/${JAVA_SRC_NAME}.class"
        jar cvf "${JAR_SRC_PATH}/${JAVA_SRC_NAME}.jar" ${JAVA_SRC_PATH}/${JAVA_SRC_NAME}.class
    }


#COMPILE
JAR
