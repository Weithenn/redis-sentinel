# Buildup Redis Sentinel provides HA (High Availability) for Redis
In simple terms, hope to package and encapsulate the Redis Sentinel high availability mechanism through Containerzation and then set up the Redis Sentinel HA mechanism very quickly in the Docker Swarm management environment.


# Lab Environment
* Host OS： `CentOS 7.4`
* Docker version： `17.11.0-ce`
* Redis Container Base Image： `redis:4.0.6-alpine`
* Redis Monitor Tool： `Redis-Stat`
* GUI Management Tool： `Portainer`


# How to usage
1. Buildup `Docker Swarm` environment.
2. Download this buildup files `git clone https://github.com/Weithenn/redis-sentinel`
3. Execute `build.sh` to build the Redis Sentinel high availability mechanism.


## Verify docker swarm environment
This article lab environment as below:

| Docker Host | IP Address | Docker Swarm Role |
| :------------ |:------------|:------------|
| swarm01.weithenn.org | 10.10.75.71 | Manager and Worker |
| swarm02.weithenn.org | 10.10.75.72 | Manager and Worker |
| swarm03.weithenn.org | 10.10.75.73 | Manager and Worker |

use `docker node ls` command verify docker swarm environment.
![Docker Swarm](https://4.bp.blogspot.com/-PBmfGBvTRyg/Wi4f6QsqnnI/AAAAAAAATRA/2ZqY83x-nXUWJJYSj2YW7-H66d-nSuo2QCKgBGAs/s1600/github_redis-sentinel01.png "Docker Swarm environment")


## Download this buildup files
use `git clone https://github.com/Weithenn/redis-sentinel` command download this buildup files.
![Download](https://2.bp.blogspot.com/-kiX_UgFqfwM/Wi4f6Qf_SjI/AAAAAAAATRA/WzQo224l5U4-ZATeBJm-OBMAxBkPS67ggCKgBGAs/s1600/github_redis-sentinel02.png "Download this buildup files")


## Buildup / Verify Redis Sentinel provides HA (High Availability) for Redis
Execute `build.sh` to build the Redis Sentinel high availability mechanism. You will see the establishment of a Redis Master, two Redis Slave, three Redis Sentinel, a Redis-Stat, a Portainer...etc eight containers, and confirm the Redis Sentinel high availability mechanism is complete.

![Buildup Redis Sentinel](https://1.bp.blogspot.com/-7pil0SefmAw/Wi4f6bV7UdI/AAAAAAAATRA/TmwH5Uvh7DEtusLM46wkiSkhwD0KtYXnQCKgBGAs/s1600/github_redis-sentinel03.png "Buildup Redis Sentinel")

Open the browser link to one of the `Docker Swarm Port 80`, you will see Redis-Stat monitor screen.
![Redis-Stat Screen](https://4.bp.blogspot.com/-NNHPSHlFegQ/Wi4f6UX5REI/AAAAAAAATRA/E4hEdBEyQ9E72K1T1Gw21Zp0Ro50xDXOgCKgBGAs/s1600/github_redis-sentinel04.png "Redis-Stat Screen")

Open the browser link to one of the `Docker Swarm Port 9000`, you will see Portainer GUI tool screen.
![Portainer](https://2.bp.blogspot.com/-_W3jiu7spDA/Wi4f6blE52I/AAAAAAAATRA/G9qyqs8TBB4ClazY4p2OS9IvtBU0H4yfgCKgBGAs/s1600/github_redis-sentinel05.png "Portainer")

## Destroy lab environment
After you have completed the test, you can use the `docker stack rm redis` command to destroy the lab environment.
![Destroy lab environment](https://3.bp.blogspot.com/-TpKVIzZD4Tg/Wi4f6S3mVhI/AAAAAAAATRA/TahxBQnDZ2QDcoTb9rsp5MGInnPE-MBuQCKgBGAs/s1600/github_redis-sentinel06.png "Destroy lab environment")


# More Details
For more information on this, please refer to [實戰 - Redis Sentinel 高可用性機制容器化 ~ 不自量力 の Weithenn](http://www.weithenn.org/2017/12/redis-sentinel-ha-containerzation.html)。
