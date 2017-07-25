# helpers.R


library(tidyverse); library(DT); library(data.table)

clean_laundromat_data <- function(dataframe) {
    clean <- dataframe %>% 
        arrange(RecID) %>% 
        filter(TransType == 100) %>% 
        select(RecID, DateTime, MachNo, CreditCardAmount, CashAmount, BalanceAmount, EmployeeUserID) %>% 
        mutate(TotalAmount = CreditCardAmount + CashAmount + BalanceAmount)
    
    # Convert timestamp into date/time 
    clean[,9:10] <- tstrsplit(clean$DateTime, " ", names = c("Date", "Time"))
    clean$Date <- as.Date(clean$Date, format = "%m/%d/%y")
    
    # Get weekday from date
    clean <- clean %>% 
        mutate(Weekday = weekdays(Date))
    
    
    clean$Weekday <- factor(clean$Weekday, 
                                levels = c("Sunday", "Monday", "Tuesday", 
                                           "Wednesday", "Thursday", "Friday", "Saturday"), ordered = TRUE) 
    
    # Get hour from time
    clean[,12:13] <- tstrsplit(clean$Time, ":", names = c("Hour", "Minute"))
    
    # No longer need DateTime or Time variables
    clean <- clean %>% 
        select(-c(DateTime, Time))
    
    clean
}
