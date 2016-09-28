# n3m
The repo for the n3m team app. It is awesome!

To get started some prerequisites should be installed. To begin make sure you have python and that it's using version 2.7.

### Local Install
1. Pip (https://pip.pypa.io/en/latest/installing.html)
  1. wget https://bootstrap.pypa.io/get-pip.py
  2. python get-pip.py
2. PostgreSQL (http://www.postgresql.org/download/)
3. NPM (https://docs.npmjs.com/getting-started/installing-node)


### Alternatively Use Docker
You can use the docker file included in this repo which will create a working development environment for you. To do so perform these steps. The initial docker build will take a while:

1. Install Docker (https://www.docker.com/products/docker)
2. execute the following commands from the repository root:
```
docker build -t n3m:v1 n3m_docker 
sh run_docker.sh
```
3. This will bring you to a command prompt with everything installed, the database daemon started, the app ready to start running. 

The next thing you need to do is create an empty postgres database called n3m, create a database user n3m with full priveledges. Then modify the .env file to point at this database. e.g. postgres:///n3m

After that run 
```
sh run.sh
```


You should then be able to access the web interface of the app from your local dev machine at http://localhost:5000. Note that you cannot have a running process on your host machine at port 5000.. 
