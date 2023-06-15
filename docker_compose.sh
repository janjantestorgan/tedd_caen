#!/bin/bash
cd docker/tedd_caen_hvps/
pwd

echo "run docker-compose : docker-compose up -d "

docker-compose up -d 

echo "========================================================================"
docker-compose ps

echo "==================================================================================================================================================================================="
echo "To run the caen container:  docker exec -it tedd_caen_hvps-caen_hvps-1 /bin/bash "

echo "To listen the message via mqtt --> open another terminal and execute this command : docker exec tedd_caen_hvps-mosquitto-1 mosquitto_sub -t /# -v"

echo "To send the message via mqtt --> open another terminal and execute this command : docker exec tedd_caen_hvps-mosquitto-1 mosquitto_pub -t /SY4527/status/1 -m chan_num 0"
echo "==================================================================================================================================================================================="