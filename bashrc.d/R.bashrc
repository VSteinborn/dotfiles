# R statistics

## Single Column Stats

# Run summary function on column of numbers to get mean, median, max, min and quartiles
# https://stackoverflow.com/questions/9789806/command-line-utility-to-print-statistics-of-numbers-in-linux#9826464
alias getcolumnstats="R --slave -e 'x <- scan(file=\"stdin\", quiet=TRUE); summary(x)'"
