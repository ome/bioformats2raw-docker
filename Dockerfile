# See https://github.com/mamba-org/micromamba-docker
FROM mambaorg/micromamba
COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -f /tmp/env.yaml && \
    micromamba clean --all --yes
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "bioformats2raw"]
