# Makefile for Kafka-SpringBoot project

# Prerequisites
# 1. Kafka must be downloaded to your local machine
# 2. Spring Boot application must be built (mvn package)

# Variables (update KAFKA_DIR based on your installation location)
KAFKA_DIR=/usr/local/Cellar/kafka/4.0.0
SPRING_APP_JAR=target/demo-0.0.1-SNAPSHOT.jar
INPUT_TOPIC=products-input
OUTPUT_TOPIC=products-output

.PHONY: all compile start-kafka start-spring start-consumer start-producer clean

all: compile start-kafka start-spring

compile:
	@echo "Compiling the project..."
	@mvn clean package
	@echo "Compilation complete"

start-kafka:
	@echo "Starting Kafka..."
	@cd $(KAFKA_DIR) && bin/kafka-server-start config/server.properties > /dev/null 2>&1 &
	@sleep 5
	@echo "Creating topics..."
	@cd $(KAFKA_DIR) && bin/kafka-topics --create --topic $(INPUT_TOPIC) --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1 > /dev/null 2>&1 || true
	@cd $(KAFKA_DIR) && bin/kafka-topics --create --topic $(OUTPUT_TOPIC) --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1 > /dev/null 2>&1 || true
	@echo "Kafka ready"

start-spring:
	@if [ ! -f "$(SPRING_APP_JAR)" ]; then \
		echo "Error: JAR file not found at $(SPRING_APP_JAR)"; \
		echo "Run 'make compile' first to build the application"; \
		exit 1; \
	fi
	@echo "Starting Spring Boot application..."
	@java -jar $(SPRING_APP_JAR) &
	@sleep 10
	@echo "Spring Boot application started"

start-consumer:
	@echo "Starting Kafka consumer for output topic..."
	@cd $(KAFKA_DIR) && bin/kafka-console-consumer --topic $(OUTPUT_TOPIC) --from-beginning --bootstrap-server localhost:9092

start-producer:
	@echo "Starting Kafka producer for input topic..."
	@cd $(KAFKA_DIR) && bin/kafka-console-producer --topic $(INPUT_TOPIC) --bootstrap-server localhost:9092

clean:
	@echo "Stopping all services..."
	@pkill -f $(SPRING_APP_JAR) || true
	@cd $(KAFKA_DIR) && bin/kafka-server-stop || true
	@cd $(KAFKA_DIR) && bin/zookeeper-server-stop || true
	@echo "Cleanup complete"