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
    # CRAN  and BioConductor genetic pipelines
    "vcfR", 
    "VariantAnnotation", "VariantTools",
    "adegenet",
    # Genetic data 
    "BSgenome.Hsapiens.UCSC.hg19",
    "TxDb.Hsapiens.UCSC.hg19.knownGene",
    "SNPlocs.Hsapiens.dbSNP144.GRCh37"
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
  tar_target(vcf_data, vcfR::read.vcfR(vcf_file)),
  tar_target(genlight_data, vcfR::vcfR2genlight(vcf_data)),
  
  tar_quarto(vcf_overview_slides, "R/vcf_overview.qmd")
  
)