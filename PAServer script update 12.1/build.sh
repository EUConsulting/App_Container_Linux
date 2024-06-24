#!/bin/bash

docker build . \
        --build-arg password=Marta1234 \
        --platform linux/amd64 \
	--tag=radstudio/paserver:latest \
	--tag=radstudio/paserver:athens \
	--tag=radstudio/paserver:12.1.1 \
