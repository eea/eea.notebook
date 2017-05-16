FROM jupyter/datascience-notebook:latest
MAINTAINER "Antonio De Marinis" <demarinis@eea.europa.eu>

USER $NB_USER

# Install Python 3 packages
RUN conda install --quiet --yes -c conda-forge \
    'spacy=1.8.2' && \
    conda clean -tipsy

#pip install spacy
#python -m spacy download en

# Install Python 2 packages
#RUN conda install --quiet --yes -c conda-forge python=2.7 \
#    'spacy=1.8.2' && \
#    conda clean -tipsy

# install a package into the python2 environment
# pip2 install some-package
# conda install -n python2 some-package

# install a package into the default (python 3.x) environment
# pip3 install some-package
# conda install -n python3 some-package