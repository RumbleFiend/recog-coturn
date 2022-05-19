#!/bin/bash

echo "Generating secret & username ......................"

secret=mysecret && \
time=$(date +%s) && \
expiry=8400 && \
username=$(( $time + $expiry )) &&\
echo username:$username && \
echo password : $(echo -n $username | openssl dgst -binary -sha1 -hmac $secret | openssl base64)

echo "Starting TURN/STUN server............."

turnserver -a -v -L 0.0.0.0 --server-name "${TURN_SERVER_NAME}" --static-auth-secret="${TURN_SECRET}" --realm=${TURN_REALM}  -p ${TURN_PORT} --min-port ${TURN_PORT_START} --max-port ${TURN_PORT_END} ${TURN_EXTRA}

<<<<<<< HEAD
echo "Starting Nodejs Server............."
=======
nodejs -v

>>>>>>> 395ee706848925c29d32dcf84bcd53e453632b1c
node index.js