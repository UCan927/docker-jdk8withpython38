FROM openjdk:8

RUN apt update && \
    apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev \
    wget libbz2-dev && \
    wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz && \
    tar -xf Python-3.8.0.tgz && cd Python-3.8.0 && \
    ./configure --enable-optimizations && \
    make -j 8 && make altinstall && \
    cd .. && rm -rf ./Python-3.8.0* && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.8 get-pip.py && rm -rf ./get-pip.py && \
    pip3 install numpy scipy matplotlib && \
    rm -f /usr/bin/python && ln -s /usr/local/bin/python3.8 /usr/bin/python