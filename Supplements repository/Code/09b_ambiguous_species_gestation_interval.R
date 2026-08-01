# =============================================================================
# Sensitivity PGLS: gestation length and interbirth interval
# =============================================================================
# Purpose: Fit the prespecified gestation and interbirth-interval models after excluding ambiguous placental assignments.


# -----------------------------------------------------------------------------
# GESTATION LENGTH
# COVARIATES: LONGEVITY + BODY MASS
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# GESTATION × INTERDIGITATION
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inter_ges_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "interdigitation",
          "gestation_length",
          "longevity",
          "body_mass_g"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inter_ges_base$interdigitation <-
  make_valid_factor(
    x = model_inter_ges_base$interdigitation,
    allowed_levels = interdigitation_levels,
    variable_name = "interdigitation"
  )

model_inter_ges_base$gestation_length <-
  log(model_inter_ges_base$gestation_length)

model_inter_ges_base$longevity <-
  log(model_inter_ges_base$longevity)

model_inter_ges_base$body_mass_g <-
  log(model_inter_ges_base$body_mass_g)

prepared_inter_ges <-
  prepare_model_data(
    data = model_inter_ges_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "interdigitation",
      "gestation_length",
      "longevity",
      "body_mass_g"
    )
  )

model_inter_ges_base <-
  prepared_inter_ges$data

tree_inter_ges <-
  prepared_inter_ges$tree

se_inter_ges_sensitivity <-
  prepare_se_vector(
    se_vector = se_inter_ges1,
    model_data = model_inter_ges_base
  )

verify_model_inputs(
  model_data = model_inter_ges_base,
  model_tree = tree_inter_ges,
  se_vector = se_inter_ges_sensitivity,
  model_name = "Gestation × interdigitation"
)


# -----------------------------------------------------------------------------
# Gestation × interdigitation:
# Villous reference
# -----------------------------------------------------------------------------

model_inter_ges_vil <-
  as.data.frame(model_inter_ges_base)

model_inter_ges_vil$interdigitation <-
  stats::relevel(
    model_inter_ges_vil$interdigitation,
    ref = "Villous"
  )

inter_ges_no_ambiguous_pgls_vil <-
  pglsSEyPagel(
    model =
      gestation_length ~
      interdigitation +
      longevity +
      body_mass_g,
    data = model_inter_ges_vil,
    tree = tree_inter_ges,
    se = se_inter_ges_sensitivity,
    method = "ML"
  )

summary(inter_ges_no_ambiguous_pgls_vil)
summary(inter_ges_no_ambiguous_pgls_vil)$tTable
AIC(inter_ges_no_ambiguous_pgls_vil)


# -----------------------------------------------------------------------------
# Gestation × interdigitation:
# Trabecular reference
# -----------------------------------------------------------------------------

model_inter_ges_trab <-
  as.data.frame(model_inter_ges_base)

model_inter_ges_trab$interdigitation <-
  stats::relevel(
    model_inter_ges_trab$interdigitation,
    ref = "Trabecular"
  )

inter_ges_no_ambiguous_pgls_trab <-
  pglsSEyPagel(
    model =
      gestation_length ~
      interdigitation +
      longevity +
      body_mass_g,
    data = model_inter_ges_trab,
    tree = tree_inter_ges,
    se = se_inter_ges_sensitivity,
    method = "ML"
  )

summary(inter_ges_no_ambiguous_pgls_trab)
summary(inter_ges_no_ambiguous_pgls_trab)$tTable
AIC(inter_ges_no_ambiguous_pgls_trab)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(inter_ges_no_ambiguous_pgls_vil)$tTable[
  "interdigitationTrabecular",
]

summary(inter_ges_no_ambiguous_pgls_vil)$tTable[
  "interdigitationLabyrinthine",
]

summary(inter_ges_no_ambiguous_pgls_trab)$tTable[
  "interdigitationLabyrinthine",
]


# -----------------------------------------------------------------------------
# GESTATION × INVASIVENESS
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inv_ges_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "invasiveness",
          "gestation_length",
          "longevity",
          "body_mass_g"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inv_ges_base$invasiveness <-
  make_valid_factor(
    x = model_inv_ges_base$invasiveness,
    allowed_levels = invasiveness_levels,
    variable_name = "invasiveness"
  )

model_inv_ges_base$gestation_length <-
  log(model_inv_ges_base$gestation_length)

model_inv_ges_base$longevity <-
  log(model_inv_ges_base$longevity)

model_inv_ges_base$body_mass_g <-
  log(model_inv_ges_base$body_mass_g)

prepared_inv_ges <-
  prepare_model_data(
    data = model_inv_ges_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "invasiveness",
      "gestation_length",
      "longevity",
      "body_mass_g"
    )
  )

