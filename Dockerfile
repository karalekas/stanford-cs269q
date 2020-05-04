# build image from a tagged forest-notebook image
FROM rigetti/forest-notebook:2.17.0

RUN pip install --no-cache-dir cython==0.29.6 numpy==1.16.2 scipy==1.2.1
RUN pip install --no-cache-dir qutip==4.3.1

# copy over files from binder repository into $HOME
COPY . ${HOME}

# set working directory to $HOME
WORKDIR ${HOME}
