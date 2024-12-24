/***********************************************

FILE NAME: Research Question 1 Analysis
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for answering research question 1 of EDLF 5310 Final Project

***********************************************/

***Research Question 1: For high schools in Maryland in 2022, do schools with a high percentage of inexperienced educators have lower college enrollment percentages? 

***Scatterplot: Relationship between inexperienced educators and college enrollment for high schools in Maryland in 2022

twoway (scatter enrolledpercentage2022_12 inexperiencededucatorspct2022, msize(small)) ///
	(lfit enrolledpercentage2022_12 inexperiencededucatorspct2022, lwidth(thin)), ///
	title("2022 College Enrollment and Inexperienced Educators") subtitle("High Schools in Maryland" " ") ///
	xtitle(" " "% of Inexperienced Educators") /// 
	ytitle("% of College Enrollment" "12 Months Post-HS Graduation" " ") /// 
	ylabel(0(20)100) xlabel(0(10)60) /// 
	legend (row(2) position(6) bmargin(large) lab(1 "Schools") lab(2 "Linear Fit")) /// 
	scheme(s2color) name(graph1, replace)

graph save "$graph/graph1.gph", replace

***********************************************

***Linear Regression: Relationship between inexperienced educators and college enrollment for high schools in Maryland in 2022

regress enrolledpercentage2022_12 inexperiencededucatorspct2022
outreg2 using "$table/table1.doc", title(Regression Estimates: Inexperienced Educators and College Enrollment) ///
	ctitle(Model 1) se bdec(3) addstat(Adjusted R2, e(r2_a)) word replace