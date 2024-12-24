# Maryland High School Performance Analysis

## Description
This project serves as the final deliverable for the course "Data Management for Social Science Research (EDLF 5130)" at the University of Virginia. The project focuses on analyzing Maryland high schools' performance in 2022 and 2023 using publicly available data. 
The datasets used in this analysis are provided by the Maryland State Department of Education and are accessible through this [link](https://reportcard.msde.maryland.gov/Graphs/#/DataDownloads/datadownload/3/17/6/99/XXXX/2024).
## Research Questions
This project aims to answer the following questions:
1) For high schools in Maryland in 2022, do schools with a high percentage of inexperienced educators have lower college enrollment percentages?
2) For high schools in Maryland in 2022, how do their mean SAT scores differ by the school's poverty level?
3) How does the federal amount allocated for per pupil expenditures in Maryland high schools change between 2022 and 2023?
## File Structure
- Master Do-File: Executes all the steps in sequence.
- Import Folder: Contains do-files for importing and cleaning raw datasets.
-	Merge Do-File: Merges cleaned datasets into a final analytic dataset.
-	Analysis Folder: Contains do-files for addressing each research question.
-	Results folder: Contains outputs from the do-files
## Usage
To execute the code, ensure that:
1) Stata is installed.
2) Download Required Datasets: Obtain the following datasets from the provided website:
- 2022 dataset on educator qualifications based on the poverty level
- 2022 dataset on nationwide college enrollment
- 2022 dataset on per-pupil expenditures
- 2023 dataset on per-pupil expenditures
3) Change file directory: Before running any commands in the master do-file, update the global variables that set the file directories with the local file path location on your computer.
4) Run the master do-file.
## Output
The project generates:
-	Visualizations (e.g., graphs)
-	Descriptive and inferential statistics related to research questions
## Acknowledgments
Special thanks to Prof. Miller for his guidance throughout this project.
