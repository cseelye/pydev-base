FROM cseelye/ubuntu-base

RUN apt-get update && \
    apt-get install --yes \
        ack \
        build-essential \
        curl \
        git \
        jq \
        libssl-dev \
        make \
        python3-pip \
    && apt-get autoremove --yes && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip \
        --disable-pip-version-check \
        --no-cache-dir \
        install \
        --upgrade \
            pip

COPY requirements.txt /tmp/requirements.txt
RUN pip \
        --no-cache-dir \
        install \
        --no-compile \
        --force-reinstall \
        --requirement /tmp/requirements.txt
