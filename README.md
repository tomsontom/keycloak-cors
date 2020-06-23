# quarkus - keycloak - CORS Problem

This repo demonstrates a problem with CORS when using Quarkus and Keycloak

# Keycloak Setup

* `docker run --name keycloak-server -p 8081:8080 -e KEYCLOAK_USER=keycloak -e KEYCLOAK_PASSWORD=keycloak -e DB_VENDOR=h2 jboss/keycloak`
* Import the provided `realm-export.json` in your local keycloak server
* Open Client > Quarkus > Credentials and copy the "Secret" to replace `aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa` from below

# How to run

`./mvnw -DAUTH_URL=https://localhost:8081/auth/realms/keycloak-cors -DAUTH_CREDENTIALS=aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa compile quarkus:dev`

# How to reproduce

* Open a Browser and open http://localhost:8080
* Open Developer-Tools
* Hit Request-Button
* Wait 1 Minute (or at least the value you set for Access Token Lifespan)
* Hit Request-Button
* See the CORS-Error in your Console-View 

Reproduced in Firefox 77.0.1 and Chrome 83.0.4103.106
