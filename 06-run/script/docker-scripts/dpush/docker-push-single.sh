# docker login -uadmin -padmin $server

echo ""
echo "dpush -> Usage: dpush <server> <image>"

server=$1   #"192.168.1.172:9005"
image=$2    #"google/cloud-sdk:216.0.0"

echo "dpush -> pull: $image => push: $server/$image"
echo ""

# 推送指定镜像到自建私服 
docker tag $image $server/$image && \
    docker push $server/$image 


# pull from =》从自建私服拉取指定镜像到本地，并修改为官方tag
# docker pull $server/$image
# docker tag $server/$image $image
# echo "run ==> docker image ls | grep $image"
