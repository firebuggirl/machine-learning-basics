
# Base image
FROM python:3.5.3-onbuild

# Updating repository sources
RUN apt-get update

# Installing cron and curl
RUN apt-get install cron -yqq \
    curl

# Creating directories
# RUN mkdir /data
RUN mkdir /notebooks
RUN mkdir /tmp/tflearn_logs

# Setting up volumes
VOLUME [ "/notebooks", "/tmp/tflearn_logs"]

# jupyter
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='your-token'

# NOTE: after image is running, sh into running container: docker exec -it <containerId> sh
# and run pip install scikit-learn
