# Selecting an algorithm

https://app.pluralsight.com/player?course=python-understanding-machine-learning&author=jerry-kurata&name=python-understanding-machine-learning-m5&clip=0&mode=live


  - Filter algorithms

  - Discuss best algorithms

  - Select one initial algorithm

        - may have to use multiple algorithms



## Algorithm Decision Factors:

### Predict which people are likely to develop diabetes

    - Learning type

        - `prediction model` => `Supervised machine Learning`

    - Result type `categories`

        - `regression`

            - continuous values

            - price = A * # bedroom
                      + B * size
                      + ...

        - `classification`

            - discrete values

            - small, medium, large

            - 1 - 100, 101 - 200, 201 - 300

            - true or false => binary classification

    - Complexity

        - in this case, eliminate `ensemble algorithms` => algorithms that contain multiple algorithms

    - Basic vs enhanced

        - stick to basic algorithms when choosing an initial algorithm



## Candidate Algorithms


    - `Naive Bayes`

        - likelihood + probability

        - every feature has same weight

        - requires smaller set of data to train

        - simple + fast + stable

    - `Logistic Regression`

        - binary result

        - relationship between features is weighted => `0` or `1`

    - `Decision Tree`

        - binary tree

        - node contains decision

        - requires enough data to determine node and splits
