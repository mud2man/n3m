#!/bin/bash

docker run -it --name n3m -v `pwd`/git:/home/n3m/git -h linux-n3m -p 80:80 -p 443:443 n3m:v1
