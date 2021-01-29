data_plan <- drake_plan(
  Aureo.search = occ_search(scientificName = "Aureococcus anophagefferens", fields=c('scientificName','basisOfRecord','protocol', 'taxonKey', 'year', 'phylum', 'order', 'family', 'class', 'familyKey')),
  )
