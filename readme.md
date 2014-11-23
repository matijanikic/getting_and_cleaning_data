
Input dataset is given per assignment:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and contains for each record:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



The transformations are as follows: [ the same steps are described in the code itself]

1. read the train data set tables  [y_train,x_train, subject_train]
2. name the descriptive data set  variables  [ACTIVITY_LABEL and SUBJECT_ID respectively ]
3. join columns for a full training data set
4. set the source as "1" in order to identify the set later if necessary 


5. read the train data set tables  [y_test,x_test, subject_test]
6. name the descriptive data set  variables  [ACTIVITY_LABEL and SUBJECT_ID respectively ]
7. join columns for a full test data set
8. set the source as "2" in order to identify the set later if necessary 

9. merge the training and test data source into one complete data set

10. read the descriptions of the measurements from the 'features.txt' datasets/Human
11. label the variables with names from the features dataset  

12. select only the variables related to mean or standard deviation
13. subset the existing data set into x_mean_std  with necessary  variables

14. identify groupColumns and dataColumns
15. produce a clean data set

16. produce an output file "analysis.txt" in the working directory 



Resulting dataset contains data with the average of each variable for each activity and each subject.

The variables are related only to mean and standard deviation columns of the input dataset.

Activity labels have the range of values from 1 to 6.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Subject_id  is a range of values from 1 to 30.

The dataset includes the following files:



- 'README.md'

- 'CodeBook.md': Shows information about the variables used resulting data set "analysis.txt"
