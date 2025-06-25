# Dockerfile
FROM openjdk:11-jre-slim
COPY target/java-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]
