FROM tomcat:8.5.82-jre8-openjdk-slim-buster
ADD target/spring-boot-maven-plugin.jar spring-boot-maven-plugin.jar
EXPOSE 8081
ENTRYPORT ["-java","-jar","spring-boot-maven-plugin.jar"]