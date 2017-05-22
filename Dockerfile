FROM jupyter/datascience-notebook:latest
MAINTAINER "Antonio De Marinis" <demarinis@eea.europa.eu>


USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    libssl-dev \
    libffi-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER

# Add conda package channels
RUN conda config --add channels anaconda && \
    conda config --add channels conda-forge 

# Install python3 packages into the root environment (python3)
RUN yes | pip3 install 'spacy==1.8.*' \
    'gensim==2.*' && \
    conda install -n root --quiet --yes \
    'conda-build' \
    'spacy=1.8.*' \
    'gensim' && \
    conda clean -tipsy

# install a package into the python2 environment
RUN yes | pip2 install 'spacy==1.8.*' \
    'pyldavis' \
    'textacy' \
    'phrasemachine' \
    'gensim==2.1.*' && \
    conda install -n python2 --quiet --yes \
    'textacy' \
    'spacy=1.8.*' \
    'gensim'  && \
    conda clean -tipsy

# Download best-matching default spacy english model
# RUN python -m spacy download en
RUN python -m spacy download en

# convert phrasemachine to python3 code
#RUN cd /usr/local/lib/python3.6/site-packages/phrasemachine \
#        && 2to3 -w *.py