# =============================================================================
# Main PGLS: gestation length and litter size
# =============================================================================
# Purpose: Fit all interdigitation and invasiveness specifications for gestation length and litter size, including alternate reference levels and covariate sets.



model_inv_ges1 <- as.data.frame(model_inv_ges1)
rownames(model_inv_ges1) <- model_inv_ges1$spp
se_inv_ges1 <- rep(0.01, nrow(model_inv_ges1))
names(se_inv_ges1) <- rownames(model_inv_ges1)

model_inter_ges1 <- as.data.frame(model_inter_ges1)
rownames(model_inter_ges1) <- model_inter_ges1$spp
se_inter_ges1 <- rep(0.01, nrow(model_inter_ges1))
names(se_inter_ges1) <- rownames(model_inter_ges1)

model_inv_litter1 <- as.data.frame(model_inv_litter1)
rownames(model_inv_litter1) <- model_inv_litter1$spp
se_inv_litter1 <- rep(0.01, nrow(model_inv_litter1))
names(se_inv_litter1) <- rownames(model_inv_litter1)

model_inter_litter1 <- as.data.frame(model_inter_litter1)
rownames(model_inter_litter1) <- model_inter_litter1$spp
se_inter_litter1 <- rep(0.01, nrow(model_inter_litter1))
names(se_inter_litter1) <- rownames(model_inter_litter1)

model_inv_interval1 <- as.data.frame(model_inv_interval1)
rownames(model_inv_interval1) <- model_inv_interval1$spp
se_inv_interval1 <- rep(0.01, nrow(model_inv_interval1))
names(se_inv_interval1) <- rownames(model_inv_interval1)

model_inter_interval1 <- as.data.frame(model_inter_interval1)
rownames(model_inter_interval1) <- model_inter_interval1$spp
se_inter_interval1 <- rep(0.01, nrow(model_inter_interval1))
names(se_inter_interval1) <- rownames(model_inter_interval1)

model_inv_litsize1 <- as.data.frame(model_inv_litsize1)
rownames(model_inv_litsize1) <- model_inv_litsize1$spp
se_inv_litsize1 <- rep(0.01, nrow(model_inv_litsize1))
names(se_inv_litsize1) <- rownames(model_inv_litsize1)

model_inter_litsize1 <- as.data.frame(model_inter_litsize1)
rownames(model_inter_litsize1) <- model_inter_litsize1$spp
se_inter_litsize1 <- rep(0.01, nrow(model_inter_litsize1))
names(se_inter_litsize1) <- rownames(model_inter_litsize1)

model_inv_litsize1 <- as.data.frame(model_inv_litsize1)
rownames(model_inv_litsize1) <- model_inv_litsize1$spp
se_inv_litsize1 <- rep(0.01, nrow(model_inv_litsize1))
names(se_inv_litsize1) <- rownames(model_inv_litsize1)

model_inter_neo1 <- as.data.frame(model_inter_neo1)
rownames(model_inter_neo1) <- model_inter_neo1$spp
se_inter_neo1 <- rep(0.01, nrow(model_inter_neo1))
names(se_inter_neo1) <- rownames(model_inter_neo1)

model_inv_neo1 <- as.data.frame(model_inv_neo1)
rownames(model_inv_neo1) <- model_inv_neo1$spp
se_inv_neo1 <- rep(0.01, nrow(model_inv_neo1))
names(se_inv_neo1) <- rownames(model_inv_neo1)


# Female body mass subsets: gestation length
model_inv_ges_female1 <- as.data.frame(model_inv_ges_female1)
rownames(model_inv_ges_female1) <- model_inv_ges_female1$spp
se_inv_ges_female1 <- rep(0.01, nrow(model_inv_ges_female1))
names(se_inv_ges_female1) <- rownames(model_inv_ges_female1)

model_inter_ges_female1 <- as.data.frame(model_inter_ges_female1)
rownames(model_inter_ges_female1) <- model_inter_ges_female1$spp
se_inter_ges_female1 <- rep(0.01, nrow(model_inter_ges_female1))
names(se_inter_ges_female1) <- rownames(model_inter_ges_female1)


# Female body mass subsets: interbirth interval
model_inv_interval_female1 <- as.data.frame(model_inv_interval_female1)
rownames(model_inv_interval_female1) <- model_inv_interval_female1$spp
se_inv_interval_female1 <- rep(0.01, nrow(model_inv_interval_female1))
names(se_inv_interval_female1) <- rownames(model_inv_interval_female1)

model_inter_interval_female1 <- as.data.frame(model_inter_interval_female1)
rownames(model_inter_interval_female1) <- model_inter_interval_female1$spp
se_inter_interval_female1 <- rep(0.01, nrow(model_inter_interval_female1))
names(se_inter_interval_female1) <- rownames(model_inter_interval_female1)


# Female body mass subsets: litter mass
model_inv_litter_female1 <- as.data.frame(model_inv_litter_female1)
rownames(model_inv_litter_female1) <- model_inv_litter_female1$spp
se_inv_litter_female1 <- rep(0.01, nrow(model_inv_litter_female1))
names(se_inv_litter_female1) <- rownames(model_inv_litter_female1)

