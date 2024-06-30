FROM openjdk:17 AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw clean package

FROM openjdk:17
COPY --from=build /app/target/colvir-docker-demo*.jar /usr/local/lib/colvir-docker-demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/colvir-docker-demo.jar"]