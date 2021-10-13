 use "C:\2014-2015 Cambodia Survey\ec2011\MatrixData_V13.dta", clear
 cd "C:\2014-2015 Cambodia Survey\Result_ Enterprises_Cambodia"
tab   Q3_2 if Q15==1

label variable Q21_1 "Operating revenue"
label variable Q21_2  "Operating Cost"
label variable Q21_3  "Other revenues"
label variable Q21_4 "Operating Expenses"
label variable Q21_5 "Interest Expenses paid to Residents"
label variable Q21_6 "Interest Expenses paid to Non-Residents"
label variable Q21_7 "Profit tax"

gen region=Q1_1*100+ Q1_2

replace Q9=. if Q9>2500

gen ln_sales=log(Q16_1A)
replace ln_sales=log(Q21_1/12) if Q15==1

la define ownership 1	"Cambodian	" 2	"Chinese"  3 "Korean" 4	"Vietnamese" 5 "Other Asian Countries" 6 "American and European" 7	"Others"
la value Q3_2

//Sales

*hist Q16_1M if Q16_1M >0
sum Q16_1M if Q16_1M >0


//Operatimg cost
sum Q21_2 if Q21_2>0


// Other revenues
sum Q21_3 if Q21_3>0

//Operating Expenses
sum Q21_4 
sum Q21_4 if Q21_4>0


//Interest Expenses paid to residents
sum Q21_5 
sum Q21_5 if Q21_5>0

//Interest Expenses paid to non-residents
sum Q21_6 
sum Q21_6 if Q21_6>0

//Profit tax
sum Q21_7 
sum Q21_7 if Q21_7>0


gen revenue=Q21_1+Q21_3
gen cost=Q21_2+ Q21_4
gen  profit=revenue-cost

gen roa=profit/Q17


gen NDT=Q21_1-Q21_5 -Q21_6 -Q21_7/0.2

//Capital structure 

gen deb_asset = ( Q19+ Q20)/Q17
gen debt_ratio= ( Q19+ Q20)/(Q18+Q19+ Q20)
gen long_debt_ratio= ( Q19)/(Q18+Q19)
gen long_debt_ratio2= ( Q19)/(Q18+Q19+ Q20)

gen capital_adequecy=Q18/Q17

*twoway (scatter  revenue  cost ) (function y=x ,range( 0 400000000)),scale(0.5)



//regression
 tab  deb_asset
 gen state=0
 replace state=1 if Q5==11 
 
 gen foreign=0
 replace foreign =1 if Q3_2>1
 
 
 gen foreign1=0
 replace foreign1 =1 if Q3_2>1 & (Q5!=7& Q5!=8&Q5!=9) 
 
 
 gen ln_asset=log(Q17)
gen  ratio_fixed=Q17_1/Q17
gen foreign2=0
replace foreign2=1 if Q5==7 |Q5==8|Q5==9 
 
 
 la define sub 1 "Subsidiary" 
 
 la value foreign2 sub
la var foreign2 "Subsidiary of foreign company"


 
tab region  if deb_asset!=. &deb_asset>0
 

 
la var foreign "Foreign-owned"
la var state "State-owned"
la var ratio_fixed "Ratio of fixed assets"
la var deb_asset "Debt/Asset" 
la var debt_ratio "Debt/Asset "
la var Q9 "Operation period"
la var roa "ROA"
la var long_debt_ratio "Long term debt/Assets"
label define sec 1 "Mining and quarrying" 2 "Manufacturing" 3 "Electricity, gas, steam and air conditioning supply" 4 "Water supply; sewerage, waste management and remediation activities" ///
 5 "Construction" 6 "Wholesale and retail trade; repair of motor vehicles and motorcycles" 7 "Transportation and storage" 8 "Accommodation and food service activities" ///
 9 "Information and communication" 10 "Financial and insurance activities" 11 "Real estate activities" 12 "Professional, scientific and technical activities" ///
 13 "Administrative and support service activities" 14 "Education" 15 "Human health and social work activities" 16 "Arts, entertainment and recreation" ///
 17 "Other service activities"
 

labe value Q11_SEC_Serial sec

label define foreign 1 "Foreign-owned" 0 "Local"
la value foreign foreign 


label define state 1 "State-owned" 0 "Private"

tabstat long_debt_ratio2 if long_debt_ratio>=0 & long_debt_ratio<=2,by(Q11_SEC_Serial) s(mean n) 
tabstat debt_ratio if debt_ratio>=0 & debt_ratio<=1,by(Q11_SEC_Serial) s(mean n) 


