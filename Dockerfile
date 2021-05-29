FROM tensorflow/tensorflow:2.5.0-gpu-jupyter
RUN set -ex && \
    apt-get update && \
    apt-get install -y \
        wget \
	git \
	protobuf-compiler
COPY requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install -r requirements.txt
RUN pip install jupyter_http_over_ws
RUN jupyter serverextension enable --py jupyter_http_over_ws
RUN git clone --depth 1 https://github.com/tensorflow/models && \
    cd models/research/ && \
    protoc object_detection/protos/*.proto --python_out=. && \
    cp object_detection/packages/tf2/setup.py . && \
    python -m pip install .
COPY ./notebook /bin/notebook
COPY ./train_model /bin/train_model
COPY ./eval_model /bin/eval_model
RUN chmod a+x /bin/notebook && \
    chmod a+x /bin/train_model && \
    chmod a+x /bin/eval_model
ENV OB_API_DIR=/tmp/models
WORKDIR /content
