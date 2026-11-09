FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN mkdir -p /app/data

COPY family-tracker-server.jar /app/server.jar

EXPOSE 8080

ENV PORT=8080
ENV ADMIN_USER=admin
ENV ADMIN_PASSWORD=admin123
ENV DB_PATH=/app/data/tracker.db

CMD ["java", "-Xms128m", "-Xmx512m", "-jar", "/app/server.jar"]
