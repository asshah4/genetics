read_in_vcf <- function(file) {
  
  vcf <- readVcf(vcf_file)
  fl <- file.path(data_loc, "aflubber", "genetics", "CCDG_Broad_CVD_AF_Darbar_UIC_Cases.vcf")
  vcf <- readVcf(fl, "hg19")
  
  readInfo(vcf_file)
  
  x <- scanVcf(fl)
}