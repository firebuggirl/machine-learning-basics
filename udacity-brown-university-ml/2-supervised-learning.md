# Supervised Learning

- 2 Types of Supervised Learning:


      * `Classification`

        - process of taking input (x) and mapping it to some discreet label
         => EX: true or false / male or female

         - `instances` => `vectors` of attributes that define whatever your input space is

         - `concept` => `function` => maps inputs to outputs => true/false

              => mappings from objects to membership in a set

        - `target concept` => the thing that we're trying to find => `answer`

        - `hypothesis` => `class` => all of the possible (classification) functions that you are willing to think about

        - `sample` => `training set` => set of all of our inputs, paired with a label that is the correct output (true/false) => lots of examples/labels => inductive learning

        - `candidate` => a concept that you think might be the target concept

        - `testing set` => looks like a training set, takes candidate concept and determines whether it does a good job or not => `should NOT be the same as the training set` => need to include new examples  => generalization is the whole point of machine learning

        



      * `Regression`


          - continuous valued functions => EX: linear Regression
