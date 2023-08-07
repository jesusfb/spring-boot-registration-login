FROM maven:3.9 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM amazoncorretto:17-alpine
MAINTAINER LeninQuintero
COPY --from=builder /app/target/SpringBootRegistrationLogin-1.0.jar /usr/local/lib/SpringBootRegistrationLogin.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/SpringBootRegistrationLogin.jar"]
