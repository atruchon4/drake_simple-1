data_plan <- drake_plan(
  Aureo.search = occ_search(scientificName = "Aureococcus anophagefferens", fields=c('scientificName','basisOfRecord','protocol', 'taxonKey', 'year', 'phylum', 'order', 'family', 'class', 'familyKey', 'decimalLatitude', 'decimalLongitude')),
  Aureo.df = as.data.frame(Aureo.search$data),
  familyKey = Aureo.df[1,4],
  Pelago.count = occ_count(taxonKey=3750, georeferenced = TRUE),
  Pelago.search = occ_search(taxonKey = "3750", fields=c('key', 'scientificName', 'basisOfRecord','protocol', 'taxonKey', 'year', 'phylum', 'order', 'family', 'class', 'decimalLatitude', 'decimalLongitude')),
  Pelago.df = as.data.frame(Pelago.search$data),
  locations_sf <- st_as_sf(Aureo.df, coords = c("decimalLongitude", "decimalLatitude"), crs = 4326),
  mapview(locations_sf))
