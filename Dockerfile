# Docker for Convex Testnet

##################################
# Clone stage

FROM maven:latest AS clone

# Cache-bust: change this value to force a fresh clone on rebuild
ARG CACHEBUST=1

WORKDIR /testnet
RUN git clone --depth 1 --branch develop https://github.com/Convex-Dev/convex.git .

##################################
# Build stage

FROM maven:latest AS build

COPY --from=clone /testnet /testnet

WORKDIR /testnet
RUN --mount=type=cache,target=/root/.m2 \
    mvn clean install -DskipTests

##################################
# Run stage

FROM eclipse-temurin:latest AS run

WORKDIR /convex

COPY --from=build /testnet/convex-integration/target/convex.jar /convex/convex.jar

EXPOSE 7860

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD java -jar /convex/convex.jar status --api-port=7860 || exit 1

ENTRYPOINT ["java", "-jar", "/convex/convex.jar"]
CMD ["local", "start", "--api-port=7860"]
