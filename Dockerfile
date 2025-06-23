FROM openjdk:8-jdk-slim

# Set a working directory inside the container
WORKDIR /app

# Copy the Maven-built jar from your machine into the container
COPY target/MyProjects-0.0.1-SNAPSHOT.jar .

# Expose the port your app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "MyProjects-0.0.1-SNAPSHOT.jar"]