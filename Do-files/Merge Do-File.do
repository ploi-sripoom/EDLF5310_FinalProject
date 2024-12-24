/***********************************************

FILE NAME: Merge Do-File
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This do-file captures all components for merging datasets

***********************************************/

***Import clean 2022 SAT Score dataset
use "$cleandata/Clean_SAT_Graduates_2022.dta" 

***********************************************

***Merge current dataset with clean 2022 College Enrollment dataset
merge 1:1 schoolnumber schoolname using "$cleandata/Clean_Nationwide_College_Enrollment_2022.dta"
drop _merge

***********************************************

***Merge current master dataset with clean 2022 Per Pupil Expenditures, clean 2023 Per Pupil Expenditures and clean 2022 Educator Qualifications and School Poverty Level datasets
foreach local in Per_Pupil_Expenditures_2022 Per_Pupil_Expenditures_2023 2022_Educator_Qualifications_Poverty_Summary{
	merge 1:1 schoolnumber schoolname using "$cleandata/Clean_`local'.dta"
	drop if _merge == 2
	drop _merge
}

***********************************************

***Create a variable for changes in the federal funding between 2022 and 2023
gen diff_federal  = federalamount2023 - federalamount2022 
gen pct_diff_federal = 100*((federalamount2023 - federalamount2022)/federalamount2022)
gen pct_federal_total = pct_federal_2023 - pct_federal_2022

***********************************************

***Edit variable label
label var schoolnumber "High School Number"
label var schoolname "High School Name"
label var totalscoremean2022 "Mean SAT Scores"
label var studentstested2022 "Number of Students Taking SAT"
label var enrolledpercentage2022_12 "% of College Enrollment 12 Months Post-HS Graduation"
label var inexperiencededucatorspct2022 "% of inexperienced educators"
label var povertylevel2022 "School's Poverty Level"
label var federalamount2022 "2022 Federal Amount Allocated for Per-pupil Expenditures"
label var federalamount2023 "2023 Federal Amount Allocated for Per-pupil Expenditures"
label var diff_federal "Changes in Federal Funding Between 2022 and 2023"
label var pct_diff_federal "Pct. Changes Federal Funding Between 2022 and 2023"
label var pct_federal_total "Pct. Changes in Share of Federal Funding Relative to Total Funding Between 2022 and 2023"
label var pct_federal_2022 "Share of Federal Funding Relative to Total Funding in 2022"
label var pct_federal_2023 "Share of Federal Funding Relative to Total Funding in 2023"

***********************************************

***Check for duplicates
duplicates tag schoolnumber schoolname, gen(dupes)
tab dupes
drop dupes

***********************************************

***Save final analytic dataset
save "$cleandata/Final_Analytic_Dataset.dta", replace
