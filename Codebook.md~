"Getting & Cleaning Data" - Codebook
=====================================================================

Overview 
-------------------------------------------------------
>

The codebook  describes steps taken to process the data and perform analysis on the questions asked i.e. performing average of mean & standard deviation for each of the variables.
>
30  volunteers performed 6 different activities , described in the *Activity Labels* file, while wearing Samsung Galaxy smartphone. The smartphone captures data about their movements, described in *Features file* with the english description of each variable and the various measurements in the *Features Info file*
 
>
 Dataset 
--------------------------------------------------
 The source data is divided in *Train* & *Test* datasets, with Training comprising of 21 volunteers and Test comprising of 9 volunteers. Each Folder consists of Subject, X & Y files. 

>
>

Dataset not used
-----------------------------------------------------
The analysis is only being performed by the files described in Dataset as above. Each Train & Test folder contains "Internal Signals" folders which consists of raw signal data and not being considered for analysis

>
>

Processing & Analysis steps
------------------------------------------------------
 1. Load datasets i.e. Subject, X & Y into Data frame for both Train & Test data sets. Merge the test and train dataset in 1 combined dataframe. The comments in the *run_analysis.R* file includes details on the various sub steps performed.
 2. Find the mean & standard deviation variables using grepl command. Grepl is used as we want all variables returned as a True/false logical vector. For this SQL geeks, think of it as a left outer join
 3. Get only the necessary columns with mean & standard deviation which returns 88 columns
 4. Tag the dataset with descriptive activity names & labels
 5. For the dataset do melting (similar to excel transpose function) & then use dcast function to output a file with averages for mean & standar deviation.
 6. Write the output file into a csv called *Tidy* 


Enjoy..
