# Docker for Convex 

##################################
# Clone stage

# Based on Eclipse temurin JDK, noble Ubuntu for git etc
FROM maven:3-eclipse-temurin-25-noble AS clone

WORKDIR /testnet
RUN git clone --depth 1 --branch develop https://github.com/Convex-Dev/convex.git .

##################################
# Build stage

FROM maven:eclipse-temurin AS build

COPY --from=clone /testnet /testnet


WORKDIR /testnet
RUN --mount=type=cache,target=~/.m2 \
    mvn clean install

##################################
# Run stage

# We want a 25 JRE for runtime, slim image with alpine
FROM eclipse-temurin:25-jre-alpine AS run

WORKDIR /convex

COPY --from=build /testnet/convex-integration/target/convex.jar /convex/convex.jar

EXPOSE 7860

ENTRYPOINT ["java", "-jar", "/convex/convex.jar"]
CMD ["local", "start", "--api-port=7860"]