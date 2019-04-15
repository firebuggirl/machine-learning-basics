# Run/build Jupyter notebooks w/ Python (w/out Anaconda or miniconda3)


  ` (sudo) docker build -t <image-name> . `

        - ie.,

          ` docker build -t python-jupyter .
          `

  ` docker images
  `

  - `jupyter-notebooks` => name of volume

  - `notebooks` => name of current working directory

  ` docker run -d -v jupyter-notebooks:/notebooks -v logs:/tmp/tflearn_logs -i -t -p 8888:8888 python-jupyter
  `

  - notes from Docker Mastery course on Udemy:

      - What I am trying to do is `save data/changed/modified files in my current working directory` directly to the named volume that is attached to the running container without having to rebuild the image every time something has been changed in the directory on my laptop.

      - Instructor response:

            - .. you would use *either* a named volume (which docker will store in it’s own location) or a bind mount. You can’t do both. It sounds like you want `bind mounts`, so `re-watch that Bind Mount lecture` for the `proper format using the pwd environment variable to mount your parent working directory` path into the container.

            https://www.udemy.com/docker-mastery/learn/v4/t/lecture/6775722?start=0

            - bind mounts can't be used in a Dockerfile, have to be used via `run` command

                - get `Mountpoint` of Docker volume:

                  ` docker inspect jupyter-notebooks
                  `

                  - returns:

                      ` /var/lib/docker/volumes/jupyter-notebooks/_data" /var/lib/docker/volumes/jupyter-notebooks/_data
                      `
                 - Use/attach a bind mount to current directory notebooks:

## Copy files from `host (ie., this directory)` directly to the `container` in real time w/out having to re-build container every time there is a change:

                 - run from this current directory `notebooks`

                    ` docker container run -d --name python-jupyter -p 8888:8888 -v $(pwd):/usr/src/app python-jupyter
                    `// note: in this case, use `docker inspect <container_id>` to get current working dir path of container

                    - to find volume attached to this container:

                        ` docker inspect <image_id> ` => look for volume info

  - token will be returned in shell where docker run command was run

  - connect:

  `
  http://127.0.0.1:8888/?token=<generated-token> `

        - OR


    ` http://localhost:8888?token=
    `

        - enter token in Jupyter UI

  - enter bash + install scikit-learn:

    ` docker ps
    `

    ` docker exec -it <containerId> sh
    `

    ` pip install scikit-learn
    `

# Save image to Dockerhub

    ` docker login
    `

   - tag + push image:


      ` docker tag <image-name> <login-id>/<image-name>
      `

      ` docker push <login-id>/<image-name>
      `

      - ie.,


            `  docker tag python-jupyter juliettet/python-jupyter
            `

            ` docker push juliettet/python-jupyter
            `


## Edit files in running container

    `  docker exec -it <container_id> sh
    `

    ` apt-get update

      apt-get install vim
    `

    ` vim <filename>
    `

    ` i
    `

    ` :wq!
    `

    ` exit
    `
