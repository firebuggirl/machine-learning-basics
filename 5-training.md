# Training the model

https://app.pluralsight.com/player?course=python-understanding-machine-learning&author=jerry-kurata&name=python-understanding-machine-learning-m6&clip=0&mode=live


    - Scikit-learn

        - Python library for handling training + evaluation tasks

        - has training functions

        - Python libraries => NumPy, SciPy, & Pandas

              - data splitting, pre-processing, feature selection, model training, model tuning

        - interface for accessing algorithms

    - re-train when new data is included

        - new data => better predictions

    - split diabetes data into 2 data sets:

        - Training => 70%

            - train with minimum # of features(columns)

        - Testing => 30%

## Training process review:

    - Reviewed training process

    - Used Python to split data

        - utilized scikit-learn methods w/ Numpy + Pandas data structures

    - Reasoned about missing data (ie., features w/ a value of `0`)

        - used `mean imputation` to replace missing values

    - Trained the intitial Naive Bayes model 
