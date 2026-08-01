# =============================================================================
# Sensitivity PGLS: relative litter mass
# =============================================================================
# Purpose: Fit the prespecified relative-litter-mass models after excluding ambiguous placental assignments.



# -----------------------------------------------------------------------------
# RELATIVE LITTER MASS
# COVARIATE: LONGEVITY ONLY
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# RELATIVE LITTER MASS × INTERDIGITATION
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inter_lit_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "interdigitation",
          "relative_litter_mass",
          "longevity"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inter_lit_base$interdigitation <-
  make_valid_factor(
    x = model_inter_lit_base$interdigitation,
    allowed_levels = interdigitation_levels,
    variable_name = "interdigitation"
  )

model_inter_lit_base$relative_litter_mass <-
  log(model_inter_lit_base$relative_litter_mass)

model_inter_lit_base$longevity <-
  log(model_inter_lit_base$longevity)

prepared_inter_lit <-
  prepare_model_data(
    data = model_inter_lit_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "interdigitation",
      "relative_litter_mass",
      "longevity"
    )
  )

model_inter_lit_base <-
  prepared_inter_lit$data

tree_inter_lit <-
  prepared_inter_lit$tree

se_inter_lit_sensitivity <-
  prepare_se_vector(
    se_vector = se_inter_lit,
    model_data = model_inter_lit_base
  )

verify_model_inputs(
  model_data = model_inter_lit_base,
  model_tree = tree_inter_lit,
  se_vector = se_inter_lit_sensitivity,
  model_name = "Relative litter mass × interdigitation"
)


# -----------------------------------------------------------------------------
# Relative litter mass × interdigitation:
# Villous reference
# -----------------------------------------------------------------------------

model_inter_lit_vil <-
  as.data.frame(model_inter_lit_base)

model_inter_lit_vil$interdigitation <-
  stats::relevel(
    model_inter_lit_vil$interdigitation,
    ref = "Villous"
  )

inter_lit_no_ambiguous_pgls_vil <-
  pglsSEyPagel(
    model =
      relative_litter_mass ~
      interdigitation +
      longevity,
    data = model_inter_lit_vil,
    tree = tree_inter_lit,
    se = se_inter_lit_sensitivity,
    method = "ML"
  )

summary(inter_lit_no_ambiguous_pgls_vil)
summary(inter_lit_no_ambiguous_pgls_vil)$tTable
AIC(inter_lit_no_ambiguous_pgls_vil)


# -----------------------------------------------------------------------------
# Relative litter mass × interdigitation:
# Trabecular reference
# -----------------------------------------------------------------------------

model_inter_lit_trab <-
  as.data.frame(model_inter_lit_base)

model_inter_lit_trab$interdigitation <-
  stats::relevel(
    model_inter_lit_trab$interdigitation,
    ref = "Trabecular"
  )

inter_lit_no_ambiguous_pgls_trab <-
  pglsSEyPagel(
    model =
      relative_litter_mass ~
      interdigitation +
      longevity,
    data = model_inter_lit_trab,
    tree = tree_inter_lit,
    se = se_inter_lit_sensitivity,
    method = "ML"
  )

summary(inter_lit_no_ambiguous_pgls_trab)
summary(inter_lit_no_ambiguous_pgls_trab)$tTable
AIC(inter_lit_no_ambiguous_pgls_trab)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(inter_lit_no_ambiguous_pgls_vil)$tTable[
  "interdigitationTrabecular",
]

summary(inter_lit_no_ambiguous_pgls_vil)$tTable[
  "interdigitationLabyrinthine",
]

summary(inter_lit_no_ambiguous_pgls_trab)$tTable[
  "interdigitationLabyrinthine",
]


# -----------------------------------------------------------------------------
# RELATIVE LITTER MASS × INVASIVENESS
# SAME AMBIGUOUS-SPECIES-PRUNED DATASET
# -----------------------------------------------------------------------------

model_inv_lit_base <-
  as.data.frame(
    common_species_new_data1_no_ambiguous[
      stats::complete.cases(
        common_species_new_data1_no_ambiguous[, c(
          "species",
          "invasiveness",
          "relative_litter_mass",
          "longevity"
        )]
      ),
      ,
      drop = FALSE
    ]
  )

model_inv_lit_base$invasiveness <-
  make_valid_factor(
    x = model_inv_lit_base$invasiveness,
    allowed_levels = invasiveness_levels,
    variable_name = "invasiveness"
  )

model_inv_lit_base$relative_litter_mass <-
  log(model_inv_lit_base$relative_litter_mass)

model_inv_lit_base$longevity <-
  log(model_inv_lit_base$longevity)

prepared_inv_lit <-
  prepare_model_data(
    data = model_inv_lit_base,
    tree = alltree1,
    required_variables = c(
      "species",
      "invasiveness",
      "relative_litter_mass",
      "longevity"
    )
  )

model_inv_lit_base <-
  prepared_inv_lit$data

tree_inv_lit <-
  prepared_inv_lit$tree

se_inv_lit_sensitivity <-
  prepare_se_vector(
    se_vector = se_inv_lit,
    model_data = model_inv_lit_base
  )

verify_model_inputs(
  model_data = model_inv_lit_base,
  model_tree = tree_inv_lit,
  se_vector = se_inv_lit_sensitivity,
  model_name = "Relative litter mass × invasiveness"
)


# -----------------------------------------------------------------------------
# Relative litter mass × invasiveness:
# Epitheliochorial reference
# -----------------------------------------------------------------------------

model_inv_lit_epi <-
  as.data.frame(model_inv_lit_base)

model_inv_lit_epi$invasiveness <-
  stats::relevel(
    model_inv_lit_epi$invasiveness,
    ref = "Epitheliochorial"
  )

invas_lit_sensitivity_pgls_epi <-
  pglsSEyPagel(
    model =
      relative_litter_mass ~
      invasiveness +
      longevity,
    data = model_inv_lit_epi,
    tree = tree_inv_lit,
    se = se_inv_lit_sensitivity,
    method = "ML"
  )

summary(invas_lit_sensitivity_pgls_epi)
summary(invas_lit_sensitivity_pgls_epi)$tTable
AIC(invas_lit_sensitivity_pgls_epi)


# -----------------------------------------------------------------------------
# Relative litter mass × invasiveness:
# Endotheliochorial reference
# -----------------------------------------------------------------------------

model_inv_lit_endo <-
  as.data.frame(model_inv_lit_base)

model_inv_lit_endo$invasiveness <-
  stats::relevel(
    model_inv_lit_endo$invasiveness,
    ref = "Endotheliochorial"
  )

invas_lit_sensitivity_pgls_endo <-
  pglsSEyPagel(
    model =
      relative_litter_mass ~
      invasiveness +
      longevity,
    data = model_inv_lit_endo,
    tree = tree_inv_lit,
    se = se_inv_lit_sensitivity,
    method = "ML"
  )

summary(invas_lit_sensitivity_pgls_endo)
summary(invas_lit_sensitivity_pgls_endo)$tTable
AIC(invas_lit_sensitivity_pgls_endo)


# -----------------------------------------------------------------------------
# Extract three pairwise comparisons
# -----------------------------------------------------------------------------

summary(invas_lit_sensitivity_pgls_epi)$tTable[
  "invasivenessEndotheliochorial",
]

summary(invas_lit_sensitivity_pgls_epi)$tTable[
  "invasivenessHemochorial",
]

summary(invas_lit_sensitivity_pgls_endo)$tTable[
  "invasivenessHemochorial",
]
