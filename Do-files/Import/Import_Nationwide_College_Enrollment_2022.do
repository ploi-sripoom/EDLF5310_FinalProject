/***********************************************

FILE NAME: Import_Nationwide_College_Enrollment_2022
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for importing and cleaning 2022 College Enrollment dataset

***********************************************/

***Import raw dataset
import delimited using "$rawdata/Nationwide_College_Enrollment_2022.csv"

***********************************************

***Clean raw dataset
drop createdate studentcount enrolledcount leaname leanumber
drop if schoolnumber == "A"
encode collectiontypetitle, gen(collectiontypetitle_2)
drop collectiontypetitle
rename collectiontypetitle_2 collectiontypetitle
drop if collectiontypetitle == 2
reshape wide enrolledpercentage, i(academicyear schoolnumber schoolname) j(collectiontypetitle)
destring enrolledpercentage*, replace force
reshape wide enrolledpercentage*, i(schoolnumber schoolname) j(academicyear)
rename enrolledpercentage12022 enrolledpercentage2022_12

***********************************************

***Save clean dataset
save "$cleandata/Clean_Nationwide_College_Enrollment_2022.dta", replace
clear