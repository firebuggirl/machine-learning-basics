# Run/build Jupyter notebooks w/ Python (w/out Anaconda or miniconda3)


  ` (sudo) docker build -t <image-name> . `

        - ie.,

          ` docker build -t python-jupyter .
          `

  ` docker images
  `

  ` docker run -d -v jupyter-notebooks:/notebooks -v logs:/tmp/tflearn_logs -i -t -p 8888:8888 python-jupyter
  `

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
