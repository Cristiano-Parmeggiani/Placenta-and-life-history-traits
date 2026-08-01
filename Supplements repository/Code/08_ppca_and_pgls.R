# =============================================================================
# Phylogenetic PCA and PGLS of pPC1 and pPC2
# =============================================================================
# Purpose: Construct the phylogenetic PCA from log-transformed life-history traits and test both retained components against placental morphology and allometric covariates.


ppca_data1 <- common_species_new_data1 %>%
  dplyr::select(
    species,
    gestation_length,
    interbirth_interval,
    litter_size,
    neonate_body_size,
    body_mass_g,
    longevity,
    invasiveness,
    interdigitation
  ) %>%
  dplyr::filter(
    !is.na(gestation_length),
    !is.na(interbirth_interval),
    !is.na(litter_size),
    !is.na(neonate_body_size),
    !is.na(body_mass_g),
    !is.na(longevity),
    gestation_length > 0,
    interbirth_interval > 0,
    litter_size > 0,
    neonate_body_size > 0,
    body_mass_g > 0,
    longevity > 0
  ) %>%
  dplyr::mutate(
    log_neonate_body_size = log(neonate_body_size),
    log_gestation_length = log(gestation_length),
    log_interbirth_interval = log(interbirth_interval),
    log_litter_size = log(litter_size),
    log_body_mass_g = log(body_mass_g),
    log_longevity = log(longevity)
  )

# Check rows N
nrow(ppca_data1)

ppca_tree1 <- ape::keep.tip(
  neotree1,
  ppca_data1$species
)

# Check if tree tip match with data
ppca_data1 <- ppca_data1 %>%
  dplyr::filter(species %in% ppca_tree1$tip.label)

ppca_data1 <- ppca_data1[
  match(ppca_tree1$tip.label, ppca_data1$species),
]

identical(ppca_tree1$tip.label, ppca_data1$species)

# pPCA matrix generation
ppca_matrix1 <- ppca_data1 %>%
  dplyr::select(
    log_gestation_length,
    log_interbirth_interval,
    log_litter_size,
    log_neonate_body_size
  ) %>%
  as.matrix()

rownames(ppca_matrix1) <- ppca_data1$species

# Run the phylogenetic PCA
ppca_result1 <- phytools::phyl.pca(
  ppca_tree1,
  ppca_matrix1,
  method = "lambda",
  mode = "corr"
)

# Inspect pPCA
ppca_result1$Eval / sum(ppca_result1$Eval)
ppca_result1$Evec

# Save pPCA scores

ppca_loadings1 <- as.data.frame(ppca_result1$L)
ppca_loadings1$trait <- rownames(ppca_loadings1)

evals1 <- diag(ppca_result1$Eval)

ppca_variance1 <- data.frame(
  PC = names(evals1),
  eigenvalue = as.numeric(evals1),
  proportion_variance = as.numeric(evals1 / sum(evals1)),
  cumulative_variance = cumsum(as.numeric(evals1 / sum(evals1)))
)

ppca_variance1

ppca_scores1 <- as.data.frame(ppca_result1$S)
ppca_scores1$species <- rownames(ppca_scores1)

ppca_scores1 <- ppca_scores1 %>%
  dplyr::left_join(
    ppca_data1 %>%
      dplyr::select(
        species,
        invasiveness,
        interdigitation,
        log_body_mass_g,
        log_longevity
      ),
    by = "species"
  )

colnames(ppca_scores1)


# Check for missing values
head(ppca_scores1)
colSums(is.na(ppca_scores1))

# Now PGLS on pPCA
rownames(ppca_scores1) <- ppca_scores1$species

se_ppca1 <- rep(0.01, nrow(ppca_scores1))
names(se_ppca1) <- rownames(ppca_scores1)

inter_ppca_pgls_vil1 <- pglsSEyPagel(
  PC1 ~ interdigitation,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca_pgls_epi1 <- pglsSEyPagel(
  PC1 ~ invasiveness,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca_pgls_adult_vil1 <- pglsSEyPagel(
  PC1 ~ interdigitation + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca_pgls_adult_epi1 <- pglsSEyPagel(
  PC1 ~ invasiveness + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca_pgls_long_vil1 <- pglsSEyPagel(
  PC1 ~ interdigitation + log_longevity,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca_pgls_long_epi1 <- pglsSEyPagel(
  PC1 ~ invasiveness + log_longevity,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca_pgls_both_vil1 <- pglsSEyPagel(
  PC1 ~ interdigitation + log_longevity + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca_pgls_both_epi1 <- pglsSEyPagel(
  PC1 ~ invasiveness + log_longevity + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

summary(inter_ppca_pgls_vil1)

summary(invas_ppca_pgls_epi1)

summary(inter_ppca_pgls_adult_vil1)

summary(invas_ppca_pgls_adult_epi1)

summary(inter_ppca_pgls_long_vil1)

summary(invas_ppca_pgls_long_epi1)

summary(inter_ppca_pgls_both_vil1)

summary(invas_ppca_pgls_both_epi1)

# PGLS analysis of the second phylogenetic principal component

ppca_data1$PC2 <- ppca_scores1$PC2

pc2_inter_pgls_vil1 <- pglsSEyPagel(
  PC2 ~ interdigitation,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

pc2_invas_pgls_epi1 <- pglsSEyPagel(
  PC2 ~ invasiveness,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca2_pgls_adult_vil1 <- pglsSEyPagel(
  PC2 ~ interdigitation + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca2_pgls_adult_epi1 <- pglsSEyPagel(
  PC2 ~ invasiveness + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca2_pgls_long_vil1 <- pglsSEyPagel(
  PC2 ~ interdigitation + log_longevity,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca2_pgls_long_epi1 <- pglsSEyPagel(
  PC2 ~ invasiveness + log_longevity,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

inter_ppca2_pgls_both_vil1 <- pglsSEyPagel(
  PC2 ~ interdigitation + log_longevity + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

invas_ppca2_pgls_both_epi1 <- pglsSEyPagel(
  PC2 ~ invasiveness + log_longevity + log_body_mass_g,
  data = ppca_scores1,
  tree = ppca_tree1,
  se = se_ppca1,
  method = "ML"
)

summary(pc2_inter_pgls_vil1)$tTable

summary(pc2_invas_pgls_epi1)$tTable

summary(inter_ppca2_pgls_adult_vil1)$tTable

summary(invas_ppca2_pgls_adult_epi1)$tTable

summary(inter_ppca2_pgls_long_vil1)$tTable

summary(invas_ppca2_pgls_long_epi1)$tTable

summary(inter_ppca2_pgls_both_vil1)$tTable

summary(invas_ppca2_pgls_both_epi1)$tTable
