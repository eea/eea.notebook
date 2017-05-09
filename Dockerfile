FROM jupyter/datascience-notebook:latest
MAINTAINER "Antonio De Marinis" <demarinis@eea.europa.eu>

USER $NB_USER

# Install Python 3 packages
RUN conda install --quiet --yes -c conda-forge \
    'spacy=1.8.2' && \
    conda clean -tipsy

# Install Python 2 packages
#RUN conda install --quiet --yes -c conda-forge python=2.7 \
#    'spacy=1.8.2' && \
#    conda clean -tipsy