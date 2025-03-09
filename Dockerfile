FROM openjdk:17-jdk-slim
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN apt-get update && apt-get install -y maven
RUN mvn dependency:go-offline
CMD ["mvn", "test", "-Dkarate.env=$karate.env"]

# To run tests using Maven in Docker, use the following command:
# docker run -it --rm -v "$(pwd)":/src -w /src -v "$HOME/.m2":/root/.m2 maven:3-amazoncorretto-17 mvn clean test