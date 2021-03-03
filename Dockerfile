FROM maven:3.6.0-jdk-11-slim as BUILD
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM tomcat:9.0.43-jdk8-corretto
COPY --from=BUILD /home/app/target/notes.war /usr/local/tomcat/webapps/notes.war
EXPOSE 8080