

/*
******************************
IDENTIFYING THE BUDDYS AND FARMERS WITH INCOME AND EXPENDITURE OUTLIERS
**********************************
Note: I use 1.5*iqr to identify extreme values or outliers
/* iqr is inter-quartile range */

*/



clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 1") firstrow

ssc inst extremes 


foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
list q1_1 q1_6 `var' if ext_`var'==1	
}


/*
***Correction of the variables containing outliers
gen q2_2_n =q2_2
replace q2_2_n  =Q1_ext_q2_2-1.5*IQR_q2_2 if price < Q1_q2_2-1.5*IQR_q2_2 & ext_q2_2==1
replace q2_2_n =Q3_ext_q2_2+1.5*IQR_q2_2 if price> Q3_q2_2+1.5*IQR_q2_2 &  ext_q2_2==1
*/

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 2") firstrow

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
list q1_1 q1_6 `var' if ext_`var'==1	
}

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP1") firstrow 

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1e q8_1 {
list q1_1 q1_6 `var' if ext_`var'==1	
}

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP2") firstrow

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c  {
list q1_1 q1_6 `var' if ext_`var'==1	
}

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PLN(Done)") firstrow

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e {
list q1_1 q1_6 `var' if ext_`var'==1	
}

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SML(Done)") firstrow

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8  q3_10 q5_1c q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8  q3_10 q5_1c q5_1e q8_1 {
list q1_1 q1_6 `var' if ext_`var'==1	
}

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PST(Done)") firstrow

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
extremes `var'
extremes `var', iqr sep(0)
egen Q1_`var'= pctile(`var'), p(25)
egen Q3_`var'= pctile(`var'), p(75)
egen  IQR_`var'= iqr(`var')       /* iqr is inter-quartile range */
gen ext_`var'=1 if (`var'< Q1_`var'-1.5*IQR_`var' | `var'>Q3_`var'+1.5*IQR_`var') & missing(`var')==0
recode ext_`var' . =0
tab ext_`var'
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
list q1_1 q1_6 `var' if ext_`var'==1	
}
