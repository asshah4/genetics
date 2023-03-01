library(targets)
library(tarchetypes) 
library(usethis)

# Target optiosn
tar_option_set(
  packages = c(
    # Data wrangling
    "tidyverse",
    # Statistics
    "tidymodels",
    # Genetics
    "vcfR", "VariantAnnotation"
  ),
  format = "rds" # default storage format
)

# tar_make_clustermq() configuration:
options(clustermq.scheduler = "multicore")

# Functions - all stored in R folder
tar_source()

# Targets
list(
  # VCF data pipeline
  tar_file(data_loc, find_data_folder()),
  tar_file(
    vcf_file,
    file.path(data_loc, "aflubber", "genetics", "afl.vcf.gz") 
  ),
  tar_target(vcf_data, vcfR::read.vcfR(vcf_file))
  
)
