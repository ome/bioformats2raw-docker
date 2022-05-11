# Defines a bioformats2raw image based on
# https://github.com/ome/conda-bioformats2raw
ARG BUILD_IMAGE=mambaorg/micromamba
FROM ${BUILD_IMAGE}

ARG BUILD_ENV=env.yaml
COPY --chown=$MAMBA_USER:$MAMBA_USER ${BUILD_ENV} /tmp/env.yaml
RUN micromamba install -y -f /tmp/env.yaml && \
    micromamba clean --all --yes && \
    rm /tmp/env.yaml
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "bioformats2raw"]
