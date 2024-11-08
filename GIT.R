library(usethis)
usethis::use_git()
use_github()

git_default_branch_rename()
git_default_branch_configure(name = "main")

 
messydata <- readRDS("/Users/William/Downloads/messy_data.RDS")
names(messydata) <- janitor::clean_names(messydata) |> names()

levels(as.factor(messydata$species_name))
messydata$species_name <- ifelse(messydata$species_name == "Lagopas lagopus"| 
                                   messydata$species_name == "Lagopus lagopus", 
                                 "L. lagopus", "L. muta")


levels(as.factor(messydata$sex))
messydata$sex <- ifelse(messydata$sex == "female" | 
                          messydata$sex == "Female" |
                          messydata$sex == "FEMALE", "Female", "Male")

levels(as.factor(messydata$age))
messydata$age <- ifelse(messydata$age == "A" | 
                          messydata$age == "Adult" |
                          messydata$age == "ADULT", "Adult", "Juvenile")

# Fixing dates
# install.packages("datefixR")
library(datefixR)
messydata$date <- fix_date_char(messydata$date)
summary(messydata$count)

# If only adult has wrong text, "Juvenile" or "no" argument can be replaced with messydata$age.
# Then only adult will change.


# Testing hypothetical scenario with more than two categories (e.g. child, juvenile, adult)
# Using case_when
case_when(messydata$age == "A" | messydata$age == "Adult" | messydata$age == "ADULT" ~ "Adult",
          messydata$age == "Juvenile" | messydata$age == "JUVENILE" | messydata$age == "J" ~ "Juvenile")
# Add rows defining which should be changed to "child" etc. or TRUE ~ "other" to change all not specified

### DATA WRANGLING
# Use this for OTU dataset
smallgame <- readRDS("/Users/William/Downloads/smallGame.RDS")
library(tidyverse)
names(smallgame) <- janitor::clean_names(smallgame) |> names()

smallgame2 <- pivot_longer(smallgame,
                           cols = c(4:362),
                           names_to = "county",
                           values_to = "number")



# Lintr package is useful for code styling, tells you were you made mistakes,
## Styler takes all the lintr issues and fixes them for you


## Making a function
install.packages("palmerpenguins")
library(palmerpenguins)






















