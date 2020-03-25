# Mount file system

sudo yum install nfs-utils

sudo mkdir -p /shared

sudo mount $1:/shared /shared

df -h /shared