# Spring Boot product management app

A demo project to gain experience with:
- RESTful CRUD operations using Spring Data JPA
- Stream processing using Kafka

## Prerequisites

- Java 17+
- Apache Kafka (local installation)
- Maven 3.6+

## Installation

1. **Install Kafka** (MacOS with Homebrew):
   ```bash
   brew install kafka
   ```

2. **Clone the repository**:

    ```bash
    git clone https://github.com/danielle-newport/springboot-product-manager.git
    ```

## Running the Application

Note: Update ```KAFKA_DIR``` in Makefile to match the path of your local Kafka installation

    ```bash
    make all              # Build the project, then start Kafka and Spring Boot
    make compile          # Build Spring Boot project
    make start-consumer   # Launch Kafka consumer
    make start-producer   # Launch Kafka producer
    make clean            # Stop all services (Kafka and Spring Boot)
    ```

## Project Structure

This project follows the standard Maven directory layout

    src/
    ├── main/
    │   ├── java/gasville/daniellenewport/demo
    │   │   ├── config/      # Kafka configuration
    │   │   ├── controller/  # REST endpoints
    │   │   ├── dto/         # Data transfer objects
    │   │   ├── model/       # JPA entities
    │   │   ├── repository/  # Database repositories
    │   │   └── service/     # Business logic
    │   └── resources/       # Properties and static files
    ├── .gitignore
    ├── Makefile
    └── pom.xml
