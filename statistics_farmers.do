************************************************************
***********************************************************
**********************************************************
***************************************************************
/*
******************************
COMPUTING STATISTICS FOR FARMER'S DATA
**********************************

*/

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 1") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female
gen ratio_female_n=q1_15a/ext_fam_mem


tabstat ext_fam_mem, stats(mean sd median min max n iqr)
tabstat ratio_female_n, stats(mean sd median min max n iqr)

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 2") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP1") firstrow 

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP2") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female
******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PLN(Done)") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SML(Done)") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female

******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PST(Done)") firstrow

tab q1_13a,m  /* Number of family members */
rename q1_13a fam_mem 
sum fam_mem
tabstat fam_mem, stats(mean sd median min max n iqr)

egen Q1_fam_mem= pctile(fam_mem), p(25)
egen Q3_fam_mem= pctile(fam_mem), p(75)
egen  IQR_fam_mem= iqr(fam_mem)       /* iqr is inter-quartile range */
gen ext_fam_mem=1 if (fam_mem< Q1_fam_mem-1.5*IQR_fam_mem | fam_mem>Q3_fam_mem+1.5*IQR_fam_mem) & missing(fam_mem)==0
recode ext_fam_mem . =0
tab ext_fam_mem

tab q1_15a  /* Number of female farmers */
gen ratio_female=q1_15a/fam_mem
sum ratio_female

