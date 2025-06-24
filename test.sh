#!/bin/bash

echo " Waiting for services to become healthy..."
sleep 10  # Allow services time to boot

echo -e "\n Testing /service1/ping:"
curl -s http://localhost:8080/service_1/ping || echo "❌ service1 failed"

echo -e "\n Testing /service2/hello:"
curl -s http://localhost:8080/service_2/hello || echo "❌ service2 failed"
