FROM rigetti/qvm:1.6.0 as qvm
FROM python:3.6

# copy over the pre-built qvm & quilc binaries from the first build stage
COPY --from=qvm /src /src

# install the missing apt requirements that can't be copied over
RUN apt-get update && apt-get -yq dist-upgrade && \
    apt-get install --no-install-recommends -yq \
    git libblas-dev libffi-dev liblapack-dev && \
    rm -rf /var/lib/apt/lists/*

# install jupyter notebook and jupyter lab
RUN pip install --no-cache-dir notebook==5.7.8 jupyterlab==0.35.4

# install the runtime dependencies for the lecture notebook
RUN pip install --no-cache-dir matplotlib==3.0.3 pyquil==2.6.0
RUN pip install --no-cache-dir cython==0.29.6 numpy==1.16.2 scipy==1.2.1
RUN pip install --no-cache-dir qutip==4.3.1

# create user with UID 1000 and associated home dir (required by binder)
ARG NB_USER=binder
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# copy over files from binder repository into /home/binder
COPY . ${HOME}

# transfer ownership of /home/binder and /src to binder user
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN chown -R ${NB_UID} /src
USER ${NB_USER}

# signal that we need to publish port 8888 to run the notebook server
EXPOSE 8888

# use a start script to add startup commands (qvm server spinup)
WORKDIR ${HOME}
ENTRYPOINT ["./start"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "Lecture4.ipynb"]
