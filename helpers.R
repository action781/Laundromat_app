# helpers.R

clean_laundromat_data <- function(dataframe) {
    clean <- dataframe %>% 
        arrange(RecID) %>% 
        filter(TransType == 100) %>% 
        select(RecID, DateTime, MachNo, CreditCardAmount, CashAmount, BalanceAmount, EmployeeUserID) %>% 
        mutate(TotalAmount = CreditCardAmount + CashAmount + BalanceAmount)
    clean
}