# quarkus - keycloak - CORS Problem

This repo demonstrates a problem with CORS when using Quarkus and Keycloak

# How to run

./mvnw -DAUTH_URL=https://my-keycloak/auth/realms/keycloak-cors -DAUTH_CREDENTIALS=aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa compile quarkus:dev

# Keycloak Setup

* Create a realm named "keycloak-cors"
* In Realm Settings > Tokens: keep the defaults (Access Token Lifespan: 5 Mins) 
* Create a client named quarkus
* Generate a secrate and replace "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa" from above with that

# How to reproduce

* Open a Browser and open http://localhost:808
* Open Developer-Tools
* Hit Request-Button
* Wait 5 Minutes (or at least the value you set for Access Token Lifespan)
* Hit Request-Button
* See the CORS-Error in your Console-View 