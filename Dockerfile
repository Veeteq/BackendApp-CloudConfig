#Start with a base image containing Java runtime
FROM openjdk:17-slim as build

#Declare user and group
RUN addgroup --system spring && adduser --system --group spring

#Run the application as a non-root user.
USER spring:spring

#Add the application jar to the container
COPY target/config-server.jar app.jar

ENV AUTH0_AUDIENCE $AUTH0_AUDIENCE
ENV AUTH0_DOMAIIN $AUTH0_DOMAIN

#Execute the application
ENTRYPOINT ["java","-jar","/app.jar"]
