library(readxl)
library(risyphus)
library(kableExtra)
library(forcats)
library(dplyr)
library(stringr)
file <- read_excel("T:/PSY/Data Science/BioHackathon26/Patients - Spatial data Study ID ONLY.xls",
                   sheet = 1)

demogs <- read_excel("T:/PSY/Data Science/BioHackathon26/Patients - Survey and demographics data - With new categorical.xls")

file <- file %>% merge(demogs, by ="StdyID")