model_inter_litter_female1 <- as.data.frame(model_inter_litter_female1)
rownames(model_inter_litter_female1) <- model_inter_litter_female1$spp
se_inter_litter_female1 <- rep(0.01, nrow(model_inter_litter_female1))
names(se_inter_litter_female1) <- rownames(model_inter_litter_female1)


# Female body mass subsets: litter size
model_inv_litsize_female1 <- as.data.frame(model_inv_litsize_female1)
rownames(model_inv_litsize_female1) <- model_inv_litsize_female1$spp
se_inv_litsize_female1 <- rep(0.01, nrow(model_inv_litsize_female1))
names(se_inv_litsize_female1) <- rownames(model_inv_litsize_female1)

model_inter_litsize_female1 <- as.data.frame(model_inter_litsize_female1)
rownames(model_inter_litsize_female1) <- model_inter_litsize_female1$spp
se_inter_litsize_female1 <- rep(0.01, nrow(model_inter_litsize_female1))
names(se_inter_litsize_female1) <- rownames(model_inter_litsize_female1)


# Female body mass subsets: neonate body size
model_inv_neo_female1 <- as.data.frame(model_inv_neo_female1)
rownames(model_inv_neo_female1) <- model_inv_neo_female1$spp
se_inv_neo_female1 <- rep(0.01, nrow(model_inv_neo_female1))
names(se_inv_neo_female1) <- rownames(model_inv_neo_female1)

model_inter_neo_female1 <- as.data.frame(model_inter_neo_female1)
rownames(model_inter_neo_female1) <- model_inter_neo_female1$spp
se_inter_neo_female1 <- rep(0.01, nrow(model_inter_neo_female1))
names(se_inter_neo_female1) <- rownames(model_inter_neo_female1)


# GESTATION LENGTH

# Default factor with original reference
model_inv_ges1$invasiveness <- factor(model_inv_ges1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# Log transform variables
model_inv_ges1$gestation_length <- log(model_inv_ges1$gestation_length)
model_inv_ges1$longevity <- log(model_inv_ges1$longevity)
model_inv_ges1$body_mass_g <- log(model_inv_ges1$body_mass_g)

# NO COVARIATES
# Model: reference = Epitheliochorial
invas_ges_none_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_none_pgls_epi1)

model_inv_ges1$invasiveness <- relevel(model_inv_ges1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_none_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_none_pgls_endo1)

# Reset
model_inv_ges1$invasiveness <- factor(model_inv_ges1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY ONLY
# Model: reference = Epitheliochorial
invas_ges_long_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_long_pgls_epi1)

model_inv_ges1$invasiveness <- relevel(model_inv_ges1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_long_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_long_pgls_endo1)

# Reset
model_inv_ges1$invasiveness <- factor(model_inv_ges1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_ges_adult_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_adult_pgls_epi1)

model_inv_ges1$invasiveness <- relevel(model_inv_ges1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_adult_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_adult_pgls_endo1)

# Reset
model_inv_ges1$invasiveness <- factor(model_inv_ges1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BOTH COVARIATES
# Model: reference = Epitheliochorial
invas_ges_both_pgls_epi1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity + body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_both_pgls_epi1)

