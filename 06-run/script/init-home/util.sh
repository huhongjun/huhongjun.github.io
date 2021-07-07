
source ~/.profile

du2

echo $(date +%Y%m%d)

dir du1-$(date +%Y%m%d).txt|cat du1-$(date +%Y%m%d).txt

ssh ds215j ls /volume2
ssh ds215j du -h --max-depth=1 /volume2/NFS-ds3617xs/docker-compose
ssh ds215j du -h --max-depth=1 /volume2/NFS-ds3617xs/docker-volume



