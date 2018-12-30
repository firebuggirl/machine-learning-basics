# Design a house price valuation system using gradient boosting


## Steps:

    - Import libraries

    - Import dataset

        https://www.kaggle.com/anthonypino/melbourne-housing-market/version/27

    - Scrub the dataset

    - Split data into training and test data

    - Select an algorithm + configure its parameters



- BONUS CHAPTER: Valuing an Individual Property

  http://www.scatterplotpress.com/blog/bonus-chapter-valuing-individual-property/


  - find the value of a single property by using the `joblib` command to copy our saved model and input the variables of the selected property that we wish to value => saves us the trouble of repeating previous code and we can even switch to a new notebook inside Jupyter Notebook and call the saved model.


  - open a new notebook in Jupyter Notebook and import joblib:

      ` #Import joblib

        from sklearn.externals import joblib
        `

  - call the saved model using the file name created in the previous chapter to import the saved property prediction model:


      ` model = joblib.load(‘house_trained_model.pk’)
      `


## Additional notes/reading:

https://machinelearningmastery.com/gentle-introduction-gradient-boosting-algorithm-machine-learning/

`Gradient Boosting algorithm` => one of the most powerful techniques for building predictive models
