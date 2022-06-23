# Node.js image
FROM node:18

# Update and upgrade linux packages
RUN apt-get update 
RUN apt-get upgrade -y

# Install necessary packages for compiling and building
RUN apt-get install build-essential checkinstall zlib1g-dev gcc -y
RUN apt-get upgrade libstdc++6

# Install the openSSL package
RUN apt-get -y install openssl

# Install the coturn package
RUN apt-get install -y coturn && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define environment variables
ENV TURN_PORT 3478
ENV TURN_PORT_START 10000
ENV TURN_PORT_END 20000
ENV TURN_SECRET mysecret
ENV TURN_SERVER_NAME coturn
ENV TURN_REALM recog.server

# Copy source code
COPY . .

# Install node packages
RUN npm install

# Change script bash permissions
RUN chmod +x start_coturn.sh

# Expose ports
EXPOSE 3478 8080

# Execute the script
CMD [ "./", "start_coturn.sh" ]