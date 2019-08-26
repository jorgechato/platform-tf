#!/bin/bash
mkfs -t ext4 /dev/sdh
mkdir /data
mount /dev/sdh /data
echo /dev/sdh /data ext4 defaults,nofail 0 0 >> /etc/fstab

cat > /etc/ecs/ecs.config <<EOS
ECS_CLUSTER=${cluster}
ECS_ENABLE_CONTAINER_METADATA=true
EOS