model_inv_ges_base <-
  prepared_inv_ges$data

tree_inv_ges <-
  prepared_inv_ges$tree

se_inv_ges_sensitivity <-
  prepare_se_vector(
    se_vector = se_inv_ges1,
    model_data = model_inv_ges_base
  )

verify_model_inputs(
  model_data = model_inv_ges_base,
  model_tree = tree_inv_ges,
  se_vector = se_inv_ges_sensitivity,
  model_name = "Gestation × invasiveness"
)


# -----------------------------------------------------------------------------
# Gestation × invasiveness:
# Epitheliochorial reference
# -----------------------------------------------------------------------------

model_inv_ges_epi <-
  as.data.frame(model_inv_ges_base)

model_inv_ges_epi$invasiveness <-
  stats::relevel(
    model_inv_ges_epi$invasiveness,
    ref = "Epitheliochorial"
  )

invas_ges_sensitivity_pgls_epi <-
  pglsSEyPagel(
    model =
      gestation_length ~
      invasiveness +
      longevity +
      body_mass_g,
    data = model_inv_ges_epi,
    tree = tree_inv_ges,
    se = se_inv_ges_sensitivity,
    method = "ML"
  )

summary(invas_ges_sensitivity_pgls_epi)
summary(invas_ges_sensitivity_pgls_epi)$tTable
AIC(invas_ges_sensitivity_pgls_epi)


# -----------------------------------------------------------------------------
# Gestation × invasiveness:
# Endotheliochorial reference
# -----------------------------------------------------------------------------

model_inv_ges_endo <-
  as.data.frame(model_inv_ges_base)

model_inv_ges_endo$invasiveness <-
  stats::relevel(
    model_inv_ges_endo$invasiveness,
    ref = "Endotheliochorial"
  )

invas_ges_sensitivity_pgls_endo <-
  pglsSEyPagel(
    model =
      gestation_length ~
      invasiveness +
      longevity +
      body_mass_g,
    data = model_inv_ges_endo,
    tree = tree_inv_ges,
    se = se_inv_ges_sensitivity,
    method = "ML"
  )

summary(invas_ges_sensitivity_pgls_endo)
summary(invas_ges_sensitivity_pgls_endo)$tTable
AIC(invas_ges_sensitivity_pgls_endo)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(invas_ges_sensitivity_pgls_epi)$tTable[
  "invasivenessEndotheliochorial",
]

summary(invas_ges_sensitivity_pgls_epi)$tTable[
  "invasivenessHemochorial",
]

summary(invas_ges_sensitivity_pgls_endo)$tTable[
  "invasivenessHemochorial",
]


# -----------------------------------------------------------------------------
# INTERBIRTH INTERVAL
# COVARIATE: BODY MASS ONLY
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# IBI × INTERDIGITATION
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inter_interval_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "interdigitation",
          "interbirth_interval",
          "body_mass_g"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inter_interval_base$interdigitation <-
  make_valid_factor(
    x = model_inter_interval_base$interdigitation,
    allowed_levels = interdigitation_levels,
    variable_name = "interdigitation"
  )

model_inter_interval_base$interbirth_interval <-
  log(model_inter_interval_base$interbirth_interval)

model_inter_interval_base$body_mass_g <-
  log(model_inter_interval_base$body_mass_g)

prepared_inter_interval <-
  prepare_model_data(
    data = model_inter_interval_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "interdigitation",
      "interbirth_interval",
      "body_mass_g"
    )
  )

model_inter_interval_base <-
  prepared_inter_interval$data

tree_inter_interval <-
  prepared_inter_interval$tree

se_inter_interval_sensitivity <-
  prepare_se_vector(
    se_vector = se_inter_interval1,
    model_data = model_inter_interval_base
  )

verify_model_inputs(
  model_data = model_inter_interval_base,
  model_tree = tree_inter_interval,
  se_vector = se_inter_interval_sensitivity,
  model_name = "IBI × interdigitation"
)


# -----------------------------------------------------------------------------
# IBI × interdigitation:
# Villous reference
# -----------------------------------------------------------------------------

model_inter_interval_vil <-
  as.data.frame(model_inter_interval_base)

model_inter_interval_vil$interdigitation <-
  stats::relevel(
    model_inter_interval_vil$interdigitation,
    ref = "Villous"
  )

inter_interval_no_ambiguous_pgls_vil <-
  pglsSEyPagel(
    model =
      interbirth_interval ~
      interdigitation +
      body_mass_g,
    data = model_inter_interval_vil,
    tree = tree_inter_interval,
    se = se_inter_interval_sensitivity,
    method = "ML"
  )

