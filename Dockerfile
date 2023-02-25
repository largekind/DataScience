FROM continuumio/anaconda3

RUN apt-get update && \
    apt-get install -y fonts-takao-gothic graphviz
ENV TZ=Asia/Tokyo
ENV TERM xterm
RUN apt -y install nodejs npm

# 必須のパッケージの導入
RUN pip install --upgrade pip && \
    pip install japanize_matplotlib &&\
    pip install graphviz pydotplus

RUN conda install pandas-profiling &&\
    conda install -c anaconda pandas-datareader &&\
    conda install scikit-learn && \
    conda install -c conda-forge xgboost && \
    conda install -c conda-forge lightgbm && \
    conda install jupyter -y --quiet && \
    conda install -c conda-forge jupyterlab jupyterlab-git jupyterlab_vim && \
    conda install -c conda-forge yfinance &&\
    mkdir -p /notebooks

# 補完機能の導入
RUN pip install lckr-jupyterlab-variableinspector && \
    pip install jupyterlab_tabnine && \
    pip install ipywidgets && \
    pip install jupyterlab-lsp && \
    pip install 'python-lsp-server[all]'

WORKDIR /notebooks