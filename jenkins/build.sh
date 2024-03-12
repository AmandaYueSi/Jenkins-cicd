#!/bin/bash

# Stop the script if any command fails
set -e

# Clean and build the project
echo "Cleaning the project..."
mvn clean

echo "Building the project..."
mvn package

# Optionally, you can include a command to run the application
# echo "Running the application..."
# mvn spring-boot:run

# Another option for running the application is to execute the generated jar file
# This is typically found in the target directory after packaging
# java -jar target/your-app-name-version.jar

echo "Build completed successfully."
