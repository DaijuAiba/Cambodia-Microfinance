***********************************************************************************************************************************************************


/* LIMITING CMA-NIX dataset to the Target Districts only. */


keep if district_code=="0706" | district_code=="0705" | district_code=="0702" | district_code=="0801" | district_code=="0808" | district_code=="0503" | district_code=="1214" | district_code=="1211" | district_code=="1205" | district_code=="1209" | district_code=="1206" | district_code=="1208" | district_code=="0307" | district_code=="0313" | district_code=="0314" | district_code=="0803" | district_code=="0802" | district_code=="0809" | district_code=="0807" | district_code=="0808" | district_code=="0505" | district_code=="1209" | district_code=="1212" | district_code=="1207" 

/* (1) Preparing a table of amount of loans, number of borrowers, average loan size per borrower, the ratio of PAR30 for Maxima from 2017-2019. (For each district) [in KHR] */

tabstat amount_loan total_num_borrowers loan_size ratio_par_30 if  name=="MAXIMA" & year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)


/* (2) Amount of loans, number of borrowers, average loan size per borrower, and the ratio of PAR30 from 2017-2019 as average of existing MFIs in the target districts. [in KHR] */

tabstat amount_loan_usd total_num_borrowers loan_size_usd ratio_par_30 if  name=="MAXIMA" & year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)

/* (3) Preparing a table of amount of loans, number of borrowers, average loan size per borrower, the ratio of PAR30 for Maxima from 2017-2019. (For each district) [in USD] */
tabstat amount_loan total_num_borrowers loan_size ratio_par_30 if year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)

/* (4) Amount of loans, number of borrowers, average loan size per borrower, and the ratio of PAR30 from 2017-2019 as average of existing MFIs in the target districts. [in USD] */

tabstat amount_loan_usd total_num_borrowers loan_size_usd ratio_par_30 if year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)


