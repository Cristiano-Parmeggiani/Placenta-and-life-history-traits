FILE: tables.xlsx
Sheet name: "AIC, BIC, logLIK"

Description: This sheet contains model comparison statistics for phylogenetic generalized least squares (PGLS) models testing associations between placental morphology and mammalian life history traits. Each row represents a fitted model using either placental invasiveness or interdigitation as predictors, with and without ln(longevity) as a covariate. All tables are available in the supplementary materials as .csv files as well.

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


Sheet name: "Coefficients"
Description: This sheet contains pairwise regression coefficient estimates from phylogenetic generalized least squares (PGLS) models testing the effects of placental morphology categories on mammalian life history traits. Each row represents a contrast between two placental morphology categories.

Column definitions:
Reference
Reference placental morphology category used as the baseline.

Contrast
Placental morphology category compared against the reference.

Estimate (β coefficient)
Regression coefficient representing the estimated effect of the contrast category relative to the reference category. Positive values indicate larger trait values in the contrast group relative to the reference group.

SE
Standard error of the regression coefficient estimate.

p_value
Probability value testing the null hypothesis that the coefficient equals zero.

Placenta and LH traits
Identifier specifying which life history trait and placental morphology variable were included in the model.

Examples:
neonate_invasiveness = model testing invasiveness effect on neonate body size
gestation_interdigitation = model testing interdigitation effect on gestation length

Note:
Models were fitted using phylogenetic generalized least squares with Pagel’s lambda estimated by maximum likelihood.



Sheet name: "Placenta combos"

Description: This sheet summarizes the frequency and taxonomic distribution of placental morphology combinations across mammalian species included in the dataset. Each row represents a unique combination of placental invasiveness and interdigitation type.

Column definitions:
Morphology Combination
Combined placental morphology category, consisting of invasiveness type and interdigitation type.

n species
Number of species in the dataset exhibiting this placental morphology combination.

Rarity
Qualitative classification of frequency:
Common: widespread across species
Rare: present in relatively few species
Very rare: present in extremely few species
Absent: not observed in dataset

Orders Most Represented (descending)
Taxonomic orders containing species with this placental morphology combination, listed in descending order of representation.

Numbers in parentheses indicate species counts within each order.
