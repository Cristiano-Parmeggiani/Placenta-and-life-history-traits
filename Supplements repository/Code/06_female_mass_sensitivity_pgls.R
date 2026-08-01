# =============================================================================
# Female-body-mass sensitivity PGLS
# =============================================================================
# Purpose: Repeat focal PGLS analyses using female body mass where available to evaluate sensitivity to the allometric covariate.


# FEMALE SUBSET — GESTATION LENGTH


model_inv_ges_female1$invasiveness <- factor(model_inv_ges_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

model_inv_ges_female1$gestation_length <- log(model_inv_ges_female1$gestation_length)
model_inv_ges_female1$longevity <- log(model_inv_ges_female1$longevity)
model_inv_ges_female1$female_body_mass_g <- log(model_inv_ges_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_ges_female_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)
summary(invas_ges_female_pgls_epi1)

model_inv_ges_female1$invasiveness <- relevel(model_inv_ges_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_female_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)
summary(invas_ges_female_pgls_endo1)

# Reset
model_inv_ges_female1$invasiveness <- factor(model_inv_ges_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Epitheliochorial
invas_ges_longfemale_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)
summary(invas_ges_longfemale_pgls_epi1)

model_inv_ges_female1$invasiveness <- relevel(model_inv_ges_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_longfemale_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inv_ges_female1,
  method = "ML"
)
summary(invas_ges_longfemale_pgls_endo1)

# Reset
model_inv_ges_female1$invasiveness <- factor(model_inv_ges_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# FEMALE SUBSET — GESTATION LENGTH


model_inter_ges_female1$interdigitation <- factor(model_inter_ges_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

model_inter_ges_female1$gestation_length <- log(model_inter_ges_female1$gestation_length)
model_inter_ges_female1$longevity <- log(model_inter_ges_female1$longevity)
model_inter_ges_female1$female_body_mass_g <- log(model_inter_ges_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Villous
inter_ges_female_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + female_body_mass_g,
  data = model_inter_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inter_ges_female1,
  method = "ML"
)
summary(inter_ges_female_pgls_vil1)

model_inter_ges_female1$interdigitation <- relevel(model_inter_ges_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_female_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + female_body_mass_g,
  data = model_inter_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inter_ges_female1,
  method = "ML"
)
summary(inter_ges_female_pgls_trab1)

# Reset
model_inter_ges_female1$interdigitation <- factor(model_inter_ges_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Villous
inter_ges_longfemale_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inter_ges_female1,
  method = "ML"
)
summary(inter_ges_longfemale_pgls_vil1)

model_inter_ges_female1$interdigitation <- relevel(model_inter_ges_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_longfemale_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_ges_female1,
  tree = comp_phylo_ges_female1$phy,
  se = se_inter_ges_female1,
  method = "ML"
)
summary(inter_ges_longfemale_pgls_trab1)

# Reset
model_inter_ges_female1$interdigitation <- factor(model_inter_ges_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# FEMALE SUBSET — LITTER SIZE


model_inv_litsize_female1$invasiveness <- factor(model_inv_litsize_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

model_inv_litsize_female1$litter_size <- log(model_inv_litsize_female1$litter_size)
model_inv_litsize_female1$longevity <- log(model_inv_litsize_female1$longevity)
model_inv_litsize_female1$female_body_mass_g <- log(model_inv_litsize_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_litsize_female_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness + female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)
summary(invas_litsize_female_pgls_epi1)

model_inv_litsize_female1$invasiveness <- relevel(model_inv_litsize_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_female_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness + female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)
summary(invas_litsize_female_pgls_endo1)

# Reset
model_inv_litsize_female1$invasiveness <- factor(model_inv_litsize_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Epitheliochorial
invas_litsize_longfemale_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)
summary(invas_litsize_longfemale_pgls_epi1)

model_inv_litsize_female1$invasiveness <- relevel(model_inv_litsize_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_longfemale_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inv_litsize_female1,
  method = "ML"
)
summary(invas_litsize_longfemale_pgls_endo1)

# Reset
model_inv_litsize_female1$invasiveness <- factor(model_inv_litsize_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# FEMALE SUBSET — LITTER SIZE


model_inter_litsize_female1$interdigitation <- factor(model_inter_litsize_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

model_inter_litsize_female1$litter_size <- log(model_inter_litsize_female1$litter_size)
model_inter_litsize_female1$longevity <- log(model_inter_litsize_female1$longevity)
model_inter_litsize_female1$female_body_mass_g <- log(model_inter_litsize_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Villous
inter_litsize_female_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation + female_body_mass_g,
  data = model_inter_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inter_litsize_female1,
  method = "ML"
)
summary(inter_litsize_female_pgls_vil1)

model_inter_litsize_female1$interdigitation <- relevel(model_inter_litsize_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_female_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation + female_body_mass_g,
  data = model_inter_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inter_litsize_female1,
  method = "ML"
)
summary(inter_litsize_female_pgls_trab1)

# Reset
model_inter_litsize_female1$interdigitation <- factor(model_inter_litsize_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Villous
inter_litsize_longfemale_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inter_litsize_female1,
  method = "ML"
)
summary(inter_litsize_longfemale_pgls_vil1)

model_inter_litsize_female1$interdigitation <- relevel(model_inter_litsize_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_longfemale_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_litsize_female1,
  tree = comp_phylo_litsize_female1$phy,
  se = se_inter_litsize_female1,
  method = "ML"
)
summary(inter_litsize_longfemale_pgls_trab1)

# Reset
model_inter_litsize_female1$interdigitation <- factor(model_inter_litsize_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# FEMALE SUBSET — LITTER MASS

model_inv_litter_female1$invasiveness <- factor(model_inv_litter_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

model_inv_litter_female1$relative_litter_mass_female <- log(model_inv_litter_female1$relative_litter_mass_female)
model_inv_litter_female1$longevity <- log(model_inv_litter_female1$longevity)
model_inv_litter_female1$female_body_mass_g <- log(model_inv_litter_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_lit_female_pgls_epi1 <- pglsSEyPagel(
  relative_litter_mass_female ~ invasiveness,
  data = model_inv_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inv_litter_female1,
  method = "ML"
)
summary(invas_lit_female_pgls_epi1)

model_inv_litter_female1$invasiveness <- relevel(model_inv_litter_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_lit_female_pgls_endo1 <- pglsSEyPagel(
  relative_litter_mass_female ~ invasiveness,
  data = model_inv_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inv_litter_female1,
  method = "ML"
)
summary(invas_lit_female_pgls_endo1)

# Reset
model_inv_litter_female1$invasiveness <- factor(model_inv_litter_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY
# Model: reference = Epitheliochorial
invas_lit_longfemale_pgls_epi1 <- pglsSEyPagel(
  relative_litter_mass_female ~ invasiveness + longevity,
  data = model_inv_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inv_litter_female1,
  method = "ML"
)
summary(invas_lit_longfemale_pgls_epi1)

model_inv_litter_female1$invasiveness <- relevel(model_inv_litter_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_lit_longfemale_pgls_endo1 <- pglsSEyPagel(
  relative_litter_mass_female ~ invasiveness + longevity,
  data = model_inv_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inv_litter_female1,
  method = "ML"
)
summary(invas_lit_longfemale_pgls_endo1)

# Reset
model_inv_litter_female1$invasiveness <- factor(model_inv_litter_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# FEMALE SUBSET — LITTER MASS

model_inter_litter_female1$interdigitation <- factor(model_inter_litter_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

model_inter_litter_female1$relative_litter_mass_female <- log(model_inter_litter_female1$relative_litter_mass_female)
model_inter_litter_female1$longevity <- log(model_inter_litter_female1$longevity)
model_inter_litter_female1$female_body_mass_g <- log(model_inter_litter_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Villous
inter_lit_female_pgls_vil1 <- pglsSEyPagel(
  relative_litter_mass_female ~ interdigitation,
  data = model_inter_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inter_litter_female1,
  method = "ML"
)
summary(inter_lit_female_pgls_vil1)

model_inter_litter_female1$interdigitation <- relevel(model_inter_litter_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_lit_female_pgls_trab1 <- pglsSEyPagel(
  relative_litter_mass_female ~ interdigitation,
  data = model_inter_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inter_litter_female1,
  method = "ML"
)
summary(inter_lit_female_pgls_trab1)

# Reset
model_inter_litter_female1$interdigitation <- factor(model_inter_litter_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY
# Model: reference = Villous
inter_lit_longfemale_pgls_vil1 <- pglsSEyPagel(
  relative_litter_mass_female ~ interdigitation + longevity,
  data = model_inter_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inter_litter_female1,
  method = "ML"
)
summary(inter_lit_longfemale_pgls_vil1)

model_inter_litter_female1$interdigitation <- relevel(model_inter_litter_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_lit_longfemale_pgls_trab1 <- pglsSEyPagel(
  relative_litter_mass_female ~ interdigitation + longevity,
  data = model_inter_litter_female1,
  tree = comp_phylo_lit_female1$phy,
  se = se_inter_litter_female1,
  method = "ML"
)
summary(inter_lit_longfemale_pgls_trab1)

# Reset
model_inter_litter_female1$interdigitation <- factor(model_inter_litter_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# FEMALE SUBSET — NEONATE BODY WEIGHT / FEMALE BODY WEIGHT

model_inv_neo_female1$invasiveness <- factor(model_inv_neo_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

model_inv_neo_female1$neonate_over_adult <- log(model_inv_neo_female1$neonate_over_adult)
model_inv_neo_female1$longevity <- log(model_inv_neo_female1$longevity)
model_inv_neo_female1$female_body_mass_g <- log(model_inv_neo_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_neo_female_pgls_epi1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness,
  data = model_inv_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inv_neo_female1,
  method = "ML"
)
summary(invas_neo_female_pgls_epi1)

model_inv_neo_female1$invasiveness <- relevel(model_inv_neo_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_neo_female_pgls_endo1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness,
  data = model_inv_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inv_neo_female1,
  method = "ML"
)
summary(invas_neo_female_pgls_endo1)

# Reset
model_inv_neo_female1$invasiveness <- factor(model_inv_neo_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Epitheliochorial
invas_neo_longfemale_pgls_epi1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness + longevity,
  data = model_inv_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inv_neo_female1,
  method = "ML"
)
summary(invas_neo_longfemale_pgls_epi1)

model_inv_neo_female1$invasiveness <- relevel(model_inv_neo_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_neo_longfemale_pgls_endo1 <- pglsSEyPagel(
  neonate_over_adult ~ invasiveness + longevity,
  data = model_inv_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inv_neo_female1,
  method = "ML"
)
summary(invas_neo_longfemale_pgls_endo1)

# Reset
model_inv_neo_female1$invasiveness <- factor(model_inv_neo_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# FEMALE SUBSET — NEONATE BODY WEIGHT / FEMALE BODY WEIGHT

model_inter_neo_female1$interdigitation <- factor(model_inter_neo_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

model_inter_neo_female1$neonate_over_adult <- log(model_inter_neo_female1$neonate_over_adult)
model_inter_neo_female1$longevity <- log(model_inter_neo_female1$longevity)
model_inter_neo_female1$female_body_mass_g <- log(model_inter_neo_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Villous
inter_neo_female_pgls_vil1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation,
  data = model_inter_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inter_neo_female1,
  method = "ML"
)
summary(inter_neo_female_pgls_vil1)

model_inter_neo_female1$interdigitation <- relevel(model_inter_neo_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_neo_female_pgls_trab1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation,
  data = model_inter_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inter_neo_female1,
  method = "ML"
)
summary(inter_neo_female_pgls_trab1)

# Reset
model_inter_neo_female1$interdigitation <- factor(model_inter_neo_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Villous
inter_neo_longfemale_pgls_vil1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation + longevity,
  data = model_inter_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inter_neo_female1,
  method = "ML"
)
summary(inter_neo_longfemale_pgls_vil1)

model_inter_neo_female1$interdigitation <- relevel(model_inter_neo_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_neo_longfemale_pgls_trab1 <- pglsSEyPagel(
  neonate_over_adult ~ interdigitation + longevity,
  data = model_inter_neo_female1,
  tree = comp_phylo_neo_female1$phy,
  se = se_inter_neo_female1,
  method = "ML"
)
summary(inter_neo_longfemale_pgls_trab1)

# Reset
model_inter_neo_female1$interdigitation <- factor(model_inter_neo_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# FEMALE SUBSET — INTERBIRTH INTERVAL

model_inv_interval_female1$invasiveness <- factor(model_inv_interval_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

model_inv_interval_female1$interbirth_interval <- log(model_inv_interval_female1$interbirth_interval)
model_inv_interval_female1$longevity <- log(model_inv_interval_female1$longevity)
model_inv_interval_female1$female_body_mass_g <- log(model_inv_interval_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_interval_female_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)
summary(invas_interval_female_pgls_epi1)

model_inv_interval_female1$invasiveness <- relevel(model_inv_interval_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_female_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)
summary(invas_interval_female_pgls_endo1)

# Reset
model_inv_interval_female1$invasiveness <- factor(model_inv_interval_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Epitheliochorial
invas_interval_longfemale_pgls_epi1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)
summary(invas_interval_longfemale_pgls_epi1)

model_inv_interval_female1$invasiveness <- relevel(model_inv_interval_female1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_interval_longfemale_pgls_endo1 <- pglsSEyPagel(
  interbirth_interval ~ invasiveness + longevity + female_body_mass_g,
  data = model_inv_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inv_interval_female1,
  method = "ML"
)
summary(invas_interval_longfemale_pgls_endo1)

# Reset
model_inv_interval_female1$invasiveness <- factor(model_inv_interval_female1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# FEMALE SUBSET — INTERBIRTH INTERVAL

model_inter_interval_female1$interdigitation <- factor(model_inter_interval_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

model_inter_interval_female1$interbirth_interval <- log(model_inter_interval_female1$interbirth_interval)
model_inter_interval_female1$longevity <- log(model_inter_interval_female1$longevity)
model_inter_interval_female1$female_body_mass_g <- log(model_inter_interval_female1$female_body_mass_g)

# FEMALE BODY MASS ONLY
# Model: reference = Villous
inter_interval_female_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + female_body_mass_g,
  data = model_inter_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inter_interval_female1,
  method = "ML"
)
summary(inter_interval_female_pgls_vil1)

model_inter_interval_female1$interdigitation <- relevel(model_inter_interval_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_female_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + female_body_mass_g,
  data = model_inter_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inter_interval_female1,
  method = "ML"
)
summary(inter_interval_female_pgls_trab1)

# Reset
model_inter_interval_female1$interdigitation <- factor(model_inter_interval_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY + FEMALE BODY MASS
# Model: reference = Villous
inter_interval_longfemale_pgls_vil1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inter_interval_female1,
  method = "ML"
)
summary(inter_interval_longfemale_pgls_vil1)

model_inter_interval_female1$interdigitation <- relevel(model_inter_interval_female1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_interval_longfemale_pgls_trab1 <- pglsSEyPagel(
  interbirth_interval ~ interdigitation + longevity + female_body_mass_g,
  data = model_inter_interval_female1,
  tree = comp_phylo_interval_female1$phy,
  se = se_inter_interval_female1,
  method = "ML"
)
summary(inter_interval_longfemale_pgls_trab1)

# Reset
model_inter_interval_female1$interdigitation <- factor(model_inter_interval_female1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))
