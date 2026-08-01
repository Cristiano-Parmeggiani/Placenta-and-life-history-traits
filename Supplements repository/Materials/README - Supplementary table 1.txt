FILE: Supplementary Table 1.csv

Sheet name: Model summary

Description: This sheet contains model comparison statistics for phylogenetic generalized least squares (PGLS) models testing associations between placental morphology and mammalian life history traits. Each row represents a fitted model using either placental invasiveness or interdigitation as predictors, with and without adult body mass, longevity, and female body mass as covariates.


Columns definitions:

trait
The life-history trait being tested.

model_name
Original name of the PGLS model as found in the shared code.

factor
Placental phenotype being analyzed (i.e., Interdigitation or Invasiveness).

reference
The placental category used as a reference level for this model.

covariates
Covariates included in the model. The models comprise of no covariates ("None"), Adult body mass, Longevity, Longevity + Adult body mass, Female body mass, and Longevity + Female Body mass.

AIC
Akaike Information Criterion. Lower values indicate better model fit.

Lambda
Estimated Pagel’s lambda, measuring phylogenetic signal in model residuals.

baseline_model
The name of the allometric model used as a contrast to calculate partial R2.

partial_R2
Proportion of model fit uniquely attributable to the placental morphology predictor, calculated by comparing the full PGLS model with a reduced model containing the same response variable and covariates but excluding the placental morphology term.

Sheet name: Coefficients

Description: This sheet contains pairwise regression coefficient estimates from phylogenetic generalized least squares (PGLS) models testing the effects of placental morphology categories on mammalian life history traits. Each row represents a contrast between two placental morphology categories.

Columns definitions:

trait
The life-history trait being tested.

model_name
Original name of the PGLS model as found in the shared code.

factor
Placental phenotype being analyzed (i.e., Interdigitation or Invasiveness).

reference
The placental category used as a reference level for this model.

covariates
Covariates included in the model. The models comprise of no covariates ("None"), Adult body mass, Longevity, Longevity + Adult body mass, Female body mass, and Longevity + Female Body mass.

contrast_term
Placental morphology category compared against the reference.

Estimate (β coefficient)
Regression coefficient representing the estimated effect of the contrast category relative to the reference category. Positive values indicate larger trait values in the contrast group relative to the reference group.

SE
Standard error of the regression coefficient estimate.

p_value
Probability value testing the null hypothesis that the coefficient equals zero.


Note:
Models were fitted using phylogenetic generalized least squares with Pagel’s lambda estimated by maximum likelihood.



