# =============================================================================
# Main PGLS: relative litter mass, relative neonate mass, and interbirth interval
# =============================================================================
# Purpose: Fit all interdigitation and invasiveness specifications for the remaining focal life-history traits.


# LITTER MASS

# Default factor with original reference
model_inv_litter1$invasiveness <- factor(model_inv_litter1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# Log transform variables
model_inv_litter1$relative_litter_mass <- log(model_inv_litter1$relative_litter_mass)
model_inv_litter1$longevity <- log(model_inv_litter1$longevity)
model_inv_litter1$body_mass_g <- log(model_inv_litter1$body_mass_g)

# NO COVARIATES
# Model: reference = Epitheliochorial
invas_lit_none_pgls_epi1 <- pglsSEyPagel(
  relative_litter_mass ~ invasiveness,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)
summary(invas_lit_none_pgls_epi1)

model_inv_litter1$invasiveness <- relevel(model_inv_litter1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_lit_none_pgls_endo1 <- pglsSEyPagel(
  relative_litter_mass ~ invasiveness,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)
summary(invas_lit_none_pgls_endo1)

# Reset
model_inv_litter1$invasiveness <- factor(model_inv_litter1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY ONLY
# Model: reference = Epitheliochorial
invas_lit_long_pgls_epi1 <- pglsSEyPagel(
  relative_litter_mass ~ invasiveness + longevity,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)
summary(invas_lit_long_pgls_epi1)

model_inv_litter1$invasiveness <- relevel(model_inv_litter1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_lit_long_pgls_endo1 <- pglsSEyPagel(
  relative_litter_mass ~ invasiveness + longevity,
  data = model_inv_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inv_litter1,
  method = "ML"
)
summary(invas_lit_long_pgls_endo1)

# Reset
model_inv_litter1$invasiveness <- factor(model_inv_litter1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# LITTER MASS

# Default factor with original reference
model_inter_litter1$interdigitation <- factor(model_inter_litter1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# Log transform variables
model_inter_litter1$relative_litter_mass <- log(model_inter_litter1$relative_litter_mass)
model_inter_litter1$longevity <- log(model_inter_litter1$longevity)
model_inter_litter1$body_mass_g <- log(model_inter_litter1$body_mass_g)

# NO COVARIATES
# Model: reference = Villous
inter_lit_none_pgls_vil1 <- pglsSEyPagel(
  relative_litter_mass ~ interdigitation,
  data = model_inter_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inter_litter1,
  method = "ML"
)
summary(inter_lit_none_pgls_vil1)

model_inter_litter1$interdigitation <- relevel(model_inter_litter1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_lit_none_pgls_trab1 <- pglsSEyPagel(
  relative_litter_mass ~ interdigitation,
  data = model_inter_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inter_litter1,
  method = "ML"
)
summary(inter_lit_none_pgls_trab1)

# Reset
model_inter_litter1$interdigitation <- factor(model_inter_litter1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY ONLY
# Model: reference = Villous
inter_lit_long_pgls_vil1 <- pglsSEyPagel(
  relative_litter_mass ~ interdigitation + longevity,
  data = model_inter_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inter_litter1,
  method = "ML"
)
summary(inter_lit_long_pgls_vil1)

model_inter_litter1$interdigitation <- relevel(model_inter_litter1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_lit_long_pgls_trab1 <- pglsSEyPagel(
  relative_litter_mass ~ interdigitation + longevity,
  data = model_inter_litter1,
  tree = comp_phylo_lit1$phy,
  se = se_inter_litter1,
  method = "ML"
)
summary(inter_lit_long_pgls_trab1)

# Reset
model_inter_litter1$interdigitation <- factor(model_inter_litter1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# NEONATE BODY WEIGHT / ADULT BODY WEIGHT

# Default factor with original reference
model_inv_neo1$invasiveness <- factor(model_inv_neo1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# Log transform variables
model_inv_neo1$neonate_over_adult <- log(model_inv_neo1$neonate_over_adult)
model_inv_neo1$longevity <- log(model_inv_neo1$longevity)
model_inv_neo1$body_mass_g <- log(model_inv_neo1$body_mass_g)

# NO COVARIATES
# Model: reference = Epitheliochorial
invas_neo_none_pgls_epi1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)
summary(invas_neo_none_pgls_epi1)

model_inv_neo1$invasiveness <- relevel(model_inv_neo1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_neo_none_pgls_endo1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)
summary(invas_neo_none_pgls_endo1)

# Reset
model_inv_neo1$invasiveness <- factor(model_inv_neo1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY ONLY
# Model: reference = Epitheliochorial
invas_neo_long_pgls_epi1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness + longevity,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)
summary(invas_neo_long_pgls_epi1)

model_inv_neo1$invasiveness <- relevel(model_inv_neo1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_neo_long_pgls_endo1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness + longevity,
  data = model_inv_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inv_neo1,
  method = "ML"
)
summary(invas_neo_long_pgls_endo1)

# Reset
model_inv_neo1$invasiveness <- factor(model_inv_neo1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# NEONATE BODY WEIGHT / ADULT BODY WEIGHT

# Default factor with original reference
model_inter_neo1$interdigitation <- factor(model_inter_neo1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# Log transform variables
model_inter_neo1$neonate_over_adult <- log(model_inter_neo1$neonate_over_adult)
model_inter_neo1$longevity <- log(model_inter_neo1$longevity)
model_inter_neo1$body_mass_g <- log(model_inter_neo1$body_mass_g)

# NO COVARIATES
# Model: reference = Villous
inter_neo_none_pgls_vil1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation,
  data = model_inter_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inter_neo1,
  method = "ML"
)
summary(inter_neo_none_pgls_vil1)

model_inter_neo1$interdigitation <- relevel(model_inter_neo1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_neo_none_pgls_trab1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation,
  data = model_inter_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inter_neo1,
  method = "ML"
)
summary(inter_neo_none_pgls_trab1)

# Reset
model_inter_neo1$interdigitation <- factor(model_inter_neo1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY ONLY
# Model: reference = Villous
inter_neo_long_pgls_vil1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation + longevity,
  data = model_inter_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inter_neo1,
  method = "ML"
)
summary(inter_neo_long_pgls_vil1)

model_inter_neo1$interdigitation <- relevel(model_inter_neo1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_neo_long_pgls_trab1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation + longevity,
  data = model_inter_neo1,
  tree = comp_phylo_neo1$phy,
  se = se_inter_neo1,
  method = "ML"
)
summary(inter_neo_long_pgls_trab1)

# Reset
model_inter_neo1$interdigitation <- factor(model_inter_neo1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# INTERBIRTH INTERVAL

# Default factor with original reference
model_inv_interval1$invasiveness <- factor(model_inv_interval1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# Log transform variables
model_inv_interval1$interbirth_interval <- log(model_inv_interval1$interbirth_interval)
model_inv_interval1$longevity <- log(model_inv_interval1$longevity)
model_inv_interval1$body_mass_g <- log(model_inv_interval1$body_mass_g)

# NO COVARIATES
# Model: reference = Epitheliochorial
invas_interval_none_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_none_pgls_epi1)

model_inv_interval1$invasiveness <- relevel(model_inv_interval1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_none_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_none_pgls_endo1)

# Reset
model_inv_interval1$invasiveness <- factor(model_inv_interval1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY ONLY
# Model: reference = Epitheliochorial
invas_interval_long_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_long_pgls_epi1)

model_inv_interval1$invasiveness <- relevel(model_inv_interval1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_long_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_long_pgls_endo1)

# Reset
model_inv_interval1$invasiveness <- factor(model_inv_interval1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_interval_adult_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_adult_pgls_epi1)

model_inv_interval1$invasiveness <- relevel(model_inv_interval1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_adult_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_adult_pgls_endo1)

# Reset
model_inv_interval1$invasiveness <- factor(model_inv_interval1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BOTH COVARIATES
# Model: reference = Epitheliochorial
invas_interval_both_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity + body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_both_pgls_epi1)

model_inv_interval1$invasiveness <- relevel(model_inv_interval1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_both_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity + body_mass_g,
  data = model_inv_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inv_interval1,
  method = "ML"
)
summary(invas_interval_both_pgls_endo1)

# Reset
model_inv_interval1$invasiveness <- factor(model_inv_interval1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# INTERBIRTH INTERVAL

# Default factor with original reference
model_inter_interval1$interdigitation <- factor(model_inter_interval1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# Log transform variables
model_inter_interval1$interbirth_interval <- log(model_inter_interval1$interbirth_interval)
model_inter_interval1$longevity <- log(model_inter_interval1$longevity)
model_inter_interval1$body_mass_g <- log(model_inter_interval1$body_mass_g)

# NO COVARIATES
# Model: reference = Villous
inter_interval_none_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_none_pgls_vil1)

model_inter_interval1$interdigitation <- relevel(model_inter_interval1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_none_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_none_pgls_trab1)

# Reset
model_inter_interval1$interdigitation <- factor(model_inter_interval1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY ONLY
# Model: reference = Villous
inter_interval_long_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_long_pgls_vil1)

model_inter_interval1$interdigitation <- relevel(model_inter_interval1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_long_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_long_pgls_trab1)

# Reset
model_inter_interval1$interdigitation <- factor(model_inter_interval1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BODY MASS ONLY
# Model: reference = Villous
inter_interval_adult_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + body_mass_g,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_adult_pgls_vil1)

model_inter_interval1$interdigitation <- relevel(model_inter_interval1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_adult_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + body_mass_g,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_adult_pgls_trab1)

# Reset
model_inter_interval1$interdigitation <- factor(model_inter_interval1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BOTH COVARIATES
# Model: reference = Villous
inter_interval_both_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity + body_mass_g,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_both_pgls_vil1)

model_inter_interval1$interdigitation <- relevel(model_inter_interval1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_both_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity + body_mass_g,
  data = model_inter_interval1,
  tree = comp_phylo_interval1$phy,
  se = se_inter_interval1,
  method = "ML"
)
summary(inter_interval_both_pgls_trab1)

# Reset
model_inter_interval1$interdigitation <- factor(model_inter_interval1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))
