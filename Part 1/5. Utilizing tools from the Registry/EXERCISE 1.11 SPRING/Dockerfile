FROM openjdk:8

# setup working directory
WORKDIR /usr/src

# copy all files into the image
COPY . .

# the mvnw script had Windows line endings (\r\n called CRLF).
RUN apt-get update && apt-get install -y dos2unix && find . -type f -print0 | xargs -0 dos2unix 

# build package
RUN ./mvnw package

# expose port
EXPOSE 8080

# set CMD
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
