# eea.notebook

EEA Jupyter Notebook Data Science Stack.

## How to run

You need [Docker engine installed](https://docs.docker.com/engine/installation/).

The following command starts a container with the Notebook server listening for
HTTP connections on port 8080 with a randomly generated authentication token 
configured.

```
docker run -it --rm -p 8080:8888 eeacms/notebook
```

Take note of the authentication token included in the notebook startup log 
messages. Include it in the URL you visit to access the Notebook server or enter
it in the Notebook login form.

All notebooks are saved in /home/jovyan/ folder in the container. If you want
persistency you should mount the folder to local path on the host.

For more advanced usage see base image documentation
[jupyter/datascience-notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook)

## What includes

- Jupyter Notebook 5.0.x
- Conda Python 3.x and Python 2.7.x environments
- pandas, matplotlib, scipy, seaborn, scikit-learn, scikit-image, sympy, cython, patsy, statsmodel, cloudpickle, dill, numba, bokeh pre-installed
- Conda R v3.3.x and channel
- plyr, devtools, shiny, rmarkdown, forecast, rsqlite, reshape2, nycflights13, caret, rcurl, and randomforest pre-installed
- The tidyverse R packages are also installed, including ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, lubridate, and broom
- Julia v0.5.x with Gadfly, RDatasets and HDF5 pre-installed

Packages added by EEA:

 - [spaCy](https://spacy.io/)
 - [gensim](https://radimrehurek.com/gensim/)
 - [textacy](http://textacy.readthedocs.io/en/latest/)