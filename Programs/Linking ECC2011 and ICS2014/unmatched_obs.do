

cd "G:\My Drive\cma_nix\Economic Survey"
use ecc_2011_f, clear
merge 1:1 id using "ies_2014_f", generate(merge)

reshape long year_start survey_area fileid gender_owner nationality_owner registration_status ownership_type office_type tenure_business kind_business area_business total_persons cambodian_persons foreigner_persons male_persons female_persons selfEmployed_total unpaid_total regularEmployees_total non_regularEmployees_total voluntary_total registered sales_monthly sales_daily expenses_monthly expenses_daily, i(id) j(year)

tab merge,m
drop if merge==3
tab fileid,m
keep if fileid==0
save "unmatched2011.dta", replace

************************************************

cd "G:\My Drive\cma_nix\Economic Survey"
use ecc_2011_f, clear
merge 1:1 id using "ies_2014_f", generate(merge)

reshape long year_start survey_area fileid gender_owner nationality_owner registration_status ownership_type office_type tenure_business kind_business area_business total_persons cambodian_persons foreigner_persons male_persons female_persons selfEmployed_total unpaid_total regularEmployees_total non_regularEmployees_total voluntary_total registered sales_monthly sales_daily expenses_monthly expenses_daily, i(id) j(year)

tab merge,m
drop if merge==3
tab fileid,m
keep if fileid==1
save "unmatched2014.dta", replace
********************************************************
cd "G:\My Drive\cma_nix\Economic Survey"
use unmatched2011, clear

dtalink   survey_area 15 -10 year_start 10 -5 ownership_type 10 -4 area_business 15 -3 gender_owner 5 -1 tenure_business 5 -1 kind_business 15 -5 nationality_owner 3 -1 office_type 3 -1 total_persons 3 -1 cambodian_persons 3 -1 foreigner_persons 3 -1 male_persons 3 -1 female_persons 3 -1 selfEmployed_total 3 -1 unpaid_total 3 -1 regularEmployees_total 3 -1 non_regularEmployees_total 3 -1 voluntary_total 3 -1 using unmatched2014, block(survey_area ownership_type gender_owner nationality_owner year_start) cutoff(55)

br _matchID _matchflag id survey_area year year_start ownership_type gender_owner nationality_owner fileid if _matchID!=.
drop if _matchID==.

/*
gen d_fileid=fileid[_n]-fileid[_n-1]
drop if d_fileid==0
br _matchID _matchflag id survey_area year fileid d_fileid year_start 
br

tab registered year, cell
*/
tab _matchID,m
tab year,m
rename id id_old
rename _matchID id

xtset id year, yearly

save "mergedNOTBYid.dta", replace

*****************************************************************


use mergedBYid, clear
append using mergedNOTBYid
desc
drop _file _id _score _matchflag id_old year2011 year2014
distinct id year fileid
br

tab registered year, cell

gen reg1=registered
replace reg1=3 if registered==1 & year==2014
gen d_reg1=reg1[_n]-reg1[_n-1]
br id year registered reg1 d_reg1

tab registered if year==2014 & d_reg1==0  /* Informal Informal */
tab registered if year==2014 & d_reg1==3  /* Informal Formal */
tab registered if year==2014 & d_reg1==-1  /* Formal Informal */
tab registered if year==2014 & d_reg1==2   /* Formal Formal */


tabulate twoway registered year
