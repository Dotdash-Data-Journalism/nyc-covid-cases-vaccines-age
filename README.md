# nyc-covid-cases-vaccines-age

This data in this repository is taken both from the NYC Department of Health and Mental Hygiene [GitHub](https://github.com/nychealth/coronavirus-data) for NYC Covid cases by age range and from Bertrand Martel's repo of a Tableau Scraper of the [NYC Vaccine by age range](https://github.com/bertrandmartel/covid19-nyc-vaccine-tracker).

Covid case data by age was compiled from the daily Github commits in the NYC DOH repo -- which are available via a simple `git clone` into your own personal repository -- via the two shell scripts in _gitCommitLoop.sh_ and _gitCommitLoop2.sh_. 

Data from the resulting CSVs along with the vaccine data by age range were gathered and cleaned via the R file _nycByAgeCleaning.R_. Resultant CSV files _nycCovidCasesByAge.csv_ and _nycVaxPctByPop.csv_ were combined with open source NYC population by age range data to create the various data sets in the tabs in the Excel file *nyc_CovidCasesAndVaxByAge.xlsx*
