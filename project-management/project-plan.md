# Project Plan

## Goal

Develop a proof-of-concept workflow that integrates patient geographic and clinical data with environmental and socioeconomic datasets and produces a series of maps and visualizations showing potential relationships with psychological outcomes.

## Tools

R, SAS, PowerBI, ArcGIS (online and desktop), government data sources; St. Jude's double-study ID protection of patient info.

## First Tasks

- [x] Data Preparation (PROMIS, MSPSS)- Kathy
- [x] Data Preparation (GIS) - Sylwia
- [x] Data Preparation (R) - Joseph
- [x] Explore Correlations (neighborhood factors x social support & pyschological health - Nazneen, Kathy, Liu, & Kelly 
- [x] Github Documentation - Joseph, Ketaki, Meghan, Silvia, Arantza, Pei, Liu
- [x] GIS Interactive  - Sylwia, Joseph, Ketaki, Meghan, Arantza, Pei, Liu, Kathy
- [x] PowerBI - Nazneen, Kelly, Arantza 

## Milestones


- **Day 1:**
  - Data Preparation
  - Statistical analysis
- **Day 2:** 
  - ArcGIS 
  - Slide Preparation
- **Day 3:** 
  - PowerBI
  - Final slide Preparation
  - Final system management


## Definition of Done

The project will be considered complete when the team develops a proof-of-concept workflow that integrates patient geographic and clinical data with environmental and socioeconomic datasets and produces a series of maps and visualizations showing potential relationships with psychological outcomes. In the future, these objectives can be expanded by developing additional maps, incorporating other psychological constructs beyond PROMIS and MSPSS, and adapting the workflow to other childhood catastrophic diseases and pediatric populations. The final products could also be shared with other St. Jude researchers and collaborators across the country, allowing additional feed of data to be incorporated in creating a larger, more geographically diverse dataset that is more representative of the U.S. population.

## Risks and Questions

- What might block the team?
  - Data of the patients: data breaches, privacy violations, publication of results, questions about consent and security. 
- What assumption needs checking?
  - Data privacy & anonymization, consent &ethics, data quality, and cloud security & compilance
- Who can help?
  - Data protection office, data scientist

## Variable categorization 
- categorized PM2.5 into air quality levels (good, moderate)                             
- categorized NO2 into air quality levels (good)                                                  
- categorized SO2 into air quality levels (good)                                               
- categorized CO into air quality levels (good)                                                
- converted variables (NO2, SO2) from ppb to ppm in other to classify                        
- categorized air quality index (good, moderate)                                              
- categorized noise pollution (low, moderate)                                                  
- created new variable (population exposure group)
- Age collapsed into 2 groups (Group 1: 13-15y and 16-18y, Group 2: 19-21y and 22-24y)
- Gender analysis used Males:1 and Females:2

**Descriptive**
- Total sample is 490 individuals
- 245 individuals have good on every air quality index and low noise population
- 245 individuals have at least 1 elevated exposure
- Created new variable (proportion classified land that is green)
- Created new variable (Green group 4 levels)

