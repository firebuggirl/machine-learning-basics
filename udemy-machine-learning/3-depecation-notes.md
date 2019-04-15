https://www.udemy.com/machinelearning/learn/v4/t/lecture/10601930?start=0


# WARNING - Update
Section 2, Lecture 17


in the following tutorial, the first line of code we will type will be:

 ` from sklearn.cross_validation import train_test_split  
 `

However the "cross_validation" name is now deprecated and was replaced by "model_selection" inside the new anaconda versions.

To avoid this, you just need to replace:

from sklearn.cross_validation import train_test_split

by

` from sklearn.model_selection import train_test_split  
`
