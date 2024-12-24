/***********************************************

FILE NAME: Research Question 3 Analysis
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for answering research question 3 of EDLF 5310 Final Project

***********************************************/

***Research Question 3: How does the federal amount allocated for per pupil expenditures in Maryland high schools change between 2022 and 2023?

***Box Plot: Distribution of Changes in the federal funding for high schools in Maryland Between 2022 and 2023

histogram diff_federal, freq bin (18) /// 
	title ("Changes in the federal funding") subtitle ("Between 2022 and 2023") /// 
	xtitle(" " "Dollars") ytitle ("Number of schools" " ") /// 
	ylabel(0(25)150) xlabel(-15000(2500)20000, angle(45)) ///
	scheme(s2color) name(graph3, replace) 

graph save "$graph/graph3.gph", replace

***********************************************

***Box Plot: Distribution of Percentage Changes in the federal funding for high schools in Maryland Between 2022 and 2023

histogram pct_diff_federal, freq bin (18) ///
	title ("Pct. Changes in the federal funding") subtitle ("Between 2022 and 2023") /// 
	xtitle(" " "Percentages") ytitle ("Number of schools" " ") /// 
	ylabel(0(25)150) xlabel(-200(100)1000, angle(45)) ///
	scheme(s2color) name(graph4, replace) 

graph save "$graph/graph4.gph", replace

***********************************************

***Box Plot: Distribution of Changes in the  Share of Federal Funding Relative to Total Funding for high schools in Maryland Between 2022 and 2023
histogram pct_federal_total, freq bin (18) ///
	title ("Pct. Changes in Share of Federal Funding") subtitle ("Between 2022 and 2023") /// 
	xtitle(" " "Percentages") ytitle ("Number of schools" " ") /// 
	ylabel(0(25)150) xlabel(-30(15)90, angle(45)) ///
	scheme(s2color) name(graph5, replace) 

graph save "$graph/graph5.gph", replace

***********************************************

***Table: Descriptive Statistics: Real Changes in the federal funding Between 2022 and 2023
asdoc sum diff_federal, d save($table/table4_5_6.doc) /// 
	title(Descriptive Statistics: Real Changes in the federal funding Between 2022 and 2023) /// 
	stat(mean sd min p25 median p75 max) dec(1) replace

***********************************************

***Table: Descriptive Statistics: Percentage Changes in the federal funding Between 2022 and 2023
asdoc sum pct_diff_federal, d save($table/table4_5_6.doc) /// 
	title(Descriptive Statistics: Percentage Changes in the federal funding Between 2022 and 2023) /// 
	stat(mean sd min p25 median p75 max) dec(1) append

***********************************************

***Table: Descriptive Statistics: Changes in the Share of Federal Funding Relative to Total Funding Between 2022 and 2023
asdoc sum pct_federal_total, d save($table/table4_5_6.doc) /// 
	title(Descriptive Statistics: Changes in the Share of Federal Funding Relative to Total Funding Between 2022 and 2023) /// 
	stat(mean sd min p25 median p75 max) dec(1) append