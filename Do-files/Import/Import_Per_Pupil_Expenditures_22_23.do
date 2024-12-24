/***********************************************

FILE NAME: Import_Per_Pupil_Expenditures_22_23
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for importing and cleaning 2022 and 2023 Per Pupil Expenditures datasets

***********************************************/

***Import, clean and save datasets
foreach num in 2022 2023{
	import delimited using "$rawdata/Per_Pupil_Expenditures_`num'.csv"
	drop schoolcomment lss lssname statelocalamount
	rename school schoolnumber
	drop if schoolnumber == "A"
	gen pct_federal_`num' = 100*(federalamount/totalamount)
	drop totalamount
	reshape wide federalamount, i(schoolnumber schoolname) j(year)
	save "$cleandata/Clean_Per_Pupil_Expenditures_`num'.dta", replace
	clear
}