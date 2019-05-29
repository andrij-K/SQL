LOAD DATA

INFILE 'SalesJan2009.csv'

INTO TABLE andruha.SALES
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS(Transaction_date, Product, Price, Payment_Type)

