FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Test whether Render can resolve the Aiven hostname
RUN getent hosts wildlifedb-ganeshkshassan-8c20.a.aivencloud.com || true

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/Wild_Tour.war /usr/local/tomcat/webapps/ROOT.war

# Disable Tomcat shutdown port
RUN sed -i 's/<Server port="8005" shutdown="SHUTDOWN">/<Server port="-1" shutdown="SHUTDOWN">/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]