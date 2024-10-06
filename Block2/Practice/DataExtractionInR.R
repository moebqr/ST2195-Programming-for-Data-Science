
# nile = scan("nile.txt")

# print(nile)

# cat(nile, file="nile1.txt", sep = ",")

# typeof(nile)    

# hist(nile)

# nile_char <- scan("nile.txt", what = character())

# typeof(nile_char)

## Can be done through Scan(), read.table(), read.csv(), read.csv2(), and readr
runnning_data <- read.table("running_dat.tsv", header = TRUE, sep = "\t")
print(runnning_data)

read.csv("running_dat.csv")

## Exporting / Writing using write.table(), write.csv() and write.csv2() are also viable options

write.table(runnning_data, file = "running.dat", sep = "^^", dec = "*")
