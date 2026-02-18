FILE: Table_AIC_BIC_logLIK.csv

Description: This file contains model comparison statistics for phylogenetic generalized least squares (PGLS) models testing associations between placental morphology and mammalian life history traits. Each row represents a fitted model using either placental invasiveness or interdigitation as predictors, with and without ln(longevity) as a covariate.

Column definitions:
Model
Description of the base PGLS model, including response variable and predictor.

AIC
Akaike Information Criterion. Lower values indicate better model fit.

BIC
Bayesian Information Criterion. Lower values indicate better model fit with stronger penalty for model complexity.

logLik
Log-likelihood of the fitted model.

Lambda
Estimated Pagel’s lambda, measuring phylogenetic signal in model residuals.

Model.1
Alternative model including ln(longevity) as an additional predictor.

AIC.1
AIC for the alternative model.

ΔAIC
Difference between alternative and base model AIC values:
ΔAIC = AIC.1 − AIC
Negative values indicate improved model fit with ln(longevity).

BIC.1
BIC for the alternative model.

ΔBIC
Difference between alternative and base model BIC values.
Negative values indicate improved model fit with ln(longevity).

logLik.1
Log-likelihood of the alternative model.

ΔlogLik
Difference in log-likelihood between alternative and base models.

Lambda.1
Estimated Pagel’s lambda for the alternative model.

Note:
All models were fitted using phylogenetic generalized least squares with maximum likelihood estimation of Pagel’s lambda.
