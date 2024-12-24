/***********************************************

FILE NAME: Import_2022_Educator_Qualifications_Poverty_Summary
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This do-file captures all components for importing and cleaning 2022 Educator Qualifications and School Poverty Level dataset

***********************************************/

***Import raw dataset
import delimited using "$rawdata/2022_Educator_Qualifications_Poverty_Summary.csv"

***********************************************

***Clean raw dataset
drop teacher* outoffield* inexperiencedteacherscount inexperiencedteacherspct educatorscount inexperiencededucatorscount v16 createdate leaname lea
rename school schoolnumber
drop if schoolnumber == "A"
drop if povertylevel == "All"
encode povertylevel, gen(povertylevel_num)
drop povertylevel
recode povertylevel_num 2=0 
label define povertylevel_num 0 "Low" 1 "High", modify
label values povertylevel_num povertylevel_num
rename povertylevel_num povertylevel
reshape wide povertylevel inexperiencededucatorspct, i(schoolnumber schoolname) j(year)

***********************************************

***Save clean dataset
save "$cleandata/Clean_2022_Educator_Qualifications_Poverty_Summary.dta", replace
clear