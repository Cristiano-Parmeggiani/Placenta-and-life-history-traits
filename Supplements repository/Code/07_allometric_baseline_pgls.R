# =============================================================================
# Allometric baseline PGLS
# =============================================================================
# Purpose: Fit models without placental predictors for likelihood, AIC, and incremental explanatory-power comparisons.


# -----------------------------------------------------------------------------
# BASELINE PGLS MODELS WITHOUT PLACENTATION
# Allometric models for reviewer comparison
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Gestation length
# -----------------------------------------------------------------------------

ges_none_pgls1 <- pglsSEyPagel(
  gestation_length ~ 1,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)

ges_adult_pgls1 <- pglsSEyPagel(
  gestation_length ~ body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)

ges_long_pgls1 <- pglsSEyPagel(
  gestation_length ~ longevity,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)

ges_long_adult_pgls1 <- pglsSEyPagel(
  gestation_length ~ longevity + body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)

ges_female_pgls1 <- pglsSEyPagel(
  gestation_length ~ female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)


# -----------------------------------------------------------------------------
# Interbirth interval
# -----------------------------------------------------------------------------

ibi_none_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ 1,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)

ibi_adult_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)

ibi_long_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ longevity,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)

ibi_long_adult_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ longevity + body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)

ibi_female_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)

# -----------------------------------------------------------------------------
# Litter mass
# -----------------------------------------------------------------------------

litmass_none_pgls1 <- pglsSEyPagel(
  relative_litter_mass ~ 1,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)

litmass_long_pgls1 <- pglsSEyPagel(
  relative_litter_mass ~ longevity,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)

litmass_female_pgls1 <- pglsSEyPagel(
  relative_litter_mass_female ~ 1,
  data = model_inv_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inv_litter_female1,
  method = "ML"
)


# Litter size# ------------------------------------------------------------

# Only run this if the litter-size dataset is called `litsize`
# and the response column is called `litter_size`
# -----------------------------------------------------------------------------


litsize_none_pgls1 <- pglsSEyPagel(
  litter_size ~ 1,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)

litsize_adult_pgls1 <- pglsSEyPagel(
  litter_size ~ body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)

litsize_long_pgls1 <- pglsSEyPagel(
  litter_size ~ longevity,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)

litsize_long_adult_pgls1 <- pglsSEyPagel(
  litter_size ~ longevity + body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)

litsize_female_pgls1 <- pglsSEyPagel(
  litter_size ~ female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)

# -----------------------------------------------------------------------------
# Neonate body size

# -----------------------------------------------------------------------------

neo_none_pgls1 <- pglsSEyPagel(
  neonate_over_adult ~ 1,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)


neo_long_pgls1 <- pglsSEyPagel(
  neonate_over_adult ~ longevity,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)

neo_female_pgls1 <- pglsSEyPagel(
  neonate_over_adult ~ 1,
  data = model_inv_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inv_neo_female1,
  method = "ML"
)

# Additional allometric models

ges_longfemale_pgls1 <- pglsSEyPagel(
  gestation_length ~ longevity + female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)

ibi_longfemale_pgls1 <- pglsSEyPagel(
  interbirth_interval ~ longevity + female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)


litsize_longfemale_pgls1 <- pglsSEyPagel(
  litter_size ~ longevity + female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)
