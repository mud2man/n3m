#!/bin/bash

docker run -it --name n3m -v "$(pwd)"/git:/home/n3m/git -h linux-n3m -p 5000:5000 n3m:v1
