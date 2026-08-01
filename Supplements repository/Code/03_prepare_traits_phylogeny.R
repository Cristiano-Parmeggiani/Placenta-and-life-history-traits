# =============================================================================
# Prepare trait datasets, phylogenies, and response errors
# =============================================================================
# Purpose: Construct analysis-specific datasets, prune and align trees, document transformations, and prepare standard-error vectors for PGLS.


# Trait datasets and pruned trees ---------------------------------------
# Main datasets now keep female_body_mass_g as an informational column.
# IMPORTANT: do not filter the main datasets by female_body_mass_g,
# otherwise the analyst will shrink the sample size to only species with female mass.

# The gestation dataset is imported directly from gestation_length.csv.
gestation_length1 <- gestation_length1 %>%
  filter(gestation_length > 0, longevity > 0, body_mass_g > 0)

gestation_length_female1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, gestation_length, longevity,
                female_body_mass_g, invasiveness, interdigitation) %>%
  filter(gestation_length > 0, longevity > 0, female_body_mass_g > 0)

litsize1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, litter_size, longevity,
                body_mass_g, female_body_mass_g,
                invasiveness, interdigitation) %>%
  filter(litter_size > 0, longevity > 0, body_mass_g > 0)

litsize_female1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, litter_size, longevity,
                female_body_mass_g, invasiveness, interdigitation) %>%
  filter(litter_size > 0, longevity > 0, female_body_mass_g > 0)

# The litter-mass dataset is imported directly from litter_mass.csv. Relative
# measures are retained as archived and checked against their documented
# equations below.
relative_litter_mass1 <- litter_mass1 %>%
  filter(litter_mass > 0, longevity > 0, body_mass_g > 0) %>%
  mutate(
    calculated_relative_litter_mass = litter_mass / body_mass_g,
    calculated_relative_litter_mass_female = litter_mass / female_body_mass_g
  )

if (!isTRUE(all.equal(
  relative_litter_mass1$relative_litter_mass,
  relative_litter_mass1$calculated_relative_litter_mass,
  tolerance = 1e-10,
  check.attributes = FALSE
))) {
  stop("relative_litter_mass in litter_mass.csv does not equal litter_mass / body_mass_g.")
}

relative_litter_mass_female1 <- litter_mass1 %>%
  filter(litter_mass > 0, longevity > 0, female_body_mass_g > 0) %>%
  dplyr::select(
    species, taxonomic_order, litter_mass, longevity, female_body_mass_g,
    invasiveness, interdigitation, relative_litter_mass_female
  )

neonate_body_size1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, neonate_body_size, longevity,
                body_mass_g, female_body_mass_g,
                invasiveness, interdigitation) %>%
  filter(neonate_body_size > 0, longevity > 0, body_mass_g > 0) %>%
  mutate(neonate_over_adult = neonate_body_size / body_mass_g)

neonate_body_size_female1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, neonate_body_size, longevity,
                body_mass_g, female_body_mass_g,
                invasiveness, interdigitation) %>%
  filter(neonate_body_size > 0, longevity > 0, body_mass_g > 0,
         female_body_mass_g > 0) %>%
  mutate(neonate_over_adult = neonate_body_size / female_body_mass_g)

# The interbirth-interval dataset is imported directly from its archived file.
interbirth_interval1 <- interbirth_interval1 %>%
  filter(interbirth_interval > 0, longevity > 0, body_mass_g > 0)

interbirth_interval_female1 <- common_species_new_data1 %>%
  dplyr::select(species, taxonomic_order, interbirth_interval, longevity,
                female_body_mass_g, invasiveness, interdigitation) %>%
  filter(interbirth_interval > 0, longevity > 0, female_body_mass_g > 0)


mammal_phy1 <- as.phylo(new_tree1)
mammal_phy1$tip.label <- mammal_phy1$tip.label %>%
  clean_species1() %>%
  str_replace("_ott[0-9]+$", "")

prune_tree1 <- function(data) {
  keep.tip(mammal_phy1, mammal_phy1$tip.label[mammal_phy1$tip.label %in% data$species])
}

