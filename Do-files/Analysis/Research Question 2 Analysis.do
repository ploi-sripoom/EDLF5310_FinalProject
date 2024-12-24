/***********************************************

FILE NAME: Research Question 2 Analysis
AUTHOR: Ploi Sripoom
DATE CREATED: December 3rd, 2024
PURPOSE: This master do-file captures all components for answering research question 2 of EDLF 5310 Final Project

***********************************************/

***Research Question 2: For high schools in Maryland in 2022, how do their mean SAT scores differ by the school's poverty level? 

***Box Plot: Distribution of Mean SAT Scores Among Schools with High Poverty Level and Schools with Low Poverty Level

graph box totalscoremean2022, over(povertylevel2022) asyvars  title ("Mean SAT Scores By School's Poverty Level" " ") /// 
	ytitle("Mean SAT Scores" " ") ylabel(800(200)1400) /// 
	legend (row(2) position(6) bmargin(large) lab(1 "Schools with Low Poverty Level") lab(2 "Schools with High Poverty Level")) /// 
	scheme(s2color) name(graph2, replace)

graph save "$graph/graph2.gph", replace

***********************************************

***Table: Descriptive Statistics: Mean SAT Scores By School's Poverty Level

asdoc sum totalscoremean2022, by(povertylevel2022) /// 
	d save($table/table2.doc) /// 
	title(Descriptive Statistics: Mean SAT Scores By School's Poverty Level) /// 
	stat(N mean sd min p25 median p75 max) dec(1) replace

***********************************************

***Regression: Relationship between Mean Total SAT Scores, School's Poverty Level and Students Tested for SAT

regress totalscoremean2022 povertylevel2022 studentstested2022
	outreg2 using "$table/table3.doc", /// 
	title(Regression Estimates: Mean Total SAT Scores and School's Poverty Level, Controlling for Students Tested) ///
	ctitle(Model 1) se bdec(3) addstat(Adjusted R2, e(r2_a)) word replace
