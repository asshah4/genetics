# Trim appropraite AFL patients rom the data set

library(vcfR)

afl_pts <-  
  tar_read(flutter_ids, store = "../aflubber/_targets/") |>
  filter(!is.na(dna_id)) |>
  filter(str_detect(dna_id, pattern = "UIC"))

ids <- afl_pts$dna_id

colnames(vcf_data@gt)


gt <- extract.gt(vcf_data)
