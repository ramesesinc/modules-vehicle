docker exec vehicle-server sh -c "cd /apps && ./stop.sh"
read -p "Press [Enter] to continue...>"
docker rm -f vehicle-server