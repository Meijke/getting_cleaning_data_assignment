This codebook describes the variables that were first loaded into R, the transformations that were performed and the resulting output variables and datasets.

# Downloaded filenames
* train_data : training data set
* train_label : integer labels of activity of the training data set
* train_subject : subject numbers of training data set
* test_data : test data set
* test_label : integer labels of activity of test data set
* test_subject : subject numbers of test data set
* features : feature names that correspond to column names of the train and test data set
* activity_labels : text labels of corresponding activity


# Variabels and transformations
* temp : stores file path of temporary directory to store the zip file
* train_data : file that combines the labels, subjects and data of training data set

Transformation : Prepared by column bind function, column names were replaced by features and descriptive names for subject and activitylabel
* test_data : file that combines the labels, subjects and data of test data set

Transformation :  Prepared by column bind function, column names were replaced by features and descriptive names for subject and activitylabel
* total_data : file that combines train and test data

Transformation : Prepared by row bind function, match function recodes the integer activity labels to the matching text labels that are stored in activity_labels
* mean_std_cols : list that stores the columns names that contain subject, activitylabel and mean or std in their name

Transformation : grep function captures a list of all column names that contain given values
* mean_data : file that selects the columns that contain mean or std in columnname of total data set
* averages : file that contains the averages of each variabel for each subject and each activity label

Transformation : Obtained by the aggregate function that shrinks the data by list of given variables. 
