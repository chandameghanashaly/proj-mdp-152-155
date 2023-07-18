# build maven image using docker
FROM maven:3-adoptopenjdk-11 as mvn_build
WORKDIR /app
COPY . .
RUN mvn clean package
# deploy war file to tomcat from mvn_build
FROM tomcat:8.0
COPY --from=mvn_build /app/target/*.war /usr/local/tomcat/webapps

