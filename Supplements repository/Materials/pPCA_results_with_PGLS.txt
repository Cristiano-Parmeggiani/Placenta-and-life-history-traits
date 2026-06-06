FILE: pPCA_results_with_PGLS.xlsx

Sheet name: pPCA_variance

Description: This sheet summarizes the variance explained by each phylogenetic principal component axis. It reports the eigenvalue, proportion of total variance, and cumulative variance for PC1–PC4. PC1 explains the largest share of variation, followed by PC2; together, PC1 and PC2 account for approximately 77.3% of the total variation in the life-history trait dataset.


Columns definitions:

PC
Identifies the phylogenetic principal component axis. Each row corresponds to one pPCA axis, from PC1 to PC4.

eigenvalue
Reports the eigenvalue associated with each pPCA axis. Larger eigenvalues indicate that the corresponding axis captures more variation in the original life-history trait data.

proportion_variance
Reports the proportion of total multivariate variation explained by each pPCA axis. This value indicates how much of the overall trait variation is summarized by that individual component.

cumulative_variance
Reports the cumulative proportion of total variation explained up to and including each pPCA axis. This column shows how much variation is captured when multiple components are considered together.



Sheet name: pPCA_scores

Desription: This sheet contains the species-level scores from the phylogenetic PCA. Each row represents one species and includes its score on PC1–PC4, along with its placental invasiveness category and interdigitation category. These scores summarize each species’ position along the main multivariate life-history axes and can be used for visualization or downstream comparative analyses.

Columns definitions:

PC1
Species-level score on the first phylogenetic principal component axis. This value represents each species’ position along the main axis of multivariate life-history variation.

PC2
Species-level score on the second phylogenetic principal component axis. This value represents each species’ position along the second major axis of life-history variation, independent of PC1.

PC3
Species-level score on the third phylogenetic principal component axis. This value captures additional life-history variation not explained by PC1 or PC2.

PC4
Species-level score on the fourth phylogenetic principal component axis. This value captures the remaining multivariate variation among the included life-history traits.

species
Species name associated with each pPCA score, formatted using lowercase genus and species names separated by underscores.

invasiveness
Placental invasiveness category assigned to each species.

interdigitation
Placental interdigitation category assigned to each species. 


Sheet name: pPCA_loadings

Description: This sheet reports the loadings of each life-history trait on PC1–PC4. Loadings indicate how strongly each original log-transformed trait contributes to each principal component axis. PC1 primarily contrasts species along a broader life-history axis involving gestation length, interbirth interval, neonate body size, and litter size, whereas PC2 is especially influenced by interbirth interval and litter size.

Columns definition:

trait
Original log-transformed life-history trait included in the phylogenetic PCA. Each row shows how a given trait contributes to the pPCA axes.

PC1
Loading of each life-history trait on the first pPCA axis. The magnitude indicates how strongly the trait contributes to PC1, while the sign indicates the direction of the association with that axis.

PC2
Loading of each life-history trait on the second pPCA axis. The magnitude and sign indicate how each trait contributes to variation along PC2.

PC3
Loading of each life-history trait on the third pPCA axis. This column describes how each trait contributes to residual multivariate variation beyond PC1 and PC2.

PC4
Loading of each life-history trait on the fourth pPCA axis. This column describes how each trait contributes to the remaining variation captured by the final component.


Sheet name: pPCA1 PGLS coefficients

Description: This sheet contains the PGLS coefficient estimates for models using PC1 scores as the response variable. Models test whether placental interdigitation or placental invasiveness predicts variation in PC1, both alone and while controlling for covariates. Coefficients are shown with standard errors and p-values; categorical placenta terms are reported as contrasts relative to the reference category.

model
Name of the PGLS model being summarized. The model label identifies the pPCA response variable, the placental morphology predictor, and any included covariates.

term
Model term for which the coefficient is reported. For categorical placental predictors, terms are shown as contrasts relative to the reference category.

Value
Estimated regression coefficient for the corresponding model term. For categorical contrasts, this value represents the estimated difference from the reference category, holding included covariates constant.

Std.Error
Standard error of the coefficient estimate. This value indicates the uncertainty associated with the estimated effect size.

p-value
Statistical significance value associated with the coefficient test. Smaller p-values indicate stronger evidence that the corresponding model term is associated with variation in PC1 scores.


Sheet name: pPCA2 PGLS coefficients

Description: Description: This sheet contains the PGLS coefficient estimates for models using PC2 scores as the response variable. Models test whether placental interdigitation or placental invasiveness predicts variation in PC1, both alone and while controlling for covariates. Coefficients are shown with standard errors and p-values; categorical placenta terms are reported as contrasts relative to the reference category.

model
Name of the PGLS model being summarized. The model label identifies the pPCA response variable, the placental morphology predictor, and any included covariates.

term
Model term for which the coefficient is reported. For categorical placental predictors, terms are shown as contrasts relative to the reference category.

Value
Estimated regression coefficient for the corresponding model term. For categorical contrasts, this value represents the estimated difference from the reference category, holding included covariates constant.

Std.Error
Standard error of the coefficient estimate. This value indicates the uncertainty associated with the estimated effect size.

p-value
Statistical significance value associated with the coefficient test. Smaller p-values indicate stronger evidence that the corresponding model term is associated with variation in PC1 scores.
