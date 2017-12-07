#!/bin/sh
#$Id: build.sh v0.1, 2017/12/08 Weithenn Wang (weithenn@weithenn.org) Exp $
#Buildup Redis Sentinel provides HA(High Availability) for Redis

echo ------------------------------------------------
echo Deploy Redis [Master *1] Node
echo ------------------------------------------------
docker stack deploy -c 01-redis-master.yml redis
echo
echo
sleep 10

echo ------------------------------------------------
echo Deploy Redis [Slave *2] Nodes
echo ------------------------------------------------
docker stack deploy -c 02-redis-slave.yml redis
echo
echo
sleep 10

echo ------------------------------------------------
echo Deploy Redis [Sentinel *3] Nodes
echo ------------------------------------------------
docker stack deploy -c 03-redis-sentinel.yml redis
echo
echo
sleep 10

echo ------------------------------------------------
echo Deploy Redis-Stat Monitor Tool
echo ------------------------------------------------
docker stack deploy -c 04-redis-stat.yml redis
echo
echo
sleep 10

echo ------------------------------------------------
echo Deploy Portainer GUI Tool
echo ------------------------------------------------
docker stack deploy -c 05-portainer.yml redis
echo
echo
sleep 10

echo ------------------------------------------------------
echo Verify Docker Swarm Service for Redis Sentinel HA
echo ------------------------------------------------------
docker service ls
echo
echo
docker stack ps redis
echo
echo

echo ------------------------------------------------------
echo Verify Redis Master/Slave/Sentinel Status
echo ------------------------------------------------------
echo Redis Master IP address is:
redis-cli -p 26379 SENTINEL get-master-addr-by-name redis-ha
echo
echo
redis-cli -p 26379 info Sentinel