alltree1 <- prune_tree1(common_species_new_data1)
gestree1 <- prune_tree1(gestation_length1)
gestree_female1 <- prune_tree1(gestation_length_female1)
litsizetree1 <- prune_tree1(litsize1)
litsizetree_female1 <- prune_tree1(litsize_female1)
littree1 <- prune_tree1(relative_litter_mass1)
littree_female1 <- prune_tree1(relative_litter_mass_female1)
neotree1 <- prune_tree1(neonate_body_size1)
neotree_female1 <- prune_tree1(neonate_body_size_female1)
intervaltree1 <- prune_tree1(interbirth_interval1)
intervaltree_female1 <- prune_tree1(interbirth_interval_female1)


# Comparative data and SE preparation -----------------------------------

make_comp_data1 <- function(data, tree) {
  data <- data %>%
    filter(species %in% tree$tip.label) %>%
    distinct(species, .keep_all = TRUE) %>%
    as.data.frame()
  rownames(data) <- NULL

  comp <- comparative.data(
    phy = tree,
    data = data,
    names.col = "species",
    vcv = FALSE,
    vcv.dim = 2,
    na.omit = FALSE,
    force.root = FALSE,
    warn.dropped = TRUE
  )

  if (!"species" %in% colnames(comp$data)) {
    comp$data$species <- rownames(comp$data)
  }

  comp$data <- comp$data %>%
    mutate(
      invasiveness = factor(invasiveness,
        levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial")
      ),
      interdigitation = factor(interdigitation,
        levels = c("Villous", "Trabecular", "Labyrinthine")
      )
    )

  comp
}

comp_phylo_ges1 <- make_comp_data1(gestation_length1, gestree1)
comp_phylo_ges_female1 <- make_comp_data1(gestation_length_female1, gestree_female1)
comp_phylo_litsize1 <- make_comp_data1(litsize1, litsizetree1)
comp_phylo_litsize_female1 <- make_comp_data1(litsize_female1, litsizetree_female1)
comp_phylo_lit1 <- make_comp_data1(relative_litter_mass1, littree1)
comp_phylo_lit_female1 <- make_comp_data1(relative_litter_mass_female1, littree_female1)
comp_phylo_neo1 <- make_comp_data1(neonate_body_size1, neotree1)
comp_phylo_neo_female1 <- make_comp_data1(neonate_body_size_female1, neotree_female1)
comp_phylo_interval1 <- make_comp_data1(interbirth_interval1, intervaltree1)
comp_phylo_interval_female1 <- make_comp_data1(interbirth_interval_female1, intervaltree_female1)

prepare_model_and_se1 <- function(response_var,
                                 predictor_vars,
                                 data_df,
                                 se_source_df,
                                 phylo_obj,
                                 log_response = TRUE,
                                 default_se = 0.01) {

  # --- ensure species column & standardize casing ---
  if (!"species" %in% names(data_df)) {
    if ("spp" %in% names(data_df)) {
      data_df$species <- data_df$spp
    } else {
      stop("`species` (or `spp`) column not found in data_df.")
    }
  }

  data_df$species       <- tolower(data_df$species)
  se_source_df$species  <- tolower(se_source_df$species)
  phylo_obj$tip.label   <- tolower(phylo_obj$tip.label)

  # --- keep only species present in the tree ---
  data_df <- dplyr::filter(data_df, species %in% phylo_obj$tip.label)

  # --- build per-species SE on the *linear* scale from the source df ---
  se_df <- se_source_df %>%
    dplyr::filter(species %in% data_df$species) %>%
    dplyr::group_by(species) %>%
    dplyr::summarise(
      n_obs     = dplyr::n(),
      sd_resp   = stats::sd(.data[[response_var]], na.rm = TRUE),
      se_linear = dplyr::if_else(n_obs > 1, sd_resp / sqrt(n_obs), NA_real_),
      .groups = "drop"
    )

  # --- assign default SE for single-observation species ---
  se_df$se_linear[is.na(se_df$se_linear)] <- default_se

  # --- join traits + predictors + SEs ---
  df <- data_df %>%
    dplyr::select(species, dplyr::all_of(c(response_var, predictor_vars))) %>%
    dplyr::left_join(se_df[, c("species", "se_linear")], by = "species")

  # --- if modeling log(response), delta-method SE = SE_linear / response ---
  if (log_response) {
    df <- dplyr::filter(df, .data[[response_var]] > 0) # required for logs and delta method
    df$se_use <- df$se_linear / df[[response_var]]
  } else {
    df$se_use <- df$se_linear
  }

  # --- make predictors factors if they are categorical ---
  for (v in predictor_vars) {
    if (is.character(df[[v]])) df[[v]] <- factor(df[[v]])
  }

  # --- drop any rows with NA in response/predictors/SE ---
  df <- tidyr::drop_na(df, dplyr::all_of(c(response_var, predictor_vars, "se_use")))

  # --- order by tree tip order and keep spp copy ---
  df <- df[match(phylo_obj$tip.label, df$species), , drop = FALSE]
  df <- df[stats::complete.cases(df$species), , drop = FALSE]
  df$spp <- df$species

  # --- build a model.frame with na.fail to catch anything early ---
  form <- stats::as.formula(
    paste(response_var, "~", paste(c(predictor_vars, "spp"), collapse = " + "))
  )
  mf <- stats::model.frame(form, data = df, na.action = stats::na.fail)

  # --- align SE vector to the model.frame rows ---
  se_out <- df$se_use[match(mf$spp, df$species)]
  names(se_out) <- mf$spp

  # --- final safety checks ---
  if (anyNA(se_out) || any(!is.finite(se_out)))
    stop("SE vector contains NA/Inf after alignment & delta method. Check zeros/missing in response or se_source_df.")

  list(
    model_frame = mf,
    se          = se_out
  )
}


