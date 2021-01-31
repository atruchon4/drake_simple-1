data_plan <- drake_plan(
  Aureo.search = occ_search(scientificName = "Aureococcus anophagefferens", fields=c('scientificName','basisOfRecord','protocol', 'taxonKey', 'year', 'phylum', 'order', 'family', 'class', 'familyKey', 'decimalLatitude', 'decimalLongitude')),
  Aureo.df = as.data.frame(Aureo.search$data),
  familyKey = Aureo.df[1,4],
  Pelago.count = occ_count(taxonKey=3750, georeferenced = TRUE),
  Pelago.search = occ_search(taxonKey = "3750", fields=c('key', 'scientificName', 'basisOfRecord','protocol', 'taxonKey', 'year', 'phylum', 'order', 'family', 'class', 'decimalLatitude', 'decimalLongitude', 'materialSampleID'), limit = 20000),
  Pelago.df = as.data.frame(Pelago.search$data),
  Pelago.omit = Pelago.df[complete.cases(Pelago.df), ],
  locations_sf = st_as_sf(Pelago.omit, coords = c("decimalLongitude", "decimalLatitude"), crs = 4326),
  mapview(locations_sf))

# Mapping the locations of all sampling sites for Pelagophytes should show all samples being derived from oceans, as pelagophytes are marine algae.
