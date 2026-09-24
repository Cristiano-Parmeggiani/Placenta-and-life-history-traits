R PACKAGES USED IN THE ANALYSIS
===============================

Purpose
This file documents the R packages explicitly loaded by the archived analysis
code.



PACKAGES, VERSIONS, PURPOSES, AND CITATIONS


ape
---
Version: 5.8-1
Description: Provides functions for importing, manipulating, pruning, and
analyzing phylogenetic trees. In this workflow it supports tree handling,
species matching, and phylogenetic comparative analyses.
Citation: Paradis E, Schliep K (2019). ape 5.0: an environment for modern
phylogenetics and evolutionary analyses in R. Bioinformatics 35(3):526-528.
https://doi.org/10.1093/bioinformatics/bty633

caper
-----
Version: 1.0.4
Description: Provides tools for phylogenetic comparative analysis, including
the construction of comparative-data objects and phylogenetic generalized
least-squares workflows.
Citation: Orme D, Freckleton R, Thomas G, Petzoldt T, Fritz S, Isaac N,
Pearse W (2025). caper: Comparative Analyses of Phylogenetics and Evolution
in R. R package version 1.0.4. https://github.com/davidorme/caper

dplyr
-----
Version: 1.1.4
Description: Used for data filtering, selection, joining, mutation, grouping,
summarization, and construction of analysis and results tables.
Citation: Wickham H, François R, Henry L, Müller K, Vaughan D (2023). dplyr:
A Grammar of Data Manipulation. R package version 1.1.4.
https://CRAN.R-project.org/package=dplyr

geiger
------
Version: 2.0.11
Description: Provides methods for evolutionary and phylogenetic comparative
analysis and supporting phylogenetic-data operations.
Citation: Pennell MW, Eastman JM, Slater GJ, Brown JW, Uyeda JC,
FitzJohn RG, Alfaro ME, Harmon LJ (2014). geiger v2.0: an expanded suite of
methods for fitting macroevolutionary models to phylogenetic trees.
Bioinformatics 30(15):2216-2218.
https://doi.org/10.1093/bioinformatics/btu181

janitor
-------
Version: 2.2.1
Description: Used to standardize imported column names and assist with the
cleaning of tabular source data.
Citation: Firke S (2023). janitor: Simple Tools for Examining and Cleaning
Dirty Data. R package version 2.2.1.
https://CRAN.R-project.org/package=janitor

nlme
----
Version: 3.1-168
Description: Supplies generalized least-squares models, variance structures,
and phylogenetic correlation structures used by the custom PGLS functions.
Citation: Pinheiro JC, Bates DM (2000). Mixed-Effects Models in S and S-PLUS.
Springer, New York. https://doi.org/10.1007/b98882
Package citation: Pinheiro J, Bates D, R Core Team. nlme: Linear and Nonlinear
Mixed Effects Models. R package version 3.1-168.
https://CRAN.R-project.org/package=nlme

openxlsx
--------
Version: 4.2.8
Description: Used to create, format, and save the Excel workbooks containing
the supplementary model summaries, coefficients, pPCA results, and sensitivity
results.
Citation: Schauberger P, Walker A (2025). openxlsx: Read, Write and Edit xlsx
Files. R package version 4.2.8.
https://CRAN.R-project.org/package=openxlsx

phytools
--------
Version: 2.4-4
Description: Provides phylogenetic comparative tools used for the phylogenetic
PCA and for phylogenetic correlation structures in the PGLS workflow.
Citations:
Revell LJ (2012). phytools: an R package for phylogenetic comparative biology
(and other things). Methods in Ecology and Evolution 3(2):217-223.
https://doi.org/10.1111/j.2041-210X.2011.00169.x
Revell LJ (2024). phytools 2.0: an updated R ecosystem for phylogenetic
comparative methods (and other things). PeerJ 12:e16505.
https://doi.org/10.7717/peerj.16505

readr
-----
Version: 2.1.5
Description: Used to import and export comma-delimited datasets with explicit,
reproducible parsing behavior.
Citation: Wickham H, Hester J, Bryan J (2024). readr: Read Rectangular Text
Data. R package version 2.1.5.
https://CRAN.R-project.org/package=readr

stringr
-------
Version: 1.6.0
Description: Used for consistent string parsing, replacement, trimming, and
standardization of species names, model names, and imported values.
Citation: Wickham H (2025). stringr: Simple, Consistent Wrappers for Common
String Operations. R package version 1.6.0.
https://CRAN.R-project.org/package=stringr

tibble
------
Version: 3.3.0
Description: Provides modern data-frame objects and helper functions used to
construct model metadata and results tables.
Citation: Müller K, Wickham H (2025). tibble: Simple Data Frames. R package
version 3.3.0. https://CRAN.R-project.org/package=tibble

tidyr
-----
Version: 1.3.1
Description: Used for missing-value handling, data reshaping, and generation
of the complete set of placental-category combinations.
Citation: Wickham H, Vaughan D, Girlich M (2024). tidyr: Tidy Messy Data.
R package version 1.3.1. https://CRAN.R-project.org/package=tidyr

tidyverse
---------
Version: 2.0.0
Description: Loads the core tidyverse collection used for data import,
cleaning, transformation, visualization, and functional programming. Several
of its component packages are also loaded or referenced explicitly and are
therefore documented separately above.
Citation: Wickham H, Averick M, Bryan J, Chang W, McGowan LD, François R,
Grolemund G, Hayes A, Henry L, Hester J, Kuhn M, Pedersen TL, Miller E,
Bache SM, Müller K, Ooms J, Robinson D, Seidel DP, Spinu V, Takahashi K,
Vaughan D, Wilke C, Woo K, Yutani H (2019). Welcome to the tidyverse.
Journal of Open Source Software 4(43):1686.
https://doi.org/10.21105/joss.01686