# --- Use trait-specific datasets & matching phylogenetic trees ---

trait_datasets1 <- list(
  gestation_length = gestation_length1,
  litter_size = litsize1,
  relative_litter_mass = relative_litter_mass1,
  neonate_over_adult = neonate_body_size1,
  interbirth_interval = interbirth_interval1
)

trait_trees1 <- list(
  gestation_length = gestree1,
  litter_size = litsizetree1,
  relative_litter_mass = littree1,
  neonate_over_adult = neotree1,
  interbirth_interval = intervaltree1
)

responses1 <- names(trait_datasets1)
factors1   <- c("interdigitation", "invasiveness")
control_vars1 <- c("longevity", "body_mass_g")
results1 <- list()

for (resp1 in responses1) {
  df1  <- trait_datasets1[[resp1]]
  phy1 <- trait_trees1[[resp1]]

  for (fac1 in factors1) {
    res1 <- prepare_model_and_se1(
      response_var   = resp1,
      predictor_vars = c(fac1, control_vars1),
      data_df        = df1,
      se_source_df   = df1,
      phylo_obj      = phy1,
      log_response   = TRUE
    )

    results1[[paste(resp1, fac1, sep = "_")]] <- res1
  }
}

female_trait_datasets1 <- list(
  gestation_length = gestation_length_female1,
  litter_size = litsize_female1,
  relative_litter_mass_female = relative_litter_mass_female1,
  neonate_over_adult = neonate_body_size_female1,
  interbirth_interval = interbirth_interval_female1
)

female_trait_trees1 <- list(
  gestation_length = gestree_female1,
  litter_size = litsizetree_female1,
  relative_litter_mass_female = littree_female1,
  neonate_over_adult = neotree_female1,
  interbirth_interval = intervaltree_female1
)

female_control_vars1 <- c("longevity", "female_body_mass_g")
female_results1 <- list()

female_responses1 <- names(female_trait_datasets1)


for (resp1 in female_responses1) {
  df1  <- female_trait_datasets1[[resp1]]
  phy1 <- female_trait_trees1[[resp1]]

  for (fac1 in factors1) {
    res1 <- prepare_model_and_se1(
      response_var   = resp1,
      predictor_vars = c(fac1, female_control_vars1),
      data_df        = df1,
      se_source_df   = df1,
      phylo_obj      = phy1,
      log_response   = TRUE
    )

    female_results1[[paste(resp1, fac1, sep = "_")]] <- res1
  }
}


# SE can now be accessed.

# Gestation length
model_inter_ges1 <- results1[["gestation_length_interdigitation"]]$model_frame
se_inter_ges1    <- results1[["gestation_length_interdigitation"]]$se

