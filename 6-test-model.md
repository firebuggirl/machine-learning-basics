# Test the model's accuracy

     - `Confusion Matrix` explanation:

          https://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/

          - `two` possible predicted classes: `yes` and `no`

          - The classifier made a total of 231 predictions (e.g., 231 patients were being tested for the presence of diabetes).

              - the classifier `predicted`:

                  - "yes" 85 times

                  - "no" 146 times

              - `reality` = :

                  - 80 patients have the disease

                  - 151 patients do not

           - Basic terms:

                - `TP` => True positives

                - `TN` => True negatives

                - `FP` => False positives

                - `FN` => Type II Error => predicted no, but actually DO have disease


            - `Precision` => `Recall` => `TP / (TP + FN)`


## The `Random Forest` Algorithm:


    - => an ensemble algorithm based on decision trees

            - creates multiple trees w/ subsets of data

            - can see a big difference between outcome of training vs test data in this example => usually means the algorithm is overfitting
