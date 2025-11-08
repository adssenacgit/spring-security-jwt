FROM maven:3.9.9-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM gcr.io/distroless/java21

COPY --from=build target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "/app.jar"]