FROM eclipse-temurin:8-jre-alpine
VOLUME /tmp
ADD target/devOpsDemo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]

EXPOSE 2222
