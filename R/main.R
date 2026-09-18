library(readxl)
library(risyphus)
library(kableExtra)
library(forcats)
library(dplyr)
library(stringr)

# Read in files
file <- read_excel("T:/PSY/Data Science/BioHackathon26/Patients - Spatial data Study ID ONLY.xls",
                   sheet = 1)

demogs <- read_excel("T:/PSY/Data Science/BioHackathon26/Patients - Survey and demographics data - With new categorical.xls")

file <- file %>% merge(demogs, by ="StdyID")

# Factor recode
{
file$ptAge4grp <- as.factor(file$ptAge4grp)
file$ptAge4grp <- dplyr::recode(
  file$ptAge4grp,
  `1` = "13-15y",
  `2` = "16-18y",
  `3` = "19-21y",
  `4` = "22-24y"
)

file$ptRace <- as.factor(file$ptRace)
file$ptRace <- dplyr::recode(
  file$ptRace,
  `1` = "White",
  `2` = "Black or African American",
  `3` = "American Indian or Alaska Native",
  `4` = "Asian",
  `5` = "Native Hawaiian or Pacific Islander",
  `6` = "Other",
  `7` = "Prefer not to say"
)

file$ptEthnicity <- as.factor(file$ptEthnicity)
file$ptEthnicity <- dplyr::recode(
  file$ptEthnicity,
  `0` = "Not Hispanic, Latino/a, or of Spanish origin",
  `1` = "Hispanic, Latino/a, or of Spanish origin",
  `2` = "Prefer not to say",
)

file$ptEdu <- as.factor(file$ptEdu)   
file$ptEdu <- dplyr::recode(
  file$ptEdu,
  `1` = 'Less than high school',
  `2` = 'GED or equivalent',
  `3` = 'High school graduate',
  `4` = 'Some college or technical school',
  `5` = 'College graduate',
  `6` = 'Graduate degree',
  `7` = 'Prefer not to say'
)

file$ptGenderID <- as.factor(file$ptGenderID)
file$ptGenderID <- dplyr::recode(
  file$ptGenderID,
  `1` = 'Male',
  `2` = 'Female',
  `3` = 'Non-binary',
  `4` = 'Intersex',
  `5` = 'Trans',
  `6` = 'Non-Conforming',
  `7` = 'Other',
  `8` = 'Prefer not to say'
)

file$ptEmploy <- as.factor(file$ptEmploy)
file$ptEmploy <- dplyr::recode(
  file$ptEmploy,
  `1` = 'Work full-time',
  `2` = 'Work part-time 15-34hrs',
  `3` = 'Work part-time LT 15hrs',
  `4` = 'Dont currently work for pay',
  `5` = 'Prefer not to say'
)

file$ptFinancial <- as.factor(file$ptFinancial)
file$ptFinancial <- dplyr::recode(
  file$ptFinancial,
  `1` = 'Live comfortably',
  `2` = 'Meet needs with a little left',
  `3` = 'Just meet basic expenses',
  `4` = 'Dont meet basic expenses'
)

file$`Green Group 4 levels` <- factor(file$`Green Group 4 levels`, levels = c("High Green", "Moderate Green",
                                                                              "Green", "Low Green"))
}

# Variable names for ONEtable
file_variables <- data.frame("Variable" = c("ptAge",
                                            "ptAge4grp",
                                            "ptRace",
                                            "ptEthnicity",
                                            "ptEdu",           
                                            "ptGenderID",
                                            "ptEmploy",
                                            "ptFinancial",
                                            "NLCD Proportion Classified Land that is Green",                                                                                         
                                             "Green Group 4 levels",                                                                                          
                                             "COI Overall 2023 CT"),
                             "BLtable" = 1,
                             "Table.label" = c("Age",
                                               "Age Group",
                                               "Race",
                                               "Ethnicity",
                                               "Education",
                                               "Gender",
                                               "Employement",
                                               "Financials",
                                               "NLCD Proportion Classified Land that is Green",                                                                                         
                                               "Green Group 4 levels",                                                                                          
                                               "COI Overall 2023 CT"),
                             "Type" = c("Continuous",
                                        "Factor",
                                        "Factor",
                                        "Factor",
                                        "Factor",
                                        "Factor",
                                        "Factor",
                                        "Factor",
                                        "Continuous",
                                        "Factor",
                                        "Continuous"))

ONEtable(file, file_variables) %>%
  kbl(
    align = c("l", "l"),
    escape = FALSE
  ) %>%
  kable_classic(
    full_width = FALSE,
    html_font = "Arial"
  ) %>%
  add_header_above(
    c("All participants" = 2),
    bold = TRUE,
    color = "white",
    background = "#4472C4"
  ) %>%
  # Numeric column header
  row_spec(
    c(1,45,51),
    bold = TRUE,
    color = "white",
    background = "#85a4d9"
  ) %>%
  # Categorical/group rows
  row_spec(
    c(2,7,14,18,26,34,40,46),
    background = "#E2EAF5",
    bold = TRUE,
    color = "#2F5597"
  ) %>%
  column_spec(1, bold = TRUE) %>%
  kable_styling(
    full_width = FALSE,
    position = "center",
    font_size = 12
  )


# Age groups 
file_Under18 <- file %>% filter(ptAge4grp == "13-15y" | ptAge4grp == "16-18y")
file_Over18 <- file %>% filter(ptAge4grp == "19-21y" | ptAge4grp == "22-24y")
file_variables_grouped <- file_variables[-which(file_variables$Variable == "ptAge4grp"),] 

under18 <- ONEtable(file_Under18, file_variables_grouped)
over18 <- ONEtable(file_Over18, file_variables_grouped)
colnames(under18) <- str_replace(colnames(under18), "All", "18 and under")
colnames(over18) <- str_replace(colnames(over18), "All", "19+")

comb <- cbind(under18, over18)