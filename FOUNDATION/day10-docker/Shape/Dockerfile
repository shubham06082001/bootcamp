FROM openjdk:8

WORKDIR /app

COPY . /app/

RUN javac Shape.java

ENTRYPOINT ["java", "Shape"]