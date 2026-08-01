# =============================================================================
# Combine archived analysis datasets
# =============================================================================
# Create the common analysis object transparently.




gestation_length1 <- standardize_archived_dataset1(
  gestation_length_raw1,
  "gestation_length.csv"
)
interbirth_interval1 <- standardize_archived_dataset1(
  interbirth_interval_raw1,
  "interbirth_interval.csv"
)
litter_mass1 <- standardize_archived_dataset1(
  litter_mass_raw1,
  "litter_mass.csv"
)
common_species_core1 <- standardize_archived_dataset1(
  common_species_raw1,
  "common_species_new_data1(1).csv"
)

# Cross-file consistency checks -----------------------------------------------

# Shared taxonomic, covariate, and placental fields must agree between the two
# complete 509-species trait files. A mismatch indicates that incompatible
# archived versions have been placed together.
shared_columns1 <- c(
  "taxonomic_order", "longevity", "body_mass_g", "female_body_mass_g",
  "invasiveness", "interdigitation"
)

compare_shared_columns1 <- function(left1, right1, left_name1, right_name1) {
  comparison1 <- dplyr::inner_join(
    left1 |> dplyr::select(species, dplyr::all_of(shared_columns1)),
    right1 |> dplyr::select(species, dplyr::all_of(shared_columns1)),
    by = "species",
    suffix = c("_left", "_right")
  )

  if (nrow(comparison1) != nrow(left1) || nrow(comparison1) != nrow(right1)) {
    stop(left_name1, " and ", right_name1, " do not contain identical species sets.")
  }

  unequal_columns1 <- vapply(shared_columns1, function(column1) {
    left_values1 <- comparison1[[paste0(column1, "_left")]]
    right_values1 <- comparison1[[paste0(column1, "_right")]]
    !isTRUE(all.equal(left_values1, right_values1, check.attributes = FALSE))
  }, logical(1))

  if (any(unequal_columns1)) {
    stop(
      "Archived values differ between ", left_name1, " and ", right_name1,
      " for: ", paste(shared_columns1[unequal_columns1], collapse = ", ")
    )
  }
}

compare_shared_columns1(
  gestation_length1,
  interbirth_interval1,
  "gestation_length.csv",
  "interbirth_interval.csv"
)

if (!setequal(common_species_core1$species, gestation_length1$species)) {
  stop(
    "common_species_new_data1(1).csv and gestation_length.csv do not contain ",
    "the same species set."
  )
}

# Construct the common analysis object ----------------------------------------

# Adult and female mass are taken from gestation_length.csv after the complete
# gestation/interbirth agreement check. Litter-mass measures are joined from
# litter_mass.csv only for species for which those outcomes are available.
mass_covariates1 <- gestation_length1 |>
  dplyr::select(species, body_mass_g, female_body_mass_g)

litter_mass_measures1 <- litter_mass1 |>
  dplyr::select(
    species, litter_mass, relative_litter_mass, relative_litter_mass_female
  )

common_species_new_data1 <- common_species_core1 |>
  dplyr::left_join(mass_covariates1, by = "species", relationship = "one-to-one") |>
  dplyr::left_join(litter_mass_measures1, by = "species", relationship = "one-to-one")

# Litter mass is defined in grams as:
# litter mass = litter size (offspring/litter) × neonate mass (g/offspring).
# The equation is checked against the archived litter-mass values rather than
# used to overwrite them.
litter_check1 <- common_species_new_data1 |>
  dplyr::filter(!is.na(litter_mass)) |>
  dplyr::mutate(calculated_litter_mass = litter_size * neonate_body_size)

if (!isTRUE(all.equal(
  litter_check1$litter_mass,
  litter_check1$calculated_litter_mass,
  tolerance = 1e-8,
  check.attributes = FALSE
))) {
  stop(
    "Archived litter_mass values do not equal litter_size * neonate_body_size ",
    "after species alignment. Check that compatible input versions were used."
  )
}

# Positive-value checks protect logarithms and relative-mass equations used in
# later scripts. Missing female masses are allowed because they define the
# smaller sensitivity subsets.
require_positive1(gestation_length1, "gestation_length", "gestation_length.csv")
require_positive1(interbirth_interval1, "interbirth_interval", "interbirth_interval.csv")
require_positive1(litter_mass1, "litter_mass", "litter_mass.csv")

saveRDS(
  common_species_new_data1,
  file.path(derived_data_dir1, "integrated_life_history_data.rds")
)
