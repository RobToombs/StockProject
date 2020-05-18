FROM openjdk:8-jre-alpine
RUN addgroup -S toombs && adduser -S toombs -G toombs
USER toombs:toombs
ARG DEPENDENCY=build/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
EXPOSE 8080
ENTRYPOINT ["java","-cp","app:app/lib/*","com.toombs.backend.ApplicationKt"]