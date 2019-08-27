#!/bin/bash
%{ if mount ~}
mkfs -t ext4 /dev/sdh
mkdir ${volume_path}
mount /dev/sdh ${volume_path}
echo /dev/sdh ${volume_path} ext4 defaults,nofail 0 0 >> /etc/fstab
%{ endif ~}

cat > /etc/ecs/ecs.config <<EOS
ECS_CLUSTER=${cluster}
ECS_ENABLE_CONTAINER_METADATA=true
EOS

pip3 install awscli --upgrade --user
aws configure set default.region ${region}
aws configure set default.format json

cat > $HOME/.aws/credentials <<EOS
[default]
aws_access_key_id = ${aws_access_key_id}
aws_secret_access_key = ${aws_secret_access_key}
EOS
