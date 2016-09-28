#!/bin/bash

docker run -it --name n3m -v `pwd`/git:/home/n3m/git -h linux-n3m -p 3000:3000 -p 3001:3001 -p 8000:8000 -p 8080:8080 n3m:v1
