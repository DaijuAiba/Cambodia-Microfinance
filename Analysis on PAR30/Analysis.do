

use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2020q1-.dta",clear

*gen period= qofd(ReportingDate)
*format period %tq

gen PAR_ratio= par_30/amount_loan 
hist PAR_ratio if  PAR_ratio<1 & PAR_ratio>0


bysort FSPType: sum  PAR_ratio if  PAR_ratio<1 & period==tq(2020q1)
bysort FSPType: sum  PAR_ratio if  PAR_ratio<1 & period==tq(2020q2)
bysort FSPType: sum  PAR_ratio if  PAR_ratio<1 & period==tq(2020q3)


collapse (mean) PAR_ratio if  PAR_ratio<1 , by(period FSPType)

twoway (line PAR_ratio  period if FSPType=="1.Bank")(line PAR_ratio  period if FSPType=="2.MDI") (line PAR_ratio  period if FSPType=="3.MFI") ,legend( order(1 "Bank" 2 "MDI" 3 "MFI"))








use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2020q1-.dta",clear

collapse (sum) par_30  amount_loan  , by(period FSPType)
gen PAR_ratio= par_30/amount_loan 

twoway (line PAR_ratio  period if FSPType=="1.Bank")(line PAR_ratio  period if FSPType=="2.MDI") (line PAR_ratio  period if FSPType=="3.MFI") ,legend( order(1 "Bank" 2 "MDI" 3 "MFI"))




use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2020q1-.dta",clear

collapse (sum) par_30  amount_loan  , by(period mfi_name)
gen PAR_ratio= par_30/amount_loan 
graph hbar PAR_ratio if period==tq(2020q3), over(mfi_name, sort(PAR_ratio) label(labsize(tiny))) 








use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2020q1-.dta",clear

destring province_code,replace force

collapse (sum) par_30  amount_loan (first) Province  if FSPType=="1.Bank" | FSPType=="2.MDI" |FSPType=="3.MFI" , by(period province_code)
gen PAR_ratio= par_30/amount_loan  
list  Province province_code
 
graph hbar PAR_ratio if period==tq(2020q3), over(province_code, sort(PAR_ratio) relabel(1	"Banteay Meanchey"	///
2	"Battambang"	///
3	"Kampong Cham"	///
4	"Kampong Chhnang"	///
5	"Kampong Speu"	///
6	"Kampong Thom"	///
7	"Kampot"	///
8	"Kandal"	///
9	"Koh Kong"	///
10	"Kratie"	///
11	"Mondul Kiri"	///
12	"Phnom Penh"	///
13	"Preah Vihear"	///
14	"Prey Veng"	///
15	"Pursat"	///
16	"Ratanak Kiri"	///
17	"Siemreap"	///
18	"Preah Sihanouk"	///
19	"Stung Treng"	///
20	"Svay Rieng"	///
21	"Takeo"	///
22	"Oddar Meanchey"	///
23	"Kep"	///
24	"Pailin"	///
25	"Tboung Khmum"	)label(labsize(tiny)) )




