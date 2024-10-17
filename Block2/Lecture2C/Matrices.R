# Example: Earning of Two Merchants

# Create earnings vector for merchant John
earnings_John <- c(50, 60, 55, 74, 80)

# Create earnings vector for merchant Jane
earnings_Jane <- c(53, 57, 79, 88, 93)

# Create vector containing names of the days of the week
weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Create vector containing names of the merchants
merchant_names <- c("John", "Jane")

# Creating a matrix to store the merchants' earnings together
earnings_combined <- matrix(c(earnings_John, earnings_Jane), byrow = TRUE, nrow = 2)

# Name the matrix rows and columns
rownames(earnings_combined) <- merchant_names
colnames(earnings_combined) <- weekdays

# View the matrix (by printing) - Alternatively, just enter earnings_combined in the terminal
# print(earnings_combined)

# Creating earnings vectors for weekend
earnings_John_weekend <- c(110, 120)
earnings_Jane_weekend <- c(100, 130)
weekends <- c("Saturday", "Sunday")
merchant_names

earnings_combined_weekend <- matrix(c(earnings_John_weekend, earnings_Jane_weekend), byrow = TRUE, nrow = 2)

# Assign row and column names
rownames(earnings_combined_weekend) <- merchant_names
colnames(earnings_combined_weekend) <- weekends

# Viewing Weekend Matrix
# print(earnings_combined_weekend)

# Merge Weekday and Weekend Matrices
earnings_whole_week <- cbind(earnings_combined, earnings_combined_weekend)

# print(earnings_whole_week)

# Now add earnings vector for new merchant Tim
earnings_Tim <- c(40, 48, 75, 65, 29, 67, 84)

# Add earnings_Tim to earnings_whole_week
earnings_whole_week <- rbind(earnings_whole_week, earnings_Tim)

# Update the row names
rownames(earnings_whole_week) <- c("John", "Jane", "Tim")

# View updated Matrix
# print(earnings_whole_week)

# Total earnings for the three merchants per day
total_earnings_per_day <- colSums(earnings_whole_week)
# print(total_earnings_per_day)

# Total Earnings per Metchant for the whole weeek
total_earnings_per_week <- rowSums(earnings_whole_week)
# print(total_earnings_per_week)

# Select only first row
John_Only <- earnings_whole_week[1,]
# print(John_Only)

# Select only first and third rows
John_and_Tim_only <- earnings_whole_week[c(1,3),]
# print(John_and_Tim_only)
# PRINTS AS:
#      Monday Tuesday Wednesday Thursday Friday Saturday Sunday
# John     50      60        55       74     80      110    120
# Tim      40      48        75       65     29       67     84

Thursday_to_Sunday <- earnings_whole_week[,c(4:7)]
# print(Thursday_to_Sunday)

# Trick
Advanced_Matrix <- earnings_whole_week[c(1,3),c(4:6)]
# print(Advanced_Matrix)

Super_Advanced <- earnings_whole_week[c("John", "Tim"),c(4:7)]
print(Super_Advanced)