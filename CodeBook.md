#CodeBook

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components,  was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

All observations for each activity a mean was calculated for each subject 

30 subjects * 6 activities each = 180 averaged observations



The features selected for this database come from the mean of all the readings for each subject accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"subject"
"activity"
"timebodyaccmeanx"
"timebodyaccmeany"
"timebodyaccmeanz"
"timebodyaccstdx"
"timebodyaccstdy"
"timebodyaccstdz"
"timegravityaccmeanx"
"timegravityaccmeany"
"timegravityaccmeanz"
"timegravityaccstdx" 
"timegravityaccstdy" 
"timegravityaccstdz" 
"timebodyaccjerkmeanx"
"timebodyaccjerkmeany"
"timebodyaccjerkmeanz"
"timebodyaccjerkstdx"
"timebodyaccjerkstdy"
"timebodyaccjerkstdz"
"timebodygyromeanx" 
"timebodygyromeany"
"timebodygyromeanz" 
"timebodygyrostdx" 
"timebodygyrostdy" 
"timebodygyrostdz" 
"timebodygyrojerkmeanx"
"timebodygyrojerkmeany"
"timebodygyrojerkmeanz"
"timebodygyrojerkstdx" 
"timebodygyrojerkstdy"
"timebodygyrojerkstdz"
"timebodyaccmagmean"
"timebodyaccmagstd"
"timegravityaccmagmean"
"timegravityaccmagstd" 
"timebodyaccjerkmagmean"
"timebodyaccjerkmagstd" 
"timebodygyromagmean"
"timebodygyromagstd" 
"timebodygyrojerkmagmean"
"timebodygyrojerkmagstd" 
"frequencybodyaccmeanx"
"frequencybodyaccmeany"
"frequencybodyaccmeanz"
"frequencybodyaccstdx" 
"frequencybodyaccstdy" 
"frequencybodyaccstdz"
"frequencybodyaccjerkmeanx"
"frequencybodyaccjerkmeany"
"frequencybodyaccjerkmeanz" 
"frequencybodyaccjerkstdx" 
"frequencybodyaccjerkstdy" 
"frequencybodyaccjerkstdz"
"frequencybodygyromeanx" 
"frequencybodygyromeany" 
"frequencybodygyromeanz" 
"frequencybodygyrostdx"
"frequencybodygyrostdy"
"frequencybodygyrostdz"
"frequencybodyaccmagmean"
"frequencybodyaccmagstd"
"frequencybodybodyaccjerkmagmean" 
"frequencybodybodyaccjerkmagstd"
"frequencybodybodygyromagmean"
"frequencybodybodygyromagstd" 
"frequencybodybodygyrojerkmagmean"
"frequencybodybodygyrojerkmagstd"
