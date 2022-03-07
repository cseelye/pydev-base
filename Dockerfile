FROM cseelye/ubuntu-base

RUN apt-get update && \
    apt-get install --yes \
        ack \
        curl \
        git \
        jq \
        make \
    && apt-get autoremove --yes && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip \
        --disable-pip-version-check \
        --no-cache-dir \
        install \
        --no-compile \
        --force-reinstall \
        --requirement /tmp/requirements.txt
