#img="nvcr.io/nvidia/pytorch:20.09-py3" 
#img="pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime"
#img="pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel"
img="nvcr.io/nvidia/pytorch:21.03-py3" 

docker run --gpus all  --privileged=true   --workdir /git --name "sscf"  -e DISPLAY --ipc=host -d --rm  -p 6364:8889 \
-v /home/ggzhang/Self-Supervised-Contrastive-Forecsating:/git/Self-Supervised-Contrastive-Forecsating \
-v /home/ggzhang/datasets:/git/datasets \
$img sleep infinity

docker exec -it sscf /bin/bash  

#docker images  |grep "pytorch"  |grep "21."

#docker stop  sscf 

