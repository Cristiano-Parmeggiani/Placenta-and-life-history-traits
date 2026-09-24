# =============================================================================
# Export body-mass by longevity interaction sensitivity results
# =============================================================================
# Run after 10_interaction_sensitivity_pgls.R.

output_dir1 <- if (exists("output_folder1")) output_folder1 else "results"
dir.create(output_dir1, recursive = TRUE, showWarnings = FALSE)

interaction_pairs1 <- data.frame(
  response = c("Gestation length", "Gestation length", "Interbirth interval", "Interbirth interval"),
  factor = c("Interdigitation", "Invasiveness", "Interdigitation", "Invasiveness"),
  interaction_model = c(
    "inter_ges_interaction_pgls_vil1", "inv_ges_interaction_pgls_epi1",
    "inter_interval_interaction_pgls_vil1", "inv_interval_interaction_pgls_epi1"
  ),
  additive_model = c(
    "inter_ges_both_pgls_vil1", "invas_ges_both_pgls_epi1",
    "inter_interval_both_pgls_vil1", "invas_interval_both_pgls_epi1"
  ),
  stringsAsFactors = FALSE
)

required1 <- unique(c(interaction_pairs1$interaction_model, interaction_pairs1$additive_model))
missing1 <- required1[!vapply(required1, exists, logical(1), inherits = TRUE)]
if (length(missing1)) stop("Missing required models: ", paste(missing1, collapse = ", "))

interaction_summary1 <- do.call(rbind, lapply(seq_len(nrow(interaction_pairs1)), function(i1) {
  row1 <- interaction_pairs1[i1, ]
  full1 <- get(row1$interaction_model, inherits = TRUE)
  reduced1 <- get(row1$additive_model, inherits = TRUE)
  lr1 <- 2 * (as.numeric(logLik(full1)) - as.numeric(logLik(reduced1)))
  df1 <- attr(logLik(full1), "df") - attr(logLik(reduced1), "df")
  data.frame(
    response = row1$response, factor = row1$factor,
    interaction_model = row1$interaction_model, additive_model = row1$additive_model,
    n = nobs(full1), additive_AIC = AIC(reduced1), interaction_AIC = AIC(full1),
    delta_AIC = AIC(full1) - AIC(reduced1), LR_chisq = lr1, LR_df = df1,
    LR_p_value = pchisq(lr1, df = df1, lower.tail = FALSE)
  )
}))

interaction_coefficients1 <- do.call(rbind, lapply(interaction_pairs1$interaction_model, function(name1) {
  tab1 <- as.data.frame(summary(get(name1, inherits = TRUE))$tTable, check.names = FALSE)
  tab1$term <- rownames(tab1)
  tab1$model <- name1
  rownames(tab1) <- NULL
  tab1[, c("model", "term", setdiff(names(tab1), c("model", "term")))]
}))

write.csv(interaction_summary1, file.path(output_dir1, "interaction_sensitivity_model_comparison.csv"), row.names = FALSE)
write.csv(interaction_coefficients1, file.path(output_dir1, "interaction_sensitivity_coefficients.csv"), row.names = FALSE)
saveRDS(
  mget(interaction_pairs1$interaction_model, inherits = TRUE),
  file.path(output_dir1, "interaction_sensitivity_models.rds")
)
