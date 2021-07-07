#
# docker push all image to registry repostory
#
# 目前只能处理docker.io,如果镜像有域名怎么办？ 参考azk8s
#

# sudo -i

dry=$1

SERVER="docker.lan:9005"     #"192.168.1.172:9005"
docker login -uadmin -padmin $SERVER

docker images| sed '1d' | awk '{if ($1 !~ /^(192|docker.lan|nexus.lan|hub-mirror.c.163.com|public.ecr.aws|n4tltdbj.mirror.aliyuncs.com|registry.cn-hangzhou.aliyuncs.com|<none>)/) print NR " " $1 " " $2 }' |
    while read NR REPOSITORY TAG ; do
        if [ -z $dry ]; then
            echo ""
            echo "$NR -> tag/push: $SERVER/$REPOSITORY:$TAG"
            echo ""
            docker tag $REPOSITORY:$TAG $SERVER/$REPOSITORY:$TAG
            docker push $SERVER/$REPOSITORY:$TAG
            # docker image rm $SERVER/$REPOSITORY:$TAG
        else
            echo "dry run: $NR, tag/push: $SERVER/$REPOSITORY:$TAG"
        fi
    done

# sudo docker images| sed '1d' | awk '{if ($1 ~ /^(192)/) print $1 " " $2 }'
# docker images| sed '1d' | awk '{print NR " " $1 " " $2 }'