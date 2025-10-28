# Use official Maven + JDK image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use lightweight JRE image to run the app
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Expose the port for Render
EXPOSE 8080
ENV PORT=8080

# Run the jar
CMD ["java", "-jar", "app.jar"]
