# =============================================================================
# Import archived analysis datasets and mammalian phylogeny
# =============================================================================

# These filenames must match the files deposited in data/raw exactly. Keeping
# the names explicit makes missing or renamed repository inputs easy to diagnose.
raw_files1 <- c(
  gestation = "gestation_length.csv",
  interbirth_interval = "interbirth_interval.csv",
  litter_mass = "litter_mass.csv",
  common_species = "common_species_new_data1(1).csv",
  mammal_tree = "mammal_phy1.nwk"
)

raw_paths1 <- file.path(raw_data_dir1, raw_files1)
invisible(lapply(raw_paths1, require_file1))

# The three trait-specific files are comma-delimited. The common-species file
# has a .csv extension but is semicolon-delimited in the archived copy.
gestation_length_raw1 <- readr::read_csv(
  raw_paths1[["gestation"]],
  na = c("", "NA", "-999"),
  show_col_types = FALSE
)
interbirth_interval_raw1 <- readr::read_csv(
  raw_paths1[["interbirth_interval"]],
  na = c("", "NA", "-999"),
  show_col_types = FALSE
)
litter_mass_raw1 <- readr::read_csv(
  raw_paths1[["litter_mass"]],
  na = c("", "NA", "-999"),
  show_col_types = FALSE
)
common_species_raw1 <- readr::read_delim(
  raw_paths1[["common_species"]],
  delim = ";",
  na = c("", "NA", "-999"),
  show_col_types = FALSE,
  trim_ws = TRUE
)

# The original tree import and all downstream pruning procedures are retained.
new_tree1 <- ape::read.tree(raw_paths1[["mammal_tree"]])

# Schema checks provide clear errors if a wrong file or delimiter is supplied.
require_columns1(
  gestation_length_raw1,
  c("species", "taxonomic_order", "gestation_length", "longevity",
    "body_mass_g", "female_body_mass_g", "invasiveness", "interdigitation"),
  "gestation_length.csv"
)
require_columns1(
  interbirth_interval_raw1,
  c("species", "taxonomic_order", "interbirth_interval", "longevity",
    "body_mass_g", "female_body_mass_g", "invasiveness", "interdigitation"),
  "interbirth_interval.csv"
)
require_columns1(
  litter_mass_raw1,
  c("species", "taxonomic_order", "litter_mass", "longevity",
    "body_mass_g", "female_body_mass_g", "invasiveness", "interdigitation",
    "relative_litter_mass", "relative_litter_mass_female", "litter_size",
    "neonate_body_size"),
  "litter_mass.csv"
)
require_columns1(
  common_species_raw1,
  c("taxonomic_order", "species", "common_name", "gestation_length",
    "neonate_body_size", "litter_size", "interbirth_interval", "longevity",
    "invasiveness", "interdigitation"),
  "common_species_new_data1(1).csv"
)