model_inv_ges1$invasiveness <- relevel(model_inv_ges1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_ges_both_pgls_endo1 <- pglsSEyPagel(
  gestation_length ~ invasiveness + longevity + body_mass_g,
  data = model_inv_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inv_ges1,
  method = "ML"
)
summary(invas_ges_both_pgls_endo1)

# Reset
model_inv_ges1$invasiveness <- factor(model_inv_ges1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# GESTATION LENGTH

# Default factor with original reference
model_inter_ges1$interdigitation <- factor(model_inter_ges1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# Log transform variables
model_inter_ges1$gestation_length <- log(model_inter_ges1$gestation_length)
model_inter_ges1$longevity <- log(model_inter_ges1$longevity)
model_inter_ges1$body_mass_g <- log(model_inter_ges1$body_mass_g)

# NO COVARIATES
# Model: reference = Villous
inter_ges_none_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_none_pgls_vil1)

model_inter_ges1$interdigitation <- relevel(model_inter_ges1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_none_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_none_pgls_trab1)

# Reset
model_inter_ges1$interdigitation <- factor(model_inter_ges1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY ONLY
# Model: reference = Villous
inter_ges_long_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_long_pgls_vil1)

model_inter_ges1$interdigitation <- relevel(model_inter_ges1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_long_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_long_pgls_trab1)

# Reset
model_inter_ges1$interdigitation <- factor(model_inter_ges1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BODY MASS ONLY
# Model: reference = Villous
inter_ges_adult_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + body_mass_g,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_adult_pgls_vil1)

model_inter_ges1$interdigitation <- relevel(model_inter_ges1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_adult_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + body_mass_g,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_adult_pgls_trab1)

# Reset
model_inter_ges1$interdigitation <- factor(model_inter_ges1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BOTH COVARIATES
# Model: reference = Villous
inter_ges_both_pgls_vil1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity + body_mass_g,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_both_pgls_vil1)

model_inter_ges1$interdigitation <- relevel(model_inter_ges1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_ges_both_pgls_trab1 <- pglsSEyPagel(
  gestation_length ~ interdigitation + longevity + body_mass_g,
  data = model_inter_ges1,
  tree = comp_phylo_ges1$phy,
  se = se_inter_ges1,
  method = "ML"
)
summary(inter_ges_both_pgls_trab1)

# Reset
model_inter_ges1$interdigitation <- factor(model_inter_ges1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))


# LITTER SIZE

# Default factor with original reference
model_inv_litsize1$invasiveness <- factor(model_inv_litsize1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# Log transform variables
model_inv_litsize1$litter_size <- log(model_inv_litsize1$litter_size)
model_inv_litsize1$longevity <- log(model_inv_litsize1$longevity)
model_inv_litsize1$body_mass_g <- log(model_inv_litsize1$body_mass_g)

# NO COVARIATES
# Model: reference = Epitheliochorial
invas_litsize_none_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_none_pgls_epi1)

model_inv_litsize1$invasiveness <- relevel(model_inv_litsize1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_none_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_none_pgls_endo1)

# Reset
model_inv_litsize1$invasiveness <- factor(model_inv_litsize1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# LONGEVITY ONLY
# Model: reference = Epitheliochorial
invas_litsize_long_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_long_pgls_epi1)

model_inv_litsize1$invasiveness <- relevel(model_inv_litsize1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_long_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_long_pgls_endo1)

# Reset
model_inv_litsize1$invasiveness <- factor(model_inv_litsize1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BODY MASS ONLY
# Model: reference = Epitheliochorial
invas_litsize_adult_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness + body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_adult_pgls_epi1)

model_inv_litsize1$invasiveness <- relevel(model_inv_litsize1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_adult_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness + body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_adult_pgls_endo1)

# Reset
model_inv_litsize1$invasiveness <- factor(model_inv_litsize1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))

# BOTH COVARIATES
# Model: reference = Epitheliochorial
invas_litsize_both_pgls_epi1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity + body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_both_pgls_epi1)

model_inv_litsize1$invasiveness <- relevel(model_inv_litsize1$invasiveness, ref = "Endotheliochorial")

# Model: reference = Endotheliochorial
invas_litsize_both_pgls_endo1 <- pglsSEyPagel(
  litter_size ~ invasiveness + longevity + body_mass_g,
  data = model_inv_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inv_litsize1,
  method = "ML"
)
summary(invas_litsize_both_pgls_endo1)

# Reset
model_inv_litsize1$invasiveness <- factor(model_inv_litsize1$invasiveness, levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial"))


# LITTER SIZE

# Default factor with original reference
model_inter_litsize1$interdigitation <- factor(model_inter_litsize1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# Log transform variables
model_inter_litsize1$litter_size <- log(model_inter_litsize1$litter_size)
model_inter_litsize1$longevity <- log(model_inter_litsize1$longevity)
model_inter_litsize1$body_mass_g <- log(model_inter_litsize1$body_mass_g)

# NO COVARIATES
# Model: reference = Villous
inter_litsize_none_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_none_pgls_vil1)

model_inter_litsize1$interdigitation <- relevel(model_inter_litsize1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_none_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_none_pgls_trab1)

# Reset
model_inter_litsize1$interdigitation <- factor(model_inter_litsize1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# LONGEVITY ONLY
# Model: reference = Villous
inter_litsize_long_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_long_pgls_vil1)

model_inter_litsize1$interdigitation <- relevel(model_inter_litsize1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_long_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_long_pgls_trab1)

# Reset
model_inter_litsize1$interdigitation <- factor(model_inter_litsize1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BODY MASS ONLY
# Model: reference = Villous
inter_litsize_adult_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation + body_mass_g,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_adult_pgls_vil1)

model_inter_litsize1$interdigitation <- relevel(model_inter_litsize1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_adult_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation + body_mass_g,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_adult_pgls_trab1)

# Reset
model_inter_litsize1$interdigitation <- factor(model_inter_litsize1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))

# BOTH COVARIATES
# Model: reference = Villous
inter_litsize_both_pgls_vil1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity + body_mass_g,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_both_pgls_vil1)

model_inter_litsize1$interdigitation <- relevel(model_inter_litsize1$interdigitation, ref = "Trabecular")

# Model: reference = Trabecular
inter_litsize_both_pgls_trab1 <- pglsSEyPagel(
  litter_size ~ interdigitation + longevity + body_mass_g,
  data = model_inter_litsize1,
  tree = comp_phylo_litsize1$phy,
  se = se_inter_litsize1,
  method = "ML"
)
summary(inter_litsize_both_pgls_trab1)

# Reset
model_inter_litsize1$interdigitation <- factor(model_inter_litsize1$interdigitation, levels = c("Villous", "Trabecular", "Labyrinthine"))
