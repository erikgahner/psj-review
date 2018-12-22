# Policy Feedback Effects on Mass Publics: A Quantitative Review
---

### Description and data sources

Replication material for 'Policy Feedback Effects on Mass Publics' published in the Policy Studies Journal. This repository contains all files required to produce the figures, tables and numerical information provided in the manuscript and supplementary material.

### Author/contact

 - Erik Gahner Larsen, School of Politics and International Relations, University of Kent, E.G.Larsen@kent.ac.uk.

### Repository content

- `01-data.R` = R script used to create the datasets used for the analysis (`review.csv`)
- `02-analysis` = R script used for all analyses in the article
- `feedbackreview.xlsx` = Excel document used to code all articles
- `review.csv`= Data generated from the Excel document (via `01-data.R`)
- `sessionInfo.txt` = Output from sessionInfo() in R

### Session info

The analyses were made with [RStudio](http://www.rstudio.com/) (Version 1.0.136) with the following R session:

```
## R version 3.4.3 (2017-11-30)
## Platform: x86_64-apple-darwin15.6.0 (64-bit)
## Running under: macOS  10.14.2

## Matrix products: default
## BLAS: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib

## locale:
## [1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8

## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     

## other attached packages:
##  [1] stargazer_5.2.2 lme4_1.1-17     Matrix_1.2-14   bindrcpp_0.2.2  rio_0.5.10     
##  [6] forcats_0.3.0   stringr_1.3.1   dplyr_0.7.8     purrr_0.2.5     readr_1.1.1    
## [11] tidyr_0.8.2     tibble_1.4.2    ggplot2_3.1.0   tidyverse_1.2.1

## loaded via a namespace (and not attached):
##  [1] tidyselect_0.2.5  reshape2_1.4.3    splines_3.4.3     haven_1.1.2       lattice_0.20-35  
##  [6] colorspace_1.3-2  yaml_2.1.19       rlang_0.3.0.1     nloptr_1.0.4      pillar_1.3.0     
## [11] foreign_0.8-70    glue_1.3.0        withr_2.1.2.9000  modelr_0.1.2      readxl_1.1.0     
## [16] bindr_0.1.1       plyr_1.8.4        munsell_0.5.0     gtable_0.2.0      cellranger_1.1.0
## [21] zip_1.0.0         rvest_0.3.2       psych_1.8.4       labeling_0.3      parallel_3.4.3   
## [26] curl_3.2          broom_0.4.5       Rcpp_1.0.0        scales_1.0.0.9000 jsonlite_1.6     
## [31] mnormt_1.5-5      digest_0.6.18     hms_0.4.2         stringi_1.2.4     openxlsx_4.1.0   
## [36] grid_3.4.3        cli_1.0.1         tools_3.4.3       magrittr_1.5      lazyeval_0.2.1   
## [41] crayon_1.3.4      pkgconfig_2.0.2   MASS_7.3-50       data.table_1.11.8 xml2_1.2.0       
## [46] lubridate_1.7.4   minqa_1.2.4       assertthat_0.2.0  httr_1.4.0        rstudioapi_0.7   
## [51] R6_2.3.0          nlme_3.1-137      compiler_3.4.3   

```
