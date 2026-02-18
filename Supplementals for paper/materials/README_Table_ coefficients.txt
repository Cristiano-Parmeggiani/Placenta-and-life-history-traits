FILE: Coefficients.csv

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