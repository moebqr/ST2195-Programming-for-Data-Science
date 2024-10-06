library("xml2")

stats_people <- read_xml("statisticians.xml")

# print(stats_people)

# xml_name(stats_people)
# print(stats_people)

## Can be thought of .FindMany() in Prisma ORM or similar to a normal SQL query
surname_nodes <- xml_find_all(stats_people, ".//surname")

print(surname_nodes)


## XML to DataFrame
library("XML")

stats_people_df <- xmlToDataFrame(stats_people)
print(stats_people_df)