model_inv_ges1 <- results1[["gestation_length_invasiveness"]]$model_frame
se_inv_ges1    <- results1[["gestation_length_invasiveness"]]$se

model_inter_ges_female1 <- female_results1[["gestation_length_interdigitation"]]$model_frame
se_inter_ges_female1    <- female_results1[["gestation_length_interdigitation"]]$se

model_inv_ges_female1 <- female_results1[["gestation_length_invasiveness"]]$model_frame
se_inv_ges_female1    <- female_results1[["gestation_length_invasiveness"]]$se

# Litter size
model_inter_litsize1 <- results1[["litter_size_interdigitation"]]$model_frame
se_inter_litsize1    <- results1[["litter_size_interdigitation"]]$se

model_inv_litsize1 <- results1[["litter_size_invasiveness"]]$model_frame
se_inv_litsize1    <- results1[["litter_size_invasiveness"]]$se

model_inter_litsize_female1 <- female_results1[["litter_size_interdigitation"]]$model_frame
se_inter_litsize_female1    <- female_results1[["litter_size_interdigitation"]]$se

model_inv_litsize_female1 <- female_results1[["litter_size_invasiveness"]]$model_frame
se_inv_litsize_female1    <- female_results1[["litter_size_invasiveness"]]$se

# Litter mass
model_inter_litter1 <- results1[["relative_litter_mass_interdigitation"]]$model_frame
se_inter_litter1    <- results1[["relative_litter_mass_interdigitation"]]$se

model_inv_litter1 <- results1[["relative_litter_mass_invasiveness"]]$model_frame
se_inv_litter1    <- results1[["relative_litter_mass_invasiveness"]]$se

model_inter_litter_female1 <- female_results1[["relative_litter_mass_female_interdigitation"]]$model_frame
se_inter_litter_female1    <- female_results1[["relative_litter_mass_female_interdigitation"]]$se

model_inv_litter_female1 <- female_results1[["relative_litter_mass_female_invasiveness"]]$model_frame
se_inv_litter_female1    <- female_results1[["relative_litter_mass_female_invasiveness"]]$se

# Neonate body weight / adult body weight
model_inter_neo1 <- results1[["neonate_over_adult_interdigitation"]]$model_frame
se_inter_neo1    <- results1[["neonate_over_adult_interdigitation"]]$se

model_inv_neo1 <- results1[["neonate_over_adult_invasiveness"]]$model_frame
se_inv_neo1    <- results1[["neonate_over_adult_invasiveness"]]$se

model_inter_neo_female1 <- female_results1[["neonate_over_adult_interdigitation"]]$model_frame
se_inter_neo_female1    <- female_results1[["neonate_over_adult_interdigitation"]]$se

model_inv_neo_female1 <- female_results1[["neonate_over_adult_invasiveness"]]$model_frame
se_inv_neo_female1    <- female_results1[["neonate_over_adult_invasiveness"]]$se

# Interbirth interval
model_inter_interval1 <- results1[["interbirth_interval_interdigitation"]]$model_frame
se_inter_interval1    <- results1[["interbirth_interval_interdigitation"]]$se

model_inv_interval1 <- results1[["interbirth_interval_invasiveness"]]$model_frame
se_inv_interval1    <- results1[["interbirth_interval_invasiveness"]]$se

model_inter_interval_female1 <- female_results1[["interbirth_interval_interdigitation"]]$model_frame
se_inter_interval_female1    <- female_results1[["interbirth_interval_interdigitation"]]$se

model_inv_interval_female1 <- female_results1[["interbirth_interval_invasiveness"]]$model_frame
se_inv_interval_female1    <- female_results1[["interbirth_interval_invasiveness"]]$se

# Save a computational checkpoint so the PGLS analyses can be entered without
# repeating raw-data integration and tree preparation.
saveRDS(
  list(
    common_species_new_data1 = common_species_new_data1,
    alltree1 = alltree1,
    trait_datasets1 = trait_datasets1,
    female_trait_datasets1 = female_trait_datasets1,
    trait_trees1 = trait_trees1,
    female_trait_trees1 = female_trait_trees1,
    results1 = results1,
    female_results1 = female_results1
  ),
  file.path(derived_data_dir1, "prepared_model_inputs.rds")
)
