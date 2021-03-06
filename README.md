# quarkus - keycloak - CORS Problem

This repo demonstrates a problem with CORS when using Quarkus and Keycloak

# Keycloak Setup

* `docker run --name keycloak-server -p 8081:8080 -e KEYCLOAK_USER=keycloak -e KEYCLOAK_PASSWORD=keycloak -e DB_VENDOR=h2 jboss/keycloak`
* Import the provided [realm-export.json](realm-export.json) in your local keycloak server or setup a realm with
  * Name: keycloak-cors
  * Client: quarkus
  * Valid Redirect URIs: 
    * http://localhost:8080
    * \*
  * Web Origins:
    * http://localhost:8080
    * \+
* Create a user by running the create-user.sh script or manually create a user
  * Username: test
  * Password: test

# How to run

`./mvnw -DAUTH_URL=https://localhost:8081/auth/realms/keycloak-cors compile quarkus:dev`

# How to reproduce

* Open a Browser and open http://localhost:8080
* Open Developer-Tools
* Hit Request-Button. The console should log something like this:
* Wait 1 Minute (or at least the value you set for Access Token Lifespan)
* Hit Request-Button
* See the CORS-Error in your Console-View

![Browser Console](https://github.com/tomsontom/keycloak-cors/raw/master/browser-console-log.png "Browser Console Log")

# Environments

* Server: Quarkus 1.5.2 and SNAPSHOT
* Keycloak: 10.0.2
* Client: Reproduced in Firefox 77.0.1 and Chrome 83.0.4103.106
