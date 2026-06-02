// Import the CSV file
import delimited "./final/Coq_combined.csv", clear

// Optionally, check the data after importing
list in 1/10  

* Reference variable `edit`
gen edit_ref = (edit == 2004)

// Use mfp 
mfp logit antihcv age edit_ref 


svyset idy [pweight=wc] , strata(ville_num) singleunit(certainty)

svy: logit serohcv_binary  Iage__1  Iage__2 ib2004.edit


