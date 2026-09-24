# =============================================================================
# Relaxed Pagel's lambda sensitivity analysis
# =============================================================================
# Refit the 11 models whose original lambda estimate reached the upper bound,
# allowing lambda to vary from 0 to 2.

library(ape)
library(nlme)
library(phytools)
library(future)
library(future.apply)

output_dir1 <- if (exists("output_folder1")) output_folder1 else "results"
dir.create(output_dir1, recursive = TRUE, showWarnings = FALSE)

pglsSEyPagelObjectiveRelaxed1 <- function(lambda, model, data, tree, ...) {
  tryCatch(
    -as.numeric(logLik(modPgls.SEy(
      model = model, data = data, tree = tree, corClassValue = lambda,
      corClass = corPagel, fixed = TRUE, ...
    ))),
    error = function(e) Inf
  )
}

pglsSEyPagelRelaxed1 <- function(model, data, tree, lambdaInterval = c(0, 2), ...) {
  optimum1 <- optimize(
    pglsSEyPagelObjectiveRelaxed1, interval = lambdaInterval,
    model = model, data = data, tree = tree, ...
  )
  if (!is.finite(optimum1$objective)) stop("No valid lambda estimate was found")
  fitted1 <- modPgls.SEy(
    model = model, data = data, tree = tree, corClass = corPagel,
    fixed = TRUE, corClassValue = optimum1$minimum, ...
  )
  attr(fitted1, "estimated_lambda") <- optimum1$minimum
  fitted1
}

model_inv_interval_female1$invasiveness <- factor(
  model_inv_interval_female1$invasiveness,
  levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial")
)
model_inv_litsize1$invasiveness <- factor(
  model_inv_litsize1$invasiveness,
  levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial")
)
model_inv_litsize_female1$invasiveness <- factor(
  model_inv_litsize_female1$invasiveness,
  levels = c("Epitheliochorial", "Endotheliochorial", "Hemochorial")
)
model_inter_litsize_female1$interdigitation <- factor(
  model_inter_litsize_female1$interdigitation,
  levels = c("Villous", "Trabecular", "Labyrinthine")
)

relaxed_model_specs1 <- list(
  invas_interval_female = list(formula = interbirth_interval ~ invasiveness + female_body_mass_g,
    data = model_inv_interval_female1, tree = comp_phylo_interval_female1$phy, se = se_inv_interval_female1),
  invas_interval_longfemale = list(formula = interbirth_interval ~ invasiveness + longevity + female_body_mass_g,
    data = model_inv_interval_female1, tree = comp_phylo_interval_female1$phy, se = se_inv_interval_female1),
  invas_litsize_none = list(formula = litter_size ~ invasiveness,
    data = model_inv_litsize1, tree = comp_phylo_litsize1$phy, se = se_inv_litsize1),
  invas_litsize_female = list(formula = litter_size ~ invasiveness + female_body_mass_g,
    data = model_inv_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inv_litsize_female1),
  invas_litsize_longfemale = list(formula = litter_size ~ invasiveness + longevity + female_body_mass_g,
    data = model_inv_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inv_litsize_female1),
  inter_litsize_female = list(formula = litter_size ~ interdigitation + female_body_mass_g,
    data = model_inter_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inter_litsize_female1),
  inter_litsize_longfemale = list(formula = litter_size ~ interdigitation + longevity + female_body_mass_g,
    data = model_inter_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inter_litsize_female1),
  ibi_female_baseline = list(formula = interbirth_interval ~ female_body_mass_g,
    data = model_inv_interval_female1, tree = comp_phylo_interval_female1$phy, se = se_inv_interval_female1),
  litsize_none_baseline = list(formula = litter_size ~ 1,
    data = model_inv_litsize1, tree = comp_phylo_litsize1$phy, se = se_inv_litsize1),
  litsize_female_baseline = list(formula = litter_size ~ female_body_mass_g,
    data = model_inv_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inv_litsize_female1),
  litsize_longfemale_baseline = list(formula = litter_size ~ longevity + female_body_mass_g,
    data = model_inv_litsize_female1, tree = comp_phylo_litsize_female1$phy, se = se_inv_litsize_female1)
)

workers1 <- max(1, min(4, future::availableCores() - 1))
future::plan(future::multisession, workers = workers1)

relaxed_models1 <- future.apply::future_lapply(
  relaxed_model_specs1,
  function(spec1) pglsSEyPagelRelaxed1(
    model = spec1$formula, data = spec1$data, tree = spec1$tree,
    se = spec1$se, method = "ML", lambdaInterval = c(0, 2)
  ),
  future.packages = c("ape", "nlme", "phytools"),
  future.seed = TRUE
)

stopifnot(length(relaxed_models1) == 11L)

relaxed_summary1 <- do.call(rbind, lapply(names(relaxed_models1), function(name1) {
  model1 <- relaxed_models1[[name1]]
  data.frame(
    model = name1, lambda = attr(model1, "estimated_lambda"),
    AIC = AIC(model1), logLik = as.numeric(logLik(model1)), n = nobs(model1)
  )
}))

relaxed_coefficients1 <- do.call(rbind, lapply(names(relaxed_models1), function(name1) {
  tab1 <- as.data.frame(summary(relaxed_models1[[name1]])$tTable, check.names = FALSE)
  tab1$term <- rownames(tab1)
  tab1$model <- name1
  rownames(tab1) <- NULL
  tab1[, c("model", "term", setdiff(names(tab1), c("model", "term")))]
}))

relaxed_placental_coefficients1 <- relaxed_coefficients1[
  grepl("invasiveness|interdigitation", relaxed_coefficients1$term), , drop = FALSE
]

write.csv(relaxed_summary1, file.path(output_dir1, "relaxed_lambda_model_summary.csv"), row.names = FALSE)
write.csv(relaxed_coefficients1, file.path(output_dir1, "relaxed_lambda_coefficients.csv"), row.names = FALSE)
write.csv(relaxed_placental_coefficients1, file.path(output_dir1, "relaxed_lambda_placental_coefficients.csv"), row.names = FALSE)
saveRDS(relaxed_models1, file.path(output_dir1, "relaxed_lambda_models.rds"))

future::plan(future::sequential)
