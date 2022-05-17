# Pull l'image ubuntu
FROM ubuntu

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

#Installer le package coturn
RUN apt-get update && apt-get install -y coturn && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Définir des variables d'environnement
ENV TURN_PORT 3478
ENV TURN_PORT_START 10000
ENV TURN_PORT_END 20000
ENV TURN_SECRET mysecret
ENV TURN_SERVER_NAME coturn
ENV TURN_REALM recog.server

#Copier les fichiers
COPY . /src

# Install app dependencies
RUN cd /src; npm install


#Modifier permissions du script shell
RUN chmod +x start_coturn.sh

#Lancer le script
CMD ["./start_coturn.sh"]