gen Depreciation= Q21_4_14

save "Economic Census 2011",replace




use  "Economic Census 2011",clear
tab Q3_2,gen(ownership)

gen no_register=0
replace  no_register=1 if Q5==1




drop  if Q11_SEC_Serial==10 | Q5==12
 

sutex2 Q17  
sutex2 Q17 if Q15==1

latab Q11_SEC_Serial ,replace  tf(table_industry1) 
 
latab Q11_SEC_Serial if deb_asset>0 & deb_asset<=2,replace  tf(table_industry) 

 sutex2  debt_ratio long_debt_ratio roa capital_adequecy ratio_fixed state  foreign ownership1 ownership2 ownership3 ownership4 ownership5 ownership6 ownership7 if deb_asset>0 & deb_asset<=2,saving(table_descriptive) replace ///
  varlabels  percentiles(50)  minmax caption(Descriptive statistics)

 label value  Q11_SEC_Serial

  

  tab Q5   Q3_2 if   debt_ratio>0 & debt_ratio<=2
 //=============================
sum  deb_asset debt_ratio long_debt_ratio roa capital_adequecy ratio_fixed i.state i.Q3_2 i.foreign if deb_asset>0 & deb_asset<=2

sum  deb_asset debt_ratio long_debt_ratio roa capital_adequecy ratio_fixed i.state i.Q3_2 i.foreign if debt_ratio>0 & debt_ratio<=1
 
reg deb_asset roa ln_asset ratio_fixed Q9 i.state  i.foreign1 i.foreign2    i.Q11_SEC_Serial if deb_asset>0 & deb_asset<3,robust
est store model1


reg deb_asset  roa ln_asset ratio_fixed i.foreign1#c.roa   i.foreign1#c.ln_asset   i.foreign1#c.ratio_fixed i.foreign1#c.Q9   ///
 i.state     i.foreign1 i.foreign2    i.Q11_SEC_Serial if deb_asset>0 & deb_asset<2,robust
est store model2

reg debt_ratio roa ln_asset ratio_fixed Depreciation Q9  i.state      i.foreign1 i.foreign2  i.Q11_SEC_Serial if debt_ratio>0 & debt_ratio<=2,robust
est store model3



reg debt_ratio roa ln_asset ratio_fixed Depreciation Q9  i.foreign1 i.foreign2     i.Q11_SEC_Serial    if debt_ratio>0 & debt_ratio<=2,robust

est store model4



reg debt_ratio  roa ln_asset ratio_fixed c.Depreciation i.foreign1#c.roa   i.foreign1#c.ln_asset   i.foreign1#c.ratio_fixed i.foreign1#c.Q9 i.foreign1#c.Depreciation  ///
 i.state     i.foreign1 i.foreign2    i.Q11_SEC_Serial  if debt_ratio>0 & debt_ratio<=2,robust
est store model5

reg long_debt_ratio roa ln_asset ratio_fixed Q9   i.foreign1#c.roa   i.foreign1#c.ln_asset   i.foreign1#c.ratio_fixed i.foreign1#c.Q9  i.foreign1 i.foreign2 Depreciation i.Q11_SEC_Serial i.foreign1#c.Depreciation  if long_debt_ratio>0 & long_debt_ratio<=1,robust
est store model6



tobit debt_ratio roa ln_asset ratio_fixed Q9 Depreciation i.foreign1#c.roa   i.foreign1#c.ln_asset   i.foreign1#c.ratio_fixed i.foreign1#c.Q9 i.state i.foreign1#c.Depreciation     i.foreign1 i.foreign2  i.Q11_SEC_Serial if  debt_ratio<=1,ll(0)
est store model7


esttab  model3 model4 model5 model6 using regression_debt.tex, replace label title(Regression of Debt ratio ) ///
       star(* 0.10 ** 0.05 *** 0.01)  stats( F r2_a N,labels( "F value" `"Adjested \(R^{2}\)"' `"Observations"' `"LR chi2"' ) ) long

esttab   model7 using regression_debt2.tex, replace label title(Regression of Debt ratio ) ///
       star(* 0.10 ** 0.05 *** 0.01)  stats( F r2_a N,labels( "F value" `"Adjested \(R^{2}\)"' `"Observations"' `"LR chi2"' ) ) long

margin  ,dydx(state foreign1 foreign2  )  atmeans
