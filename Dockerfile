
# Base image
#FROM python:3.5.3-onbuild
FROM python:3.6-onbuild


# Updating repository sources
RUN apt-get update

# Installing cron and curl
RUN apt-get install cron -yqq \
    curl

# Creating directories
# RUN mkdir /data
RUN mkdir /notebooks
RUN mkdir /tmp/tflearn_logs
RUN pip install --upgrade pip
RUN pip install scikit-learn
RUN pip install pymongo
RUN pip install dateparser
RUN pip install seaborn

# Setting up volumes
# VOLUME [ "/notebooks", "/tmp/tflearn_logs"]
# Note: can't use VOLUME in Dockerfile if/when using bind mounts


# jupyter
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='your-token'

# NOTE: after image is running, sh into running container: docker exec -it <containerId> sh
# pip install scikit-learn + pip install pymongo when using mongo-lessons-notebooks
# For $graphLookup assignment => pip install dateparser
# For `linear regressions w/ MongoDB` lesson -> pip install seaborn
# for Pluralsight course: pip install sklearn
