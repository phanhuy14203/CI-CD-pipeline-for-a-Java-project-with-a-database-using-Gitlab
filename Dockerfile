## build stage ##
FROM maven:3.5.3-jdk-8-alpine AS build

WORKDIR /app
COPY . .
RUN mvn install -DskipTests=true

## run stage ##
FROM amazoncorretto:8u422-alpine3.18
WORKDIR /run
COPY --from=build /app/target/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar /run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar"]
