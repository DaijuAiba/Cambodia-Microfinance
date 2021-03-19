
clear matrix
clear mata
set emptycells drop 

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
clear
append using "2014q4_n" "2015q4_n" "2016q4_n" "2017q4_n" "2018q4_n" "2019q4_n", force



*********************************************************************
/* DESCRIPTIVE ANALYSIS ON RATIO OF RURAL LOAN AND FEMALE LOAN */
*********************************************************************

/* GENERATING VARIABLES */

keep amount_loan amount_deposit reschedule_loan ratio_reschedule_loan write_off ratio_write_off total_num_borrowers num_male_loan num_female_loan total_num_depositors num_male_deposits num_female_deposits district_code district_name year

drop if year<2014

gen urban=(strpos(district_name, "(Krong)")>0) /* "Krong" is city/town in Khmer */
tab urban,m

gen loan=amount_loan
replace loan=0 if amount_loan==.
gen rLoan=loan*(urban==0)
gen rLoan_ratio=rLoan/loan
*replace rLoan_ratio=0 if loan==0

gen rBorrowers=total_num_borrowers*(urban==0)
gen rBorrowers_ratio=rBorrowers/total_num_borrowers
*replace rBorrower_ratio=0 if total_num_borrowers==0

gen fBorrowers=num_female_loan 
replace fBorrowers=0 if num_female_loan==.
gen fBorrowers_ratio=fBorrowers/total_num_borrowers
*replace fBorrowers_ratio=0 if total_num_borrowers==0

sum loan rLoan rLoan_ratio total_num_borrowers rBorrowers rBorrowers_ratio fBorrowers fBorrowers_ratio

/* DESCRIPTIVE ANALYSIS */


tabstat rBorrowers, by(year)  stat(mean sd n) nototal long
tabstat rBorrowers_ratio, by(year)  stat(mean sd n) nototal long
tabstat fBorrowers, by(year)  stat(mean sd n) nototal long
tabstat fBorrowers_ratio, by(year)  stat(mean sd n) nototal long


cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"
bys year: egen m_rBorrowers=mean(rBorrowers)
bys year: egen m_rBorrowers_ratio=mean(rBorrowers_ratio)
bys year: egen m_fBorrowers=mean(fBorrowers)
bys year: egen m_fBorrowers_ratio=mean(fBorrowers_ratio)

line m_rBorrowers m_fBorrowers year, sort(year) title("", size(medium)) ///
xtitle("Year", size(medium)) ytitle("Number of Rural and Female Borrowers", size(medium)) ///
legend(pos(12) ring(0) col(1) lab(1 "Rural borrowers") lab(2 "Female borrowers ")) scheme(s2mono)
graph save "rural_female_borr.gph", replace
graph export rural_female_borr.png, replace

* Using ratio

line m_rBorrowers_ratio m_fBorrowers_ratio year, sort(year) title("", size(medium)) ///
xtitle("Year", size(medium)) ytitle("Ratio of Rural and Female Borrowers", size(medium)) ///
legend(pos(6) ring(0) col(1) lab(1 "Rural borrowers ratio") lab(2 "Female borrowers ratio ")) scheme(s2mono)
graph save "rural_female_ratio.gph", replace
graph export rural_female_ratio.png, replace


