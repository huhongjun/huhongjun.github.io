## post init

source /home/axe/.bashrc

PDOCKER=/home/axe/nfs/docker/workshop/compose
cd $PDOCKER && docker-compose up -d registry
dpull portainer/portainer
dpull sonatype/nexus3:3.28.1
cd $PDOCKER && docker-compose up -d