foreach i of num 1/25{
	local command `command'   (line PAR_ratio  period if province_code==`i')
}
twoway `command' ,legend(order ( 1	"Banteay Meanchey"	///
2	"Battambang"	///
3	"Kampong Cham"	///
4	"Kampong Chhnang"	///
5	"Kampong Speu"	///
6	"Kampong Thom"	///
7	"Kampot"	///
8	"Kandal"	///
9	"Koh Kong"	///
10	"Kratie"	///
11	"Mondul Kiri"	///
12	"Phnom Penh"	///
13	"Preah Vihear"	///
14	"Prey Veng"	///
15	"Pursat"	///
16	"Ratanak Kiri"	///
17	"Siemreap"	///
18	"Preah Sihanouk"	///
19	"Stung Treng"	///
20	"Svay Rieng"	///
21	"Takeo"	///
22	"Oddar Meanchey"	///
23	"Kep"	///
24	"Pailin"	///
25	"Tboung Khmum"	))


twoway (dot  PAR_ratio province_code if period==tq(2020q3) ) (dot  PAR_ratio province_code if period==tq(2020q2) ), legend(order(1 "2020q3" 2 "2020q2"))
twoway (dot  PAR_ratio province_code if period==tq(2020q3) ) (dot  PAR_ratio province_code if period==tq(2020q1) ), legend(order(1 "2020q3" 2 "2020q1"))






use "Panel Data", clear
drop if MFI_id==1
drop if MFI_id==228

collapse (sum) amount_loan par_30 if Type==2, by(period)

gen PAR30_Ratio=par_30/amount_loan 
format period %tq
twoway (line PAR30_Ratio period )


use "Panel Data", clear
drop if MFI_id==1
drop if MFI_id==228

collapse (sum) amount_loan par_30 if Type==2 , by(Province_code period)

gen PAR30_Ratio=par_30/amount_loan 
format period %tq

twoway (dot PAR30_Ratio Province_code if period==tq(2020q3))  (dot PAR30_Ratio Province_code if period==tq(2019q3)), legend(order(1 "2020Q3" 2 "2019Q3")) xlabel( 1	"Banteay Meanchey"	///
2	"Battambang"	///
3	"Kampong Cham"	///
4	"Kampong Chhnang"	///
5	"Kampong Speu"	///
6	"Kampong Thom"	///
7	"Kampot"	///
8	"Kandal"	///
9	"Koh Kong"	///
10	"Kratie"	///
11	"Mondul Kiri"	///
12	"Phnom Penh"	///
13	"Preah Vihear"	///
14	"Prey Veng"	///
15	"Pursat"	///
16	"Ratanak Kiri"	///
17	"Siemreap"	///
18	"Preah Sihanouk"	///
19	"Stung Treng"	///
20	"Svay Rieng"	///
21	"Takeo"	///
22	"Oddar Meanchey"	///
23	"Kep"	///
24	"Pailin"	///
25	"Tboung Khmum"	, angle(90))


// Rural vs Urban


use "Panel Data", clear
drop if MFI_id==1
drop if MFI_id==228
gen PP=0
replace PP=1 if district_code>1200 & district_code<1300
gen urban_area=0
replace urban_area=1 if district_code==106 | district_code==203 | district_code==305 | district_code==403 | district_code==502 | district_code==603 | district_code== 708 | district_code==811 | district_code==904 | district_code==1002 |district_code== 1105 |PP==1 | district_code==1105 | district_code== 1308 |district_code==1410 | district_code==1505 |district_code== 1602 | district_code==1710 |district_code==1801 | district_code==1904 |district_code==2006 | district_code==2108 | district_code==2204 | district_code==2301 | district_code==2401 | district_code==2506


gen urban_loan= amount_loan if urban_area==1
gen rural_loan= amount_loan if urban_area==0


gen urban_borrower= total_num_borrowers if urban_area==1
gen rural_borrower= total_num_borrowers if urban_area==0




collapse (sum) amount_loan  rural_loan urban_loan rural_borrower total_num_borrowers,  by( period)


twoway (line rural_loan period )  (line urban_loan period )


// Rural vs Urban (MFI vs MDI)

use "Panel Data", clear
drop if MFI_id==1
drop if MFI_id==228
gen PP=0
replace PP=1 if district_code>1200 & district_code<1300
gen urban_area=0
replace urban_area=1 if district_code==106 | district_code==203 | district_code==305 | district_code==403 | district_code==502 | district_code==603 | district_code== 708 | district_code==811 | district_code==904 | district_code==1002 |district_code== 1105 |PP==1 | district_code==1105 | district_code== 1308 |district_code==1410 | district_code==1505 |district_code== 1602 | district_code==1710 |district_code==1801 | district_code==1904 |district_code==2006 | district_code==2108 | district_code==2204 | district_code==2301 | district_code==2401 | district_code==2506


gen urban_loan= amount_loan if urban_area==1
gen rural_loan= amount_loan if urban_area==0


gen urban_borrower= total_num_borrowers if urban_area==1
gen rural_borrower= total_num_borrowers if urban_area==0




collapse (sum) amount_loan  rural_loan urban_loan rural_borrower urban_borrower total_num_borrowers,  by(Type2 period)


twoway (line rural_loan period if Type2==2 )  (line urban_loan period if Type2==2 )

twoway (line rural_loan period if Type2==3 )  (line urban_loan period if Type2==3 )

twoway (line rural_borrower period if Type2==2 )  (line urban_borrower period if Type2==2 )

twoway (line rural_borrower period if Type2==3 )  (line urban_borrower period if Type2==3 )

graph bar (sum) urban_borrower rural_borrower if Type2==3,over(period,label(angle(90))) stack percent
graph bar (sum) urban_borrower rural_borrower if Type2==2,over(period,label(angle(90))) stack percent

graph bar (sum) urban_loan rural_loan if Type2==3,over(period,label(angle(90))) stack percent
graph bar (sum) urban_loan rural_loan if Type2==2,over(period,label(angle(90))) stack percent

gen average_loan_size_rural= rural_loan/rural_borrower
gen average_loan_size_urban= urban_loan/urban_borrower 



twoway (line average_loan_size_rural period )  (line average_loan_size_urban period ) if Type2==2 ,legend(order(1 "Rural Area" 2 "Urban Area")) title(MDI)
twoway (line average_loan_size_rural period )  (line average_loan_size_urban period ) if Type2==3 ,legend(order(1 "Rural Area" 2 "Urban Area")) title(Non-MDI)











