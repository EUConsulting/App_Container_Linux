#!/bin/bash

echo "PAServer Password: Marta1234"
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --platform linux/amd64 -it -e PA_SERVER_PASSWORD=Marta1234 -p 64211:64211 -p 8082:8082 -p 8090:8090 -p 8091:8091 -p 8092:8092 -p 8093:8093 -p 8094:8094 -p 8095:8095 -p 8096:8096 -p 8097:8097 -p 8098:8098 -p 8099:8099 -p 8100:8100 --name sviluppo_eugreensea.consulting_radserver_12_1 -v data-volume:/usr/volume_condiviso radstudio/paserver:latest
