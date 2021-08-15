# Consequence of M&A on Lending Behavior of Microfinance Institutions


Daiju Aiba (JICA Ogata Research Institute)
<br>
<br>
August 2021
<br>
<br>

## 1. Introduction
In recent years, microfinance insitutions (MFIs) have palyed an important role in poverty allevaition thtough financial inclusion for developing countries. Along with the recent prosperity of MFIs, there are also a flood of capital inflow into them. The capital inflow takes various forms, such as debt and equity investment, and there exsit a variety of investers and lenders. According to El-zoghbi (2011) and Reille et al. (2011), those investors could be categorized into:
- Individuals
- Retail investors (Such as Oikocredit (Netherlands), responsAbility (Switzerland)), 
	- Retail investors represent 16 percent of the total stock of cross-border funding (Rellie et al., 2011).
- Institutional investors (Commercial banks, insurance companies, pension funds, private equity firm, and other corporate companies.)
- Development financial institutions (such as AECID, EBRD, IFC, KfW, and OPIC)      
    - The development financial institutions could be furhter devided into bilateral and multilateral entities.

 Generally, retail investors have big social goals. Although retail investor demand for microfinance is strong, its growth has been hampered by financial market regulations that do not allow microfinance investment funds distribution to the retail market in the United States and Europe (Rellie et al., 2011) Institutional investors are usually attracted by three features of microfinance, namely its social value, its perceived attractive risk-adjusted returns, and its potential negative correlation from other asset classes. Capital inflow from those investers have assisted the evolution of MFIs in developing countries.

In the meantime, there are several concerns of recent capital inflow into MFIs. Although capital inflow into MFIs have assisted financial inclusion, it could also encourage commercialization of MFIs and even foster mission drift. Particularly, merger & aquisition (M&A) of MFIs by private institutional investors have increased rapidly in recent years. Through M&A, the ownership and governamce mechanism of MFIs could be severely changed. Thus, the obejective of the MFIs could be distorted after the M&A cases.


In this study, we aim to empirically estimate the effect of M&A cases of MFIs on MFI lending behavoir, such as amounts of outstanding loans, and loan size per borrower, the total number of borrowers, and the ratio of female borrowers. For this purpose, we use a difference-in-difference approach, and employ the detailed data of MFI lending at MFI-district pair data from Cambodia Microfinance Association.


<br>

## 2. Literature of M&A 
### 2.1 
Before 2000, the microfinance sector includes about 370,651 clients in 2001, representing 17 percent of all households and 29.3 million USD loans outstanding. The major service providers include ACLEDA, PRASAC, EMT, CRS/TCP, and CCB. The market leaders, ACLEDA and EMT, represent 36 and 64 percent of clients and loans outstanding. The National Bank of Cambodia made the registration and licensing of entities providing credit and savings activities. These include preparing the law on Banking and Financial Institutions on November 18, 1999, and the statute on the licensing of Specialized Banking Institutions (SBIs) and Microfinance Institutions (MFIs).[^1]  

One example of M&A cases of MFIs in Cambodia can be the merging of Thaneakea Phum Project (TPP). TPP is a village banking project initiated by Catholic Relief Services’ (CRS) Cambodia program in 1994 and financed by McKnight Foundation, USAID, Development Capital, and CRS private funds. The project aimed at increasing access to rural financial services for the poor, particularly women and strengthening the institutional capacity and policy awareness of NGOs and the government in microfinance activities. The target areas were eight provinces (158 communes) through six local NGOs and two CRS direct retail branch offices.  

Major challenges of MFIs in Cambodia include the exclusion of the poorest of the poor from the primary target of the institutions, difficulty in reaching the poorest of the poor in the remote rural areas, the high competitive interest rates offered by the MFIs in Cambodia, managing risks of their operations, and the rapidly increasing multiple lending taken by borrowers (Tahir and Tahrim, 2015).  

Driving factors for the effort to merge TPP’s operations into a regulated MFI include providing sustainable and effective services to the poor in larger numbers and expanding the service into under-served areas, achieving economies of scale; in terms of consolidating planning and management information and financial administrations systems, aiming to be a best MFI in Cambodia, improving the viability and sustainability of financial service delivery to the poor, and increasing job security. 


<br>

### 2.2 M&A in Cambodia
In Cambodia, there have been 81 microfinance institutions, including six microfinance deposit-taking institutions by the end of 2020.   The National Bank of Cambodia (NBC) put several regulations to facilitate and monitor the operations of microfinance institutions and other financial institutions. Also, NBC has been revising several of such regulations recently. Some of these revisions include the modifications in the minimum capital requirement, independency of management, net-worth computation, liquidity coverage ratio, solvency ratio, capital buffer, and interest rate ceilings, among others.  

<br>

## 3. Empirical Methodology 
### 3.1 Empirical Model
We use difference-in-difference approach for estimating the impact of M&A cases. Specifically, we use the following specification for the estimation.  
<br>



