=======================================================================
This data set is a variation generated from the experiments reported by 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Human Activity Recognition Using Smartphones Dataset
Version 1.0
=======================================================================

Section 1. Experimental design (from the authors of the experiment)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

=======================================================================

Section 2. Description of the data
Two datasets were generated from splitting the volunteers into a “train” group and a “test” group. The following parameters were measured for each subject performing the 6 selected activities:

- Triaxial (x,y,z) acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 

Data post processing (explained in more detail by the authors, see README.TXT file int he original data download), generated 561 variables containing different statistical parameters of the data. The run_analysis.R script isolates the columns that contain the means and the standard deviations of the measurements taken.
 
=======================================================================

Section 3. Variable description

The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Prefix 't' denotes time domain. 
The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were selected from these signals are: 

mean(): Mean value
std(): Standard deviation

=======================================================================

The script cleans up the variable names from the “features.txt” file, substituting all parentheses and dashes with dots to separate the different parts of the name. The overall name structure was kept as described above with the prefix ’t’ denoting time domain, ‘f’ frequency domain, the acceleration, and gyration variables clearly marked, followed by the name of the statistic (mean/std) and the direction (X,Y,Z)

The script matches the activity codes in the “y_test.txt/y_train.txt” with their respective names, merges the “subject_test.txt/subject_train.txt” with their corresponding activity code/activity records and the measurements of mean and standard deviation

The scrip finally groups the measurements by subject and activity and produces a table with 180 rows (30 subjects X 6 activities) containing the average of the different measurements from the original data sets and stores the values in a file named “SummaryData.txt”

=======================================================================

List of Variables

"subject"
"ActivityCode"
"activity"
"tBodyAcc.mean.X"
"tBodyAcc.mean.Y"
"tBodyAcc.mean.Z"
"tGravityAcc.mean.X"
"tGravityAcc.mean.Y"
"tGravityAcc.mean.Z"
"tBodyAccJerk.mean.X"
"tBodyAccJerk.mean.Y"
"tBodyAccJerk.mean.Z"
"tBodyGyro.mean.X"
"tBodyGyro.mean.Y"
"tBodyGyro.mean.Z"
"tBodyGyroJerk.mean.X"
"tBodyGyroJerk.mean.Y"
"tBodyGyroJerk.mean.Z"
"tBodyAccMag.mean."
"tGravityAccMag.mean."
"tBodyAccJerkMag.mean."
"tBodyGyroMag.mean."
"tBodyGyroJerkMag.mean."
"fBodyAcc.mean.X"
"fBodyAcc.mean.Y"
"fBodyAcc.mean.Z"
"fBodyAcc.meanFreq.X"
"fBodyAcc.meanFreq.Y"
"fBodyAcc.meanFreq.Z"
"fBodyAccJerk.mean.X"
"fBodyAccJerk.mean.Y"
"fBodyAccJerk.mean.Z"
"fBodyAccJerk.meanFreq.X"
"fBodyAccJerk.meanFreq.Y"
"fBodyAccJerk.meanFreq.Z"
"fBodyGyro.mean.X"
"fBodyGyro.mean.Y"
"fBodyGyro.mean.Z"
"fBodyGyro.meanFreq.X"
"fBodyGyro.meanFreq.Y"
"fBodyGyro.meanFreq.Z"
"fBodyAccMag.mean."
"fBodyAccMag.meanFreq."
"fBodyBodyAccJerkMag.mean."
"fBodyBodyAccJerkMag.meanFreq."
"fBodyBodyGyroMag.mean."
"fBodyBodyGyroMag.meanFreq."
"fBodyBodyGyroJerkMag.mean."
"fBodyBodyGyroJerkMag.meanFreq."
"angle.tBodyAccMean.gravity."
"angle.tBodyAccJerkMean.gravityMean."
"angle.tBodyGyroMean.gravityMean."
"angle.tBodyGyroJerkMean.gravityMean."
"angle.X.gravityMean."
"angle.Y.gravityMean."
"angle.Z.gravityMean."
"tBodyAcc.std.X"
"tBodyAcc.std.Y"
"tBodyAcc.std.Z"
"tGravityAcc.std.X"
"tGravityAcc.std.Y"
"tGravityAcc.std.Z"
"tBodyAccJerk.std.X"
"tBodyAccJerk.std.Y"
"tBodyAccJerk.std.Z"
"tBodyGyro.std.X"
"tBodyGyro.std.Y"
"tBodyGyro.std.Z"
"tBodyGyroJerk.std.X"
"tBodyGyroJerk.std.Y"
"tBodyGyroJerk.std.Z"
"tBodyAccMag.std."
"tGravityAccMag.std."
"tBodyAccJerkMag.std."
"tBodyGyroMag.std."
"tBodyGyroJerkMag.std."
"fBodyAcc.std.X"
"fBodyAcc.std.Y"
"fBodyAcc.std.Z"
"fBodyAccJerk.std.X"
"fBodyAccJerk.std.Y"
"fBodyAccJerk.std.Z"
"fBodyGyro.std.X"
"fBodyGyro.std.Y"
"fBodyGyro.std.Z"
"fBodyAccMag.std."
"fBodyBodyAccJerkMag.std."
"fBodyBodyGyroMag.std."
"fBodyBodyGyroJerkMag.std."
