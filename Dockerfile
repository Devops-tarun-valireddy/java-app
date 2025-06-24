# Dockerfile
FROM openjdk:11-jre-slim
COPY target/simple-java-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
