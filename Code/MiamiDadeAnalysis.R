library(tidyverse)
library(lubridate)

setwd("/Users/madisonvolpe/Desktop")
books <- read.csv("JailBookins_1.19.csv")

books$Charge1 <- as.character(books$Charge1) 
books$Charge2 <- as.character(books$Charge2) 
books$Charge3 <- as.character(books$Charge3)

charges <- data.frame(charges = sort(books$Charge1)) 
charges2 <- data.frame(charges = sort(books$Charge2)) 
charges3 <- data.frame(charges = sort(books$Charge3))

charges <- rbind(charges,charges2,charges3)
charges <- charges[!duplicated(charges$charges),]

rel_charges <- c("")

# 322340010A - DWLS (No Prior Felony)
# 32234002B -  DWLS/2ND OFFENSE
# 32234002C - DWLS/3RD & SUBS OFFN
# 32420101  - DWLS/FIN RESP/REFUSE
# 322340010B2 - DWLS/FIN SUSP/SUB V (subsequent violation)
# 322340010B1 - DWLS/FINANCIAL SUSP
# 32234005    - DWLS/HABITUAL
# 32234002A   - DWLS/KNOWINGLY