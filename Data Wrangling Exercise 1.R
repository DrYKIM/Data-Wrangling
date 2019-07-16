setwd("C:/Users/Dr.Kim/OneDrive - Clark Atlanta University/CAU/Class/2019 Summer/Data Science")

refine_original <- read.csv("refine_original.csv")

refine_original$company[grepl("p", refine_original$company, ignore.case = TRUE)] <- "phillips"
refine_original$company[grepl("k", refine_original$company, ignore.case = TRUE)] <- "akzo"
refine_original$company[grepl("t", refine_original$company, ignore.case = TRUE)] <- "van houten"
refine_original$company[grepl("r", refine_original$company, ignore.case = TRUE)] <- "unilever"

head(refine_original)
refine_original$product_code <- substr(refine_original$Product.code...number, 1,1)
refine_original$product_number <- substr(refine_original$Product.code...number, 3,4)

head(refine_original)refine_original$product_category <- ifelse(refine_original$product_code == "p", "Smartphone",
                                                                ifelse(refine_original$product_code == "v", "TV",
                                                                       ifelse(refine_original$product_code == "x", "Laptop", "Tablet")))

head(refine_original)
refine_original$full_address <- paste(
  refine_original$address, 
  refine_original$city, 
  refine_original$country, sep = ", ")

head(refine_original)
refine_original$company_phillips <- ifelse(refine_original$company == "phillips", 1, 0)
refine_original$company_akzo <- ifelse(refine_clean$company == "akzo", 1, 0)
refine_original$company_van_houten <- ifelse(refine_original$company == "van houten", 1, 0)
refine_original$company_unilever <- ifelse(refine_original$company == "unilever", 1, 0)

refine_original$product_smartphone <- ifelse(refine_original$product_category == "Smartphone", 1, 0)
refine_original$product_tv <- ifelse(refine_original$product_category == "TV", 1, 0)
refine_original$product_laptop <- ifelse(refine_original$product_category == "Laptop", 1, 0)
refine_original$product_tablet <- ifelse(refine_original$product_category == "Tablet", 1, 0)

head(refine_original)
refine_original
write.csv(refine_original, file = "refine_clean.csv")