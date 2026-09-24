# =============================================================================
# Export ambiguous-placentation sensitivity results
# =============================================================================
# Run after 09a, 09b, and 09c. The 12 registered models all use the same
# 47-species exclusion list prepared in 09a.

library(ape)
library(openxlsx)

output_dir1 <- if (exists("output_folder1")) output_folder1 else "results"
dir.create(output_dir1, recursive = TRUE, showWarnings = FALSE)

ambiguous_registry1 <- data.frame(
  model_name = c(
    "inter_ges_no_ambiguous_pgls_vil", "inter_ges_no_ambiguous_pgls_trab",
    "invas_ges_sensitivity_pgls_epi", "invas_ges_sensitivity_pgls_endo",
    "inter_interval_no_ambiguous_pgls_vil", "inter_interval_no_ambiguous_pgls_trab",
    "invas_interval_sensitivity_pgls_epi", "invas_interval_sensitivity_pgls_endo",
    "inter_lit_no_ambiguous_pgls_vil", "inter_lit_no_ambiguous_pgls_trab",
    "invas_lit_sensitivity_pgls_epi", "invas_lit_sensitivity_pgls_endo"
  ),
  response = rep(c("Gestation length", "Interbirth interval", "Relative litter mass"), each = 4),
  factor = rep(c("Interdigitation", "Interdigitation", "Invasiveness", "Invasiveness"), 3),
  reference = rep(c("Villous", "Trabecular", "Epitheliochorial", "Endotheliochorial"), 3),
  covariates = rep(c("log longevity + log body mass", "log body mass", "log longevity"), each = 4),
  data_object = rep(c(
    "model_inter_ges_base", "model_inv_ges_base",
    "model_inter_interval_base", "model_inv_interval_base",
    "model_inter_lit_base", "model_inv_lit_base"
  ), each = 2),
  tree_object = rep(c(
    "tree_inter_ges", "tree_inv_ges", "tree_inter_interval",
    "tree_inv_interval", "tree_inter_lit", "tree_inv_lit"
  ), each = 2),
  se_object = rep(c(
    "se_inter_ges_sensitivity", "se_inv_ges_sensitivity",
    "se_inter_interval_sensitivity", "se_inv_interval_sensitivity",
    "se_inter_lit_sensitivity", "se_inv_lit_sensitivity"
  ), each = 2),
  stringsAsFactors = FALSE
)

required1 <- unique(unlist(ambiguous_registry1[c("model_name", "data_object", "tree_object", "se_object")]))
missing1 <- required1[!vapply(required1, exists, logical(1), inherits = TRUE)]
if (length(missing1)) stop("Missing required objects: ", paste(missing1, collapse = ", "))

extract_lambda1 <- function(model1) {
  value1 <- tryCatch(as.numeric(coef(model1$modelStruct$corStruct, unconstrained = FALSE)),
                     error = function(e) NA_real_)
  if (!length(value1)) NA_real_ else value1[[1]]
}

extract_ambiguous_model1 <- function(i1) {
  row1 <- ambiguous_registry1[i1, , drop = FALSE]
  model1 <- get(row1$model_name, inherits = TRUE)
  data1 <- get(row1$data_object, inherits = TRUE)
  tree1 <- get(row1$tree_object, inherits = TRUE)
  se1 <- get(row1$se_object, inherits = TRUE)

  if (!identical(rownames(data1), tree1$tip.label) ||
      !identical(rownames(data1), names(se1)) ||
      nrow(data1) != ape::Ntip(tree1) || nrow(data1) != length(se1)) {
    stop(row1$model_name, ": data, tree, and SE vector are not aligned")
  }

  tab1 <- as.data.frame(summary(model1)$tTable, check.names = FALSE)
  tab1$term <- rownames(tab1)
  names(tab1)[names(tab1) == "Value"] <- "estimate"
  names(tab1)[names(tab1) == "Std.Error"] <- "standard_error"
  names(tab1)[names(tab1) == "DF"] <- "degrees_freedom"
  names(tab1)[names(tab1) == "t-value"] <- "t_value"
  names(tab1)[names(tab1) == "p-value"] <- "p_value"
  tab1$coefficient_type <- ifelse(
    tab1$term == "(Intercept)", "Intercept",
    ifelse(grepl("^(interdigitation|invasiveness)", tab1$term), "Placentation", "Covariate")
  )
  tab1$model_name <- row1$model_name
  tab1$response <- row1$response
  tab1$factor <- row1$factor
  tab1$reference <- row1$reference
  tab1$covariates <- row1$covariates
  tab1$n <- nobs(model1)
  tab1$lambda <- extract_lambda1(model1)
  tab1$AIC <- AIC(model1)
  tab1$log_likelihood <- as.numeric(logLik(model1))
  tab1[, c("response", "factor", "reference", "covariates", "model_name", "term",
           "coefficient_type", "estimate", "standard_error", "degrees_freedom",
           "t_value", "p_value", "n", "lambda", "AIC", "log_likelihood")]
}

ambiguous_coefficients1 <- do.call(rbind, lapply(seq_len(nrow(ambiguous_registry1)), extract_ambiguous_model1))
rownames(ambiguous_coefficients1) <- NULL
ambiguous_placentation_coefficients1 <- subset(ambiguous_coefficients1, coefficient_type == "Placentation")
ambiguous_covariate_coefficients1 <- subset(ambiguous_coefficients1, coefficient_type == "Covariate")
ambiguous_model_summary1 <- ambiguous_coefficients1[
  !duplicated(ambiguous_coefficients1$model_name),
  c("response", "factor", "reference", "covariates", "model_name", "n", "lambda", "AIC", "log_likelihood")
]

write.csv(ambiguous_model_summary1, file.path(output_dir1, "ambiguous_species_model_summary.csv"), row.names = FALSE)
write.csv(ambiguous_coefficients1, file.path(output_dir1, "ambiguous_species_all_coefficients.csv"), row.names = FALSE)
write.csv(ambiguous_placentation_coefficients1, file.path(output_dir1, "ambiguous_species_placentation_coefficients.csv"), row.names = FALSE)
write.csv(ambiguous_covariate_coefficients1, file.path(output_dir1, "ambiguous_species_covariate_coefficients.csv"), row.names = FALSE)

openxlsx::write.xlsx(
  list(
    `Model summary` = ambiguous_model_summary1,
    `All coefficients` = ambiguous_coefficients1,
    `Placentation coefficients` = ambiguous_placentation_coefficients1,
    `Covariate coefficients` = ambiguous_covariate_coefficients1
  ),
  file.path(output_dir1, "ambiguous_species_sensitivity_results.xlsx"),
  overwrite = TRUE
)

saveRDS(
  list(registry = ambiguous_registry1, model_summary = ambiguous_model_summary1,
       coefficients = ambiguous_coefficients1),
  file.path(output_dir1, "ambiguous_species_sensitivity_audit.rds")
)
