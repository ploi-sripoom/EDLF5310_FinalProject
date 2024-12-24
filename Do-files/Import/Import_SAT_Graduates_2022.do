/***********************************************

FILE NAME: Import_SAT_Graduates_2022
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This do-file captures all components for importing and cleaning 2022 SAT Score dataset

***********************************************/

***Import raw dataset
import delimited using "$rawdata/SAT_Graduates_2022.csv"

***********************************************

***Clean raw dataset
drop createdate leaname leanumber evidencebasedreadingandwritingsc mathscoremean
drop if schoolnumber == "A"
destring totalscoremean studentstested, replace force
reshape wide totalscoremean studentstested, i(schoolnumber schoolname) j(academicyear)

***********************************************

***Save clean dataset
save "$cleandata/Clean_SAT_Graduates_2022.dta" , replace
clear