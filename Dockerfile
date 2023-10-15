
FROM openjdk:19-alpine3.16

ENV PETCLINIC_VERSION 5.3.22

RUN apk update && \
    apk add tar \
            wget

RUN wget -O petclinic.tar.gz "https://github.com/spring-petclinic/spring-framework-petclinic/archive/refs/tags/v${PETCLINIC_VERSION}.tar.gz" -q \
    && tar -xzf petclinic.tar.gz \
    && rm -f petclinic.tar.gz

RUN apk del tar \
            wget

EXPOSE 8080
WORKDIR /spring-framework-petclinic-${PETCLINIC_VERSION}
ENTRYPOINT ["./mvnw", "jetty:run-war"]
