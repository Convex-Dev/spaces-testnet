# Docker for Convex 

# Build stage
FROM maven:eclipse-temurin AS build

WORKDIR /testnet

RUN git clone --depth 1 --branch develop https://github.com/Convex-Dev/convex.git .

RUN mvn clean install

# Run stage
FROM eclipse-temurin:25-jre-alpine AS run

WORKDIR /convex

COPY --from=build /testnet/convex-integration/target/convex.jar /convex/convex.jar

EXPOSE 7680

ENTRYPOINT ["java", "-jar", "/convex/convex.jar"]
CMD ["local", "start", "--api-port=7680"]