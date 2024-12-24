/***********************************************

FILE NAME: Master Do-File
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for running EDLF 5310 Final Project, including importing, cleaning, merging and analysis

***********************************************/

***Set Directories
***Update before running this do-file***
global drive "C:/Users/Acer/OneDrive - University of Virginia/Sripoom Ploi - Copy"
global dofile "$drive/Do-files"
global rawdata "$drive/Data/Raw Data"
global cleandata "$drive/Data/Clean Data"
global graph "$drive/Results/Graph"
global table "$drive/Results/Table"
global log "$drive/Log-files"

***Install Necessary Add-In Packages
ssc install outreg2, replace
ssc install asdoc, replace

***Start a New Log File

capture log close
log using "$log/PS_Final Project", replace

clear all
set more off

***********************************************

***Import and clean the following datasets: /// 
2022 SAT Score, 2022 Educator Qualifications and School Poverty Level, 2022 College Enrollment, 2022 and 2023 Per Pupil Expenditures
foreach name in SAT_Graduates_2022 2022_Educator_Qualifications_Poverty_Summary Nationwide_College_Enrollment_2022 Per_Pupil_Expenditures_22_23{
	do "$dofile/Import/Import_`name'"
}

***********************************************

***Merge datasets and clean merged dataset to create a final analytic dataset
do "$dofile/Merge Do-File"

***********************************************

***Analysis to Answer Research Question 1, 2 and 3
foreach num in 1 2 3{
	do "$dofile/Analysis/Research Question `num' Analysis"
}

***********************************************

***Save Log File
capture log close
translate "$log/PS_Final Project.smcl" "$log/PS_Final Project.pdf", replace