summary(inter_interval_no_ambiguous_pgls_vil)
summary(inter_interval_no_ambiguous_pgls_vil)$tTable
AIC(inter_interval_no_ambiguous_pgls_vil)


# -----------------------------------------------------------------------------
# IBI × interdigitation:
# Trabecular reference
# -----------------------------------------------------------------------------

model_inter_interval_trab <-
  as.data.frame(model_inter_interval_base)

model_inter_interval_trab$interdigitation <-
  stats::relevel(
    model_inter_interval_trab$interdigitation,
    ref = "Trabecular"
  )

inter_interval_no_ambiguous_pgls_trab <-
  pglsSEyPagel(
    model =
      interbirth_interval ~
      interdigitation +
      body_mass_g,
    data = model_inter_interval_trab,
    tree = tree_inter_interval,
    se = se_inter_interval_sensitivity,
    method = "ML"
  )

summary(inter_interval_no_ambiguous_pgls_trab)
summary(inter_interval_no_ambiguous_pgls_trab)$tTable
AIC(inter_interval_no_ambiguous_pgls_trab)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(inter_interval_no_ambiguous_pgls_vil)$tTable[
  "interdigitationTrabecular",
]

summary(inter_interval_no_ambiguous_pgls_vil)$tTable[
  "interdigitationLabyrinthine",
]

summary(inter_interval_no_ambiguous_pgls_trab)$tTable[
  "interdigitationLabyrinthine",
]


# -----------------------------------------------------------------------------
# IBI × INVASIVENESS
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inv_interval_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "invasiveness",
          "interbirth_interval",
          "body_mass_g"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inv_interval_base$invasiveness <-
  make_valid_factor(
    x = model_inv_interval_base$invasiveness,
    allowed_levels = invasiveness_levels,
    variable_name = "invasiveness"
  )

model_inv_interval_base$interbirth_interval <-
  log(model_inv_interval_base$interbirth_interval)

model_inv_interval_base$body_mass_g <-
  log(model_inv_interval_base$body_mass_g)

prepared_inv_interval <-
  prepare_model_data(
    data = model_inv_interval_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "invasiveness",
      "interbirth_interval",
      "body_mass_g"
    )
  )

model_inv_interval_base <-
  prepared_inv_interval$data

tree_inv_interval <-
  prepared_inv_interval$tree

se_inv_interval_sensitivity <-
  prepare_se_vector(
    se_vector = se_inv_interval1,
    model_data = model_inv_interval_base
  )

verify_model_inputs(
  model_data = model_inv_interval_base,
  model_tree = tree_inv_interval,
  se_vector = se_inv_interval_sensitivity,
  model_name = "IBI × invasiveness"
)


# -----------------------------------------------------------------------------
# IBI × invasiveness:
# Epitheliochorial reference
# -----------------------------------------------------------------------------

model_inv_interval_epi <-
  as.data.frame(model_inv_interval_base)

model_inv_interval_epi$invasiveness <-
  stats::relevel(
    model_inv_interval_epi$invasiveness,
    ref = "Epitheliochorial"
  )

invas_interval_sensitivity_pgls_epi <-
  pglsSEyPagel(
    model =
      interbirth_interval ~
      invasiveness +
      body_mass_g,
    data = model_inv_interval_epi,
    tree = tree_inv_interval,
    se = se_inv_interval_sensitivity,
    method = "ML"
  )

summary(invas_interval_sensitivity_pgls_epi)
summary(invas_interval_sensitivity_pgls_epi)$tTable
AIC(invas_interval_sensitivity_pgls_epi)


# -----------------------------------------------------------------------------
# IBI × invasiveness:
# Endotheliochorial reference
# -----------------------------------------------------------------------------

model_inv_interval_endo <-
  as.data.frame(model_inv_interval_base)

model_inv_interval_endo$invasiveness <-
  stats::relevel(
    model_inv_interval_endo$invasiveness,
    ref = "Endotheliochorial"
  )

invas_interval_sensitivity_pgls_endo <-
  pglsSEyPagel(
    model =
      interbirth_interval ~
      invasiveness +
      body_mass_g,
    data = model_inv_interval_endo,
    tree = tree_inv_interval,
    se = se_inv_interval_sensitivity,
    method = "ML"
  )

summary(invas_interval_sensitivity_pgls_endo)
summary(invas_interval_sensitivity_pgls_endo)$tTable
AIC(invas_interval_sensitivity_pgls_endo)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(invas_interval_sensitivity_pgls_epi)$tTable[
  "invasivenessEndotheliochorial",
]

summary(invas_interval_sensitivity_pgls_epi)$tTable[
  "invasivenessHemochorial",
]

summary(invas_interval_sensitivity_pgls_endo)$tTable[
  "invasivenessHemochorial",
]
