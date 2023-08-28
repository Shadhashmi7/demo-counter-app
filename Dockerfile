FROM maven as build
WORKDIR /app
COPY . . 
RUN mvn install 

FROM openjdk:11.0
COPY --from=build /app/target/Uber.jar /app/
EXPOSE 8081
CMD [ "java","-jar", "Uber.jar"]