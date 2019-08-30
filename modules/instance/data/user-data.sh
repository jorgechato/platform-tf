#!/bin/bash

$(sudo yum -y install awscli wget)

%{ if mount ~}
#############
# EBS VOLUME
#
# note: /dev/sdh => /dev/xvdh
# see: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html
#############

# wait for EBS volume to attach
EC2_INSTANCE_ID=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || die \"wget instance-id has failed: $?\")
DATA_STATE="unknown"
until [ $DATA_STATE == "attached" ]; do
    DATA_STATE=$(aws ec2 describe-volumes \
        --region ${region} \
        --filters \
        Name=attachment.instance-id,Values=$EC2_INSTANCE_ID \
        Name=attachment.device,Values=/dev/sdh \
        --query "Volumes[].Attachments[].State" \
        --output text)
    echo 'waiting for volume...'
    sleep 5
done
echo 'EBS volume attached!'

mkdir ${volume_path}
mount /dev/sdh ${volume_path}
echo /dev/sdh ${volume_path} ext4 defaults,nofail 0 0 >> /etc/fstab

$(sudo rm -rf /data/nginx/certs/dhparams.pem)
%{ endif ~}

cat > /etc/ecs/ecs.config <<EOS
ECS_CLUSTER=${cluster}
ECS_ENABLE_CONTAINER_METADATA=true
EOS

cat > /etc/environment <<EOS
LANG=en_US.utf-8
LC_ALL=en_US.utf-8
EOS

mkdir -p /etc/config/nginx
aws s3 sync --region ${region} s3://${bucket}/nginx /etc/config/nginx
