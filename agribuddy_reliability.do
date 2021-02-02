*
*
/*
******************************
RELIABILITY ANALYSIS FOR AGRIBUDDY DATA
**********************************
*/

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("BTB 1") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "btb1_e", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("BTB 2") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "btb2_e", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SRP1") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "srp1_e", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SRP2") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "srp2_e", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("PLN") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "pln_e", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SML") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "sml_e", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("PST") firstrow

keep q0_1 q0_2 q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q8_6b q8_6c

destring q6_10, replace force
tabstat q6_10, by(q1_18) stat(mean sd n min max)


foreach var in q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 {
destring `var', replace force
}

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(mean sd n min max)

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "pst_e", replace

**************************************
clear all
cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
append using "btb1_e" "btb2_e" "srp1_e" "srp2_e" "pln_e" "sml_e" "pst_e"

collapse(mean) q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, by(q0_2)

tabstat q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income, stat(n mean sd min max)


