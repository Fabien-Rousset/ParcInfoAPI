# Simple Dockerfile to package your existing JAR

FROM openjdk:21-slim

# Créer et se placer dans le répertoire de l’application
WORKDIR /app

# Copier votre JAR pré-construit (depuis `target/`) et le renommer en app.jar
COPY target/*.jar app.jar

# Exposer le port utilisé par votre application (ajustez si nécessaire)
EXPOSE 8080

# Commande pour démarrer l’application
ENTRYPOINT ["java", "-jar", "app.jar"]