<img src="https://render.githubusercontent.com/render/math?math=y_{ijt} = \Sigma_{k=-4}^{-1} \beta_{k} \times treat_{ik}%2B \Sigma_{k=0}^{4} \beta_{k} \times treat_{ik} %2B \gamma X_{it} %2B \mu_i %2B \nu_{jt} %2B \epsilon_{ijt}"><br>
<br>


<!-- 
 $$ y_{ijt} = \Sigma_{k=-4}^{-1} \beta_{k} \times treat_{ik} + \Sigma_{k=0}^{4} \beta_{k} \times treat_{ik}+\gamma X_{it} + \mu_i+\nu_{jt} + \epsilon_{ijt} $$ 
-->

$treat_{ik}$ is a dummy variable taking one if observation periods relative to the group 
g ’s first treated period is the same value as k; 0 otherwise, and it also takes 0 for all never-treated groups. Estimation is  performed with standard errors clustered at a district level.  
 We also include the time-variant district-level fixed effect, $\nu_{jt}$. Khwaja and Mian (2008) developed the model to include the time-invariant 

Futhermore, we also examine the heterogenious impact of the M&A cases. The M&A cases could drive MFIs from proverty alleviation mission, and could increase loan provision to developed areas. To examine such changes in MFI lending behavior, we include the interactio terms of the treatment dummy with indicators of economic development. Specifically, we extened the model to the following specification.  


<br>



<img src="https://render.githubusercontent.com/render/math?math=y_{ijt} = \Sigma_{k=-4}^{-1} \beta_{k} \times treat_{ik}%2B \Sigma_{k=0}^{4} \beta_{k} \times treat_{ik} %2B  \Sigma_{k=-4}^{-1} \delta_{k} \times treat_{ik} \times  PopDensity_{kt} %2B \Sigma_{k=0}^{4} \delta_{k} \times treat_{ik} \times  PopDensity_{jt} %2B \gamma X_{it} %2B \mu_i %2B \nu_{jt} %2B \epsilon_{ijt}"><br>
<br>

where $PopDensity_{jt}$ is an indicator of economic development in district $j$ at time $t$. Coefficient of interaction term $\delta_{k}$ captures a heterogeneity of the impact of M&A. If MFIs increase the loan provision to the developed areas relatively, we expect that $\delta_{k}>0$.

<br><br>
### 2.2 Data and Variables
For the estimation, we constrcuted the dataset from three sources. Firstly, the data relating to MFI lending is extracted from the CMA-NIX database. Secondly, the data represeting MFI's financial condition is extracted from the NBC Supervision Annual Report. Thirdly, we also collected the data of mergers and aquisitions in the Cambodian MFI sector via website of each MFI and local newspapers. 

The variables representing MFI lending behavior are the loan amount, total number of borrowers, loan size (ratio of the loan amount to the total number of borrowers), and ratio of female to the total number of borrowers.  

The treatment variable represent M&A cases of MFIs. We create a dummy variable taking a value of 1 for MFIs if their shares are aquisitied by other shareholders, based on MFIs’ webpages and annual reports.  

<br>

<h3 align="center">
Table 1: M&A cases by years (2009-2019)</h3>

|Year| Number of Cases | Percent. |
| ---: |:---:| ---: |
|2012 | 1 |3.85 |
|2014 | 1  |  3.85     | 
|2015 |  2   |     7.69    | 
|2016 |  7    |   26.92   |   
|2017 | 6     |  23.08  |    
|2018   |6|23.08 |     
 |2019 | 2       | 7.69|     


<br><br>

## 4. Results 
Table 1 shows the results of the estimation. Firstly, the results of estimation show the parallel trends between treatment and control groups before the M&A cases, although there were statistically significant decline one year before the M&S cases for the female borrower ratio. It suggests that the changes in the trend of MFI lending after the M&A cases are likely to be interpreted as causal impacts.  

The results show that, due to M&A cases, amounts of outstanding loan have increased on average. In four-year span, The increases in outstanding loan was 50%-100%, suggesting that M&A cases contributed to the expansion of loan portfolio of MFIs in Cambodia.




<h3 align="center">
Figure 1: Estimated ATE Effects</h3>

<figure>
     <img src="Graph_Event_Study/EventStudy.png" alt="Table 1" title="Table 1" />
    Note: A red-colored line in each panel represents the average of coefficients before the event.
</figure>

<br>
Next, we estimated the model of Equation 2, which includes the interaction terms of population density. Figure 2 shows the estimated coefficients of interaction terms of population density.  


<br>
<br>

<h3 align="center">
Figure 2: Coefficients of Interaction terms of Population Density</h3>
<figure>
     <img src="Graph_Event_Study/EventStudy2.png" alt="Table 1" title="Table 1" />
    Note: A red-colored line in each panel represents the average of coefficients before the event.
</figure>

<br>
<br>


## Refenrence 
- Tahir, Izah Mohd, and Tahrim, Siti Nurzahira Che. 2015. Efficiency and Productivity Analysis of Microfinance Institutions in Cambodia: A DEA Approach, International Review of Business Research Papers, 11, 1, 25-42.


[^1]: See https://www.crs.org/sites/default/files/tools-research/mergers-in-microfinance.pdf
