FILE: Supplementary Table 1.xlsx

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

n
Number of species included in the fitted model after rows with missing values were excluded.

AIC
Akaike Information Criterion. Lower values indicate better model fit.

Lambda
Estimated Pagel’s lambda, measuring phylogenetic signal in model residuals.

baseline_model
The name of the allometric model used as a contrast to calculate partial R2.

partial_R2
Proportion of model fit uniquely attributable to the placental morphology predictor, calculated by comparing the full PGLS model with a reduced model containing the same response variable and covariates but excluding the placental morphology term.

LR_chisq
Likelihood-ratio chi-square statistic comparing the full model containing the placental morphology factor with the corresponding baseline model containing the same response variable and covariates but excluding the placental morphology factor.

LR_p_value
P-value from the likelihood-ratio test comparing the full model with the corresponding baseline model. It tests whether adding the placental morphology factor significantly improves model fit.



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

t_value
Test statistic calculated as the coefficient estimate divided by its standard error. It tests the null hypothesis that the corresponding coefficient equals zero.

p_value
Probability value testing the null hypothesis that the coefficient equals zero.


Note:
Models were fitted using phylogenetic generalized least squares with Pagel’s lambda estimated by maximum likelihood.



Sheet name: Relaxed lambda comparison

Description: This sheet compares each original PGLS model, in which Pagel’s lambda was constrained to the interval 0–1, with the corresponding sensitivity model fitted using a relaxed lambda interval of 0–2. It reports the estimated lambda and AIC for each version and indicates whether relaxing the upper bound changed the statistical conclusion.

Column definitions:

model
Name assigned to the PGLS model fitted using the relaxed lambda interval.

original_model_name
Name of the corresponding original PGLS model fitted with lambda constrained to the interval 0–1.

original_lambda
Maximum-likelihood estimate of Pagel’s lambda from the original model, constrained to the interval 0–1.

relaxed_lambda
Maximum-likelihood estimate of Pagel’s lambda from the sensitivity model, estimated over the relaxed interval 0–2.

original_AIC
Akaike Information Criterion value for the original model.

relaxed_AIC
Akaike Information Criterion value for the corresponding model fitted using the relaxed lambda interval.

delta_AIC
Difference in AIC between the relaxed and original versions of the model, calculated as relaxed_AIC minus original_AIC. Negative values indicate a lower AIC for the relaxed-lambda model, whereas positive values indicate a lower AIC for the original model.

conclusion_changed
Indicator of whether relaxing the lambda interval changed the inferential conclusion for the placental morphology effect relative to the original model.


Sheet name: Relaxed lambda coefficients

Description: This sheet reports coefficient estimates from the PGLS sensitivity models fitted with Pagel’s lambda estimated over the relaxed interval 0–2. Coefficients for categorical placental predictors are expressed relative to the reference category used in the corresponding model.

Column definitions:

model
Name of the PGLS model fitted using the relaxed lambda interval.

term
Model term for which the coefficient is reported. Categorical placental morphology terms represent contrasts with the model’s reference category.

Value
Estimated regression coefficient for the corresponding model term. For a categorical contrast, this is the estimated difference between the indicated category and the reference category, holding any included covariates constant.

Std.Error
Standard error of the estimated regression coefficient.

t-value
Test statistic calculated as the coefficient estimate divided by its standard error.

p-value
P-value testing the null hypothesis that the corresponding regression coefficient equals zero.