#!/usr/bin/env bash

set -e

PW=$1

(umask 077; mkdir secrets)
(umask 177; touch secrets/acme.json)

(umask 177; htpasswd -bc secrets/htpasswd admin "$PW")

cp .env.example .env

docker-compose pull
