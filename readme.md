# DevOps Internship Assignment — Dockerized Flask Microservices with Nginx Reverse Proxy

## Project Overview

This project demonstrates how to containerize simple  golang and  Python Flask microservices using Docker and manage them together with Docker Compose.

 An Nginx container is used as a reverse proxy to route incoming requests to the appropriate microservice based on the URL path prefix.

The setup allows running all components together with a single command, supporting health checks and logging.



## 🔧 Setup Instructions

1. Cloning the repository 

git clone https://github.com/Nishanth2705/Dpd_dev_assign.git

cd Dpd_dev_assign


Dpd_dev_assign/
├── service_1/ # Go Lang microservice 1  
│   ├── main.go # application code for service 1  
│   └── Dockerfile # Dockerfile to build service 1 image  
│  
├── service_2/ # Flask microservice 2 (similar to service 1)  
│   ├── app.py   # source code   
│   ├── pyproject.toml   
│   ├── uv.lock  
│   ├── Dockerfile_advanced # build the image as gunicorn  
│   └── Dockerfile # Dockerfile to build service 2 imagage as simple .py   
│  
├── nginx/ # Nginx reverse proxy container files  
│   ├── nginx.conf # Nginx configuration for routing and logging  
│   └── Dockerfile # Dockerfile to build nginx image  
│  
├── docker-compose.yml # Compose file to run all services together  
├── test.sh # script to check services are running   
└── README.md # This documentation file

2.To run the project 

docker compose up --build -d # run in detached mode to check logs inside server and to execute any other command in same session or shell
 
3. How routing works 

The Nginx reverse proxy listens on port 8080 and routes requests based on URL path:

/service1 → forwards to Flask app in service_1 (port 8001)

/service2 → forwards to Flask app in service_2 (port 8002)

Nginx also logs incoming requests with timestamp and requested path.

ex.

      24/Jun/2025:09:38:41 +0000 - GET /service_1/ping HTTP/1.1
      24/Jun/2025:09:38:50 +0000 - GET /service_1/hello HTTP/1.1
      24/Jun/2025:09:38:53 +0000 - GET /service_2/hello HTTP/1.1
      24/Jun/2025:09:38:57 +0000 - GET /service_2/ping HTTP/1.1
	  
4. test script 

  this script checks whether the services are running or not there is a delay of 10 secs which give time to container to come up
