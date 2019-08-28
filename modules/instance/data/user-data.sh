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

$(sudo yum -y install awscli)

mkdir -p /etc/config/nginx
AWS_DEFAULT_REGION=${region}\
    AWS_ACCESS_KEY_ID=${aws_access_key_id} \
    AWS_SECRET_ACCESS_KEY=${aws_secret_access_key} \
    aws s3 sync s3://${bucket}/nginx /etc/config/nginx
