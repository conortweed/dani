\name{sample.size.NI}
\alias{sample.size.NI}
\title{
  Sample size calculation tool for Non-Inferiority trials
}
\description{
A function for calculating sample size of a non-inferiority trial. 
}
\usage{
sample.size.NI(p0.expected, p1.expected, NI.margin, sig.level=0.025, 
               power=0.9, r=1, scale="RD", print.out=TRUE, var.type="AA")  
}
\arguments{
\item{p0.expected}{Expected event risk in the control arm.}
\item{p1.expected}{Expected event risk in the active arm.}
\item{NI.margin}{Non-inferiority margin. Can be either risk difference, risk ratio, odds ratio or arc-sine difference.}
\item{sig.level}{One-sided significance level for testing. Default is 0.025, i.e. 2.5\%.}
\item{power}{Power of the trial, i.e. one minus type-II error of the study. Default is 0.9, i.e.90\%.  }
\item{r}{Allocation ratio, i.e. ratio between sample sizes in the active and control goups. Deafault is 1.}
\item{scale}{The scale on which we define the non-inferiority trial. Can be one of "RD" (Risk      difference), "RR" (risk ratio), "OR" (odds ratio) or "AS" (arc-sine difference).}
\item{print.out}{Logical. If FALSE, no output is printed.}
\item{var.type}{A string that indicates whether the variance in the sample size calculation is calculate dunder the null or the alternative for the two terms in the formula: the first is that multiplied by z_alpha, the second that multiplied by z_beta. Can be either "AA", "NA" or "NN". "AA" is appropriate for the Wald test, "NA" for the score test. Defaults to "AA".}

}
\details{
 This is a function to calculate sample size needed to test non-inferiority of an active treatment against the control within a specific NI margin. The margin can be specified on a number of different scales. 
 }
 
\value{
The output is a vector ss, containing the sample sizes for the control and active arms respectively.
}

\examples{

  p0.expected<-0.05 # Expected control event rate
  p1.expected<-p0.expected # Same as expected active event rate
  NI.marg.RD<-0.05  # Non-inferiority margin on risk difference scale
  NI.marg.RR<-NI.marg.OR<-2  # Non-inferiority margin on risk or odds ratio scale
  # Non-inferiority margin on arc-sine difference scale:
    NI.marg.AS<-arcsine.margin(p1.expected+NI.marg.RD, p0.expected) 

  r<-1       # Allocation ratio
  power<-0.9 # Power
  alph<-0.025 # Significance level

sample.size.RD<-sample.size.NI(sig.level=alph, power=power, 
   p0.expected=p0.expected, p1.expected=p1.expected, 
   NI.margin=NI.marg.RD, r=r)  # Risk difference scale
sample.size.RR<-sample.size.NI(sig.level=alph, power=power, 
   p0.expected=p0.expected, p1.expected=p1.expected, 
   NI.margin=NI.marg.RR, r=r, scale="RR")  # Log-risk ratio scale
sample.size.AS<-sample.size.NI(sig.level=alph, power=power, 
   p0.expected=p0.expected, p1.expected=p1.expected, 
   NI.margin=NI.marg.AS, r=r, scale="AS")  # Arc-sine difference scale
sample.size.ORD<-sample.size.NI(sig.level=alph, power=power, 
   p0.expected=p0.expected, p1.expected=p1.expected, 
   NI.margin=NI.marg.OR, r=r, scale="OR")  # Log-odds ratio scale

}