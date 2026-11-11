FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN mkdir -p /app/data

COPY family-tracker-server.jar /app/server.jar

EXPOSE 8080

ENV PORT=8080
ENV ADMIN_USER=admin
ENV DB_PATH=/app/data/tracker.db
# ADMIN_PASSWORD: đặt trong Render > Environment (không ghi vào file này vì repo GitHub đang để Public).

# Gói Starter có 512MB RAM -> giới hạn heap nhỏ hơn để không bị Render kill vì tràn bộ nhớ.
CMD ["java", "-Xms96m", "-Xmx300m", "-XX:+UseSerialGC", "-jar", "/app/server.jar"]
