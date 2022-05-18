# Recog Coturn Server

Dockerfile for an ubuntu image that launches a TURN/STUN server

## Building the image

docker build -t recog-coturn .

## Running the container

docker run --name my-coturn -t recog-coturn

## Testing the coturn server

- The container console outputs the username and password. Copy them.
- Get the container IP adress using :
  docker inspect my-coturn

- Test the server by adding a new ICE server in:

https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/

STUN or TURN URI format: turn:<IP-ADDRESS>:<PORT>
