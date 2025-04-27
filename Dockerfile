# --- Étape 1 : compilation avec Maven ---
FROM maven:3.9.0-eclipse-temurin-21 AS builder
WORKDIR /app

# Copier uniquement le pom pour profiter du cache Docker
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copier le code source et compiler (skip des tests pour gagner du temps)
COPY src ./src
RUN mvn clean package -DskipTests -B

# --- Étape 2 : image d’exécution allégée ---
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copier le JAR généré depuis l'étape builder
COPY --from=builder /app/target/*.jar app.jar

# Exposer le port sur lequel votre appli écoute (à adapter)
EXPOSE 8080

# Commande de démarrage
ENTRYPOINT ["java", "-jar", "app.jar"]
