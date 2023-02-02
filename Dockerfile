FROM continuumio/anaconda3

RUN apt-get update && \
    apt-get install -y fonts-takao-gothic graphviz
ENV TZ=Asia/Tokyo
ENV TERM xterm
RUN apt -y install nodejs npm

RUN pip install --upgrade pip && \
    pip install japanize_matplotlib &&\
    pip install graphviz pydotplus

RUN conda install -c conda-forge mamba

RUN mamba install pandas-profiling &&\
    mamba install scikit-learn && \
    mamba install -c conda-forge xgboost && \
    mamba install -c conda-forge lightgbm && \
    mamba install jupyter -y --quiet && \
    mamba install -c conda-forge jupyterlab jupyterlab-git && \
    mkdir -p /notebooks

WORKDIR /notebooks