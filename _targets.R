library(targets)
library(tarchetypes) 

# Target optiosn
tar_option_set(
  packages = c("tidyverse", "tidymodels"), 
  format = "rds" # default storage format
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# Functions
tar_source()

# Targets
list(
  # VCF data intake
  tar_file(
    vcf_data,
    file.path("../../../uploaded_files/researcher_data/CCDG_Broad_CVD_AF_Darbar_UIC_Cases.vcf") 
  )
)
