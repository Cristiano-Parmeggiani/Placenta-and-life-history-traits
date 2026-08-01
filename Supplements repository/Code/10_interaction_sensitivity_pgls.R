# =============================================================================
# Body-mass by longevity interaction sensitivity PGLS
# =============================================================================
# Purpose: Evaluate whether allometric scaling by body mass changes with longevity for gestation length and interbirth interval.



# -----------------------------------------------------------------------------
# GESTATION LENGTH — BODY MASS × LONGEVITY INTERACTION
# -----------------------------------------------------------------------------

# Ensure reference = Villous
model_inter_ges1$interdigitation <- factor(
  model_inter_ges1$interdigitation,
  levels = c(
    "Villous",
    "Trabecular",
    "Labyrinthine"
  )
)

# Model: interdigitation
inter_ges_interaction_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~
    interdigitation +
    longevity * body_mass_g,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)

summary(inter_ges_interaction_pgls_vil1)


# Model: invasiveness
inv_ges_interaction_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~
    invasiveness +
    longevity * body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)

summary(inv_ges_interaction_pgls_epi1)


# Reset reference = Villous
model_inter_ges1$interdigitation <- factor(
  model_inter_ges1$interdigitation,
  levels = c(
    "Villous",
    "Trabecular",
    "Labyrinthine"
  )
)


# Compare additive and interaction models
AIC(
  inter_ges_both_pgls_vil1,
  inter_ges_interaction_pgls_vil1
)

# -----------------------------------------------------------------------------
# INTERBIRTH INTERVAL — BODY MASS × LONGEVITY INTERACTION
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Set placental reference categories
# -----------------------------------------------------------------------------

# Interdigitation reference = Villous
model_inter_interval1$interdigitation <- factor(
  model_inter_interval1$interdigitation,
  levels = c(
    "Villous",
    "Trabecular",
    "Labyrinthine"
  )
)

# Invasiveness reference = Epitheliochorial
model_inv_interval1$invasiveness <- factor(
  model_inv_interval1$invasiveness,
  levels = c(
    "Epitheliochorial",
    "Endotheliochorial",
    "Hemochorial"
  )
)


# -----------------------------------------------------------------------------
# Interdigitation interaction model
# -----------------------------------------------------------------------------

inter_interval_interaction_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~
    interdigitation +
    longevity * body_mass_g,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)

summary(inter_interval_interaction_pgls_vil1)


# -----------------------------------------------------------------------------
# Invasiveness interaction model
# -----------------------------------------------------------------------------

inv_interval_interaction_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~
    invasiveness +
    longevity * body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)

summary(inv_interval_interaction_pgls_epi1)

# Compare each interaction model with the corresponding additive specification.
AIC(inter_ges_both_pgls_vil1, inter_ges_interaction_pgls_vil1)
AIC(invas_ges_both_pgls_epi1, inv_ges_interaction_pgls_epi1)
AIC(inter_interval_both_pgls_vil1, inter_interval_interaction_pgls_vil1)
AIC(invas_interval_both_pgls_epi1, inv_interval_interaction_pgls_epi1)
