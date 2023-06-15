#!/bin/bash
cd docker/tedd_caen_hvps/
#pwd
docker-compose ps 
echo "==================================================================================================================================================================================="
echo "Now you are listennig the message  --> docker exec tedd_caen_hvps-mosquitto-1 mosquitto_sub -t /# -v"

echo "To send the message via mqtt --> open another terminal and execute this command : docker exec tedd_caen_hvps-mosquitto-1 mosquitto_pub -t /SY4527/status/1 -m chan_num 0"
echo "==================================================================================================================================================================================="

docker exec tedd_caen_hvps-mosquitto-1 mosquitto_sub -t /# -v

echo "==================================================================================================================================================================================="
