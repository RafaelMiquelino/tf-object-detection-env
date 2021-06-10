# tf-object-detection-env
- To build the image: `docker build -t tensorflow:2.5.0-gpu-jupyter-object-detection-api .`  
- To start with a shelli: `docker run --gpus all -it --rm -v $PWD:/content -u $(id -u):$(id -g) tensorflow:2.5.0-gpu-jupyter-object-detection-api /bin/bash`  
- To start a notebook: `docker run --gpus all -it --rm -p 8888:8888 -v $PWD:/content -u $(id -u):$(id -g) tensorflow:2.5.0-gpu-jupyter-object-detection-api notebook`  
- To start tensorboard: `docker run --gpus all -it --rm -p 6006:6006 -v $PWD:/content -u $(id -u):$(id -g) tensorflow:2.5.0-gpu-jupyter-object-detection-api tensorboard --logdir=/contentodel/faster_rcnn_resnet101_v1_1024x1024_coco17_tpu-8/logs/train --bind_all`  
- To train a model from command line: `docker run --gpus all -it --rm -v $PWD:/content -u $(id -u):$(id -g) -e "MODEL_DIR=model/faster_rcnn_resnet101_v1_1024x1024_coco17_tpu-8" tensorflow:2.5.0-gpu-jupyter-object-detection-api train_model`
- To continuously eval a model from command line: `docker run --gpus all -it --rm -v $PWD:/content -u $(id -u):$(id -g) -e "MODEL_DIR=model/faster_rcnn_resnet101_v1_1024x1024_coco17_tpu-8" tensorflow:2.5.0-gpu-jupyter-object-detection-api eval_model

**Execute all commands always from the project folder (except to build the new image version)**
