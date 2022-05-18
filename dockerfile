# Pull l'image ubuntu
FROM ubuntu:18.04

# Mise à jour des packages ubuntu
RUN apt-get update 
RUN apt-get upgrade -y

# installer packages essentiels
RUN apt-get install build-essential checkinstall zlib1g-dev -y

# installer le package OpenSSL
RUN apt-get -y install openssl

# installer le package coturn
RUN apt-get install -y coturn && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Définir des variables d'environnement
ENV TURN_PORT 3478
ENV TURN_PORT_START 10000
ENV TURN_PORT_END 20000
ENV TURN_SECRET mysecret
ENV TURN_SERVER_NAME coturn
ENV TURN_REALM recog.server

# Copier les fichiers
COPY . .

# Modifier permissions du script shell
RUN chmod +x start_coturn.sh

EXPOSE 3478

# Lancer le script
CMD ["./start_coturn.sh"]