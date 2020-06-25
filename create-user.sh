#!/bin/bash
# this script needs the following startparamas create_users.sh <username> <password> <base-server-adress eg.: http:/mykeycloak.com> <realm>

filename="./users.txt"
: ${1?Need a value for username}
: ${2?Need a value for password}
: ${3?Need a value for server address}
: ${4?Need a value for realm}
echo "username $1"
echo "password $2"
echo "address $3"
echo "realm $4"

bearer_token=$(curl $3/auth/realms/master/protocol/openid-connect/token -H 'Content-Type: application/x-www-form-urlencoded' -d "grant_type=password&username=$1&password=$2&client_id=admin-cli" | jq ".access_token")
bearer_token_without_quotes="${bearer_token%"}"
bearer_token_without_quotes="${bearer_token_without_quotes#"}"

while read line;
do
echo "Creating user with name $line and password $line"
curl -H "Authorization: bearer $bearer_token_without_quotes" -H "Content-Type: application/json" --data '{"username":"'"$line"'","enabled":true,"firstName":"'"$line"'","lastName":"'"$line"'","email":"'"$line"'@example.com","credentials":[{"type":"password","value":"'"$line"'"}]}' $3/auth/admin/realms/$4/users
done < $filename
