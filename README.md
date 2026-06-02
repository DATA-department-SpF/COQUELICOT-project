Decline in incidence and prevalence of hepatitis C virus infection among people who use drugs in France, 2004-2023
________________________________________
This folder contains the analysis pipeline for the study on prevalence and incidence from the Coquelicot surveys.
The original Coquelicot dataset cannot be shared due to confidentiality and data use agreements. However, mock datasets with the same structure are provided to allow readers to:
•	Test and run the analysis pipeline
•	Understand how prevalence and incidence of anti-HCV were estimated

The provided code focuses on anti-HCV outcomes. Adapting the same pipeline to analyze HCV RNA is straightforward and follows the same structure.
________________________________________
*Folder structure*

```R Markdown scripts and STATA script```

File	                                   | Description
1_descriptive_2013.Rmd                   | Generates some descriptive statistics for the 2013 survey wave.
2_from_intermediate_to_final_dataset.Rmd | Transforms raw datasets into a final, clean merged dataset for the three survey editions. Creates ‘Coq_combined.csv’ file.
3_prevalence_results_from_data_2013.Rmd	 | Computes weighted prevalence estimates from the 2013 data.
4_frac_poly_functional_form.do           | STATA script for assessing the functional form of fractional polynomials.
5_prevalence_results_from_model.Rmd      | Fits survey-weighted logistic models with fractional polynomial terms to estimate prevalence.
6_incidence_model_bootstrap.Rmd	         | Script for bootstrapped incidence modeling over 2004, 2013, and 2023 waves.

*Subfolders*
/final/
Contains outputs and final results from the modeling scripts, such as:
•	Coq_combined.csv
•	incidence_bootstrap_04.xlsx
•	incidence_bootstrap_13.xlsx
•	incidence_bootstrap_23.xlsx
•	prevalence_final_results_13.xlsx

/raw_data/
Contains the original raw datasets like:
•	Coq_2004.csv
•	Coq_2013.csv
•	Coq_2023.csv
These datasets are synthetic mock versions and do not contain real data. They enable the code to run identically.
________________________________________
*Variable Legend*

Variable      |	Type	            | Description
edit	        | Numeric (year)	  | Survey year. Values: 2004, 2013, 2023.
cserv         |	String	          | Service center/site code (e.g., "P32").
nqes	        | Integer	          | Individual ID (anonymized).
ville_num	    | Integer	          | City or geographic zone code.
poids	        | Numeric	          | Survey weight.
FPC_structure |	Numeric	          | Finite Population Correction (structure level).
FPC_UD	      | Numeric	          | Finite Population Correction (secondary unit level).
sexe	        | Numeric (1/2)	    | Sex: 1 = Male, 2 = Female.
age	          | Numeric	          | Age in years.
russophone	  | Binary (0/1)	    | Russian speaker: 1 = Yes, 0 = No.
clage	        | Categorical	      | Age category (e.g., "3: 26-35", "5: 46-55").
injvie	      | Binary (0/1)	    | Ever injected drugs: 1 = Yes, 0 = No.
injprodmois	  | Binary (0/1)	    | Injected drugs in the last months: 1 = Yes, 0 = No.
conscrak	    | Binary (0/1)	    | Crack consumption: 1 = Yes, 0 = No.
arn	          | Binary (0/1)	    | HCV RNA detected: 1 = Positive, 0 = Negative.
antihcv	      | Binary (0/1)	    | Anti-HCV antibodies detected: 1 = Positive, 0 = Negative.
antihiv	      | Binary (0/1)	    | Anti-HIV antibodies detected: 1 = Positive, 0 = Negative.
prisonvie	    | Binary (0/1)	    | Ever been in prison: 1 = Yes, 0 = No.
typhabitat	  | Categorical (1–3) |	Type of housing: e.g., 1 = stable, 2 = unstable, 3 = homeless.
________________________________________
 *Dependencies*
 
Key R Packages (version used: 4.3.3)
•	tidyverse for data manipulation
•	survey for complex survey design modeling
•	openxlsx / writexl for Excel export
•	mfp for fractional polynomial modeling
•	here for relative path management
STATA (version used: STATA 18.0)
•	Used for fractional polynomial model selection : 4_frac_poly_functional_form.do
________________________________________
*Notes*

•	All file paths are handled with the here::here() function for portability.
•	Bootstrap models take time due to 2000 resampling loops (expected run time for demo on a personal computer: less than 4 minutes).
________________________________________
*Data Availability*

The original Coquelicot HCV dataset is not publicly shared due to privacy regulations and ethical restrictions. Instead, we provide fake data to allow full transparency of the methods and calculations. The code has been tested to ensure it runs correctly on these simulated datasets.
________________________________________
*Workflow and execution order*

1.	1_descriptive_2013.Rmd – Descriptive stats
2.	2_from_intermediate_to_final_dataset.Rmd – Data preparation
3.	3_prevalence_results_from_data_2013.Rmd – Data prevalence
4.	4_frac_poly_functional_form.do – Fractional polynomial STATA
5.	5_prevalence_results_from_model.Rmd – Model-based prevalence
6.	6_incidence_model_bootstrap.Rmd – Incidence estimation

