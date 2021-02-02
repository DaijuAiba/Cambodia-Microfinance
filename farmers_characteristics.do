

/*
******************************
COMPUTING THE FARMERS AND BUDDYS CHARACTERISTICS
**********************************
Note: I use 1.5*iqr to identify extreme values or outliers
/* iqr is inter-quartile range */

*/



clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 1") firstrow


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1  {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c

local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 2") firstrow


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1  {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c

rename q5_1d q5_1d_n
local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP1") firstrow 


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c

rename q5_1d q5_1d_n
local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP2") firstrow

foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c

rename q5_1d q5_1d_n
local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PLN(Done)") firstrow


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e  {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c

rename q8_1 q8_1_n
local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SML(Done)") firstrow


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8  q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c 

rename q3_9 q3_9_n
rename q5_1d q5_1d_n
local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8  q3_10 q5_1c q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PST(Done)") firstrow


foreach var in q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1  {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}

gen q8_6b1=(q8_6b=="YES") if q8_6b!=""
gen q8_6c1=(q8_6c=="Reduce income") if q8_6c!=""
drop q8_6b q8_6c
rename q8_6b1 q8_6b
rename q8_6c1 q8_6c 

local char q1_13a_n q1_15a_n q2_2_n q2_4c_n q3_1_n q3_2_n q3_3_n q3_4_n q3_5_n q3_6_n q3_7_n q3_8_n q3_9_n q3_10_n q5_1c_n q5_1d_n q5_1e_n q8_1_n q1_13a q1_15a q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 q8_6b q8_6c

tabstat `char', stats(mean n) long col(stat)	


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20200903_Buddy Data_JICA_modified.xlsx", sheet("buddy_stata") firstrow


foreach var in no_farmer age fam_mem no_male no_female  {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
***Correction of the variables containing outliers
gen `var'_n =`var'
replace `var'_n  =Q1_`var'-1.5*IQR_`var' if `var' < Q1_`var'-1.5*IQR_`var' & ext_`var'==1
replace `var'_n =Q3_`var'+1.5*IQR_`var' if `var'> Q3_`var'+1.5*IQR_`var' &  ext_`var'==1
}
gen female=(gender=="Female")
gen married=(mar_status=="Married")

local char female married no_farmer_n  age_n fam_mem_n no_male_n no_female_n no_farmer  age fam_mem no_male no_female
tabstat `char', stats(mean n) long col(stat)	
