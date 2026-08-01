# =============================================================================
# Ambiguous-placentation sensitivity setup
# =============================================================================
# Purpose: Exclude documented ambiguous placental assignments and define reusable validation functions that align each sensitivity dataset, tree, and standard-error vector.


library(ape)
library(nlme)


# -----------------------------------------------------------------------------
# REQUIRED OBJECT CHECKS
# -----------------------------------------------------------------------------

# First check the objects needed to construct the litter-mass
# SE vectors.

core_required_objects <- c(
  "common_species_new_data1",
  "alltree1",
  "se_inter_ges1",
  "se_inv_ges1",
  "se_inter_interval1",
  "se_inv_interval1"
)

missing_core_objects <- core_required_objects[
  !vapply(
    core_required_objects,
    exists,
    logical(1),
    inherits = TRUE
  )
]

if (length(missing_core_objects) > 0) {
  stop(
    paste0(
      "The following required objects do not exist: ",
      paste(missing_core_objects, collapse = ", ")
    )
  )
}


# -----------------------------------------------------------------------------
# CREATE RELATIVE-LITTER-MASS SE VECTORS
# -----------------------------------------------------------------------------
# This follows the previous workflow, which used a fixed
# default SE of 0.01 for relative litter mass.
# -----------------------------------------------------------------------------

se_inter_lit <- stats::setNames(
  rep(
    0.01,
    nrow(common_species_new_data1)
  ),
  common_species_new_data1$species
)

se_inv_lit <- stats::setNames(
  rep(
    0.01,
    nrow(common_species_new_data1)
  ),
  common_species_new_data1$species
)


# -----------------------------------------------------------------------------
# VERIFY ALL REQUIRED OBJECTS
# -----------------------------------------------------------------------------

required_objects <- c(
  "common_species_new_data1",
  "alltree1",
  "se_inter_ges1",
  "se_inv_ges1",
  "se_inter_interval1",
  "se_inv_interval1",
  "se_inter_lit",
  "se_inv_lit"
)

missing_objects <- required_objects[
  !vapply(
    required_objects,
    exists,
    logical(1),
    inherits = TRUE
  )
]

if (length(missing_objects) > 0) {
  stop(
    paste0(
      "The following required objects do not exist: ",
      paste(missing_objects, collapse = ", ")
    )
  )
}

if (!exists(
  "pglsSEyPagel",
  mode = "function",
  inherits = TRUE
)) {
  stop(
    paste0(
      "The function pglsSEyPagel() has not been loaded. ",
      "Source or define it before running this script."
    )
  )
}

if (anyDuplicated(common_species_new_data1$species)) {

  duplicated_species <- unique(
    common_species_new_data1$species[
      duplicated(common_species_new_data1$species) |
        duplicated(
          common_species_new_data1$species,
          fromLast = TRUE
        )
    ]
  )

  stop(
    paste0(
      "Duplicate species occur in common_species_new_data1: ",
      paste(duplicated_species, collapse = ", ")
    )
  )
}

if (anyDuplicated(alltree1$tip.label)) {

  duplicated_tree_tips <- unique(
    alltree1$tip.label[
      duplicated(alltree1$tip.label) |
        duplicated(
          alltree1$tip.label,
          fromLast = TRUE
        )
    ]
  )

  stop(
    paste0(
      "Duplicate species occur in alltree1: ",
      paste(duplicated_tree_tips, collapse = ", ")
    )
  )
}


# -----------------------------------------------------------------------------
# SPECIES EXCLUDED FROM ALL ANALYSES
# -----------------------------------------------------------------------------
# The same pruned dataset is used for both interdigitation
# and invasiveness models.
# -----------------------------------------------------------------------------

ambiguous_placentation_species <- c(

  # Cercopithecidae
  "allenopithecus_nigroviridis",
  "cercocebus_agilis",
  "cercocebus_chrysogaster",
  "cercocebus_torquatus",
  "cercopithecus_cephus",
  "cercopithecus_diana",
  "cercopithecus_hamlyni",
  "cercopithecus_mitis",
  "cercopithecus_mona",
  "cercopithecus_neglectus",
  "chlorocebus_aethiops",
  "chlorocebus_pygerythrus",
  "chlorocebus_sabaeus",
  "colobus_angolensis",
  "colobus_guereza",
  "erythrocebus_patas",
  "lophocebus_aterrimus",
  "macaca_fascicularis",
  "macaca_fuscata",
  "macaca_mulatta",
  "macaca_nigra",
  "macaca_radiata",
  "macaca_silenus",
  "mandrillus_sphinx",
  "miopithecus_talapoin",
  "nasalis_larvatus",
  "papio_anubis",
  "papio_hamadryas",
  "papio_papio",
  "pygathrix_nemaeus",
  "semnopithecus_entellus",
  "theropithecus_gelada",
  "trachypithecus_auratus",
  "trachypithecus_cristatus",
  "trachypithecus_delacouri",
  "trachypithecus_francoisi",
  "trachypithecus_germaini",
  "trachypithecus_obscurus",
  "trachypithecus_vetulus",

  # Suidae
  "babyrousa_babyrussa",
  "babyrousa_celebensis",
  "phacochoerus_aethiopicus",
  "phacochoerus_africanus",
  "potamochoerus_porcus",
  "sus_cebifrons",
  "sus_scrofa",

  # Ambiguous invasiveness
  "suncus_murinus"
)

stopifnot(
  length(ambiguous_placentation_species) == 47,
  !anyDuplicated(ambiguous_placentation_species)
)


# -----------------------------------------------------------------------------
# CREATE THE SINGLE PRUNED DATASET USED BY ALL MODELS
# -----------------------------------------------------------------------------

species_not_found_in_original_data <- setdiff(
  ambiguous_placentation_species,
  common_species_new_data1$species
)

if (length(species_not_found_in_original_data) > 0) {
  warning(
    paste0(
      "These exclusion-list species were not found in ",
      "common_species_new_data1: ",
      paste(species_not_found_in_original_data, collapse = ", ")
    )
  )
}

removed_ambiguous_species <-
  common_species_new_data1[
    common_species_new_data1$species %in%
      ambiguous_placentation_species,
    ,
    drop = FALSE
  ]

common_species_new_data1_no_ambiguous <-
  as.data.frame(
    common_species_new_data1[
      !common_species_new_data1$species %in%
        ambiguous_placentation_species,
      ,
      drop = FALSE
    ]
  )

print(sort(unique(removed_ambiguous_species$species)))

cat(
  "\nNumber of excluded species found in the dataset:",
  length(unique(removed_ambiguous_species$species)),
  "\n"
)

cat(
  "Rows in original dataset:",
  nrow(common_species_new_data1),
  "\n"
)

cat(
  "Rows in pruned dataset:",
  nrow(common_species_new_data1_no_ambiguous),
  "\n"
)

stopifnot(
  length(
    intersect(
      common_species_new_data1_no_ambiguous$species,
      ambiguous_placentation_species
    )
  ) == 0
)


# -----------------------------------------------------------------------------
# HELPER FUNCTION:
# VALIDATE AND CREATE A FACTOR
# -----------------------------------------------------------------------------

make_valid_factor <- function(
    x,
    allowed_levels,
    variable_name
) {

  observed_values <- unique(
    as.character(
      x[!is.na(x)]
    )
  )

  unexpected_values <- setdiff(
    observed_values,
    allowed_levels
  )

  if (length(unexpected_values) > 0) {
    stop(
      paste0(
        "Unexpected values in ",
        variable_name,
        ": ",
        paste(unexpected_values, collapse = ", ")
      )
    )
  }

  factor(
    as.character(x),
    levels = allowed_levels
  )
}


# -----------------------------------------------------------------------------
# HELPER FUNCTION:
# REMOVE INCOMPLETE/NON-FINITE ROWS AND ALIGN DATA WITH TREE
# -----------------------------------------------------------------------------

prepare_model_data <- function(
    data,
    tree,
    required_variables,
    species_column = "species"
) {

  model_data <- as.data.frame(data)

  missing_variables <- setdiff(
    required_variables,
    names(model_data)
  )

  if (length(missing_variables) > 0) {
    stop(
      paste0(
        "Missing variables: ",
        paste(missing_variables, collapse = ", ")
      )
    )
  }

  if (!species_column %in% required_variables) {
    stop(
      paste0(
        species_column,
        " must be included in required_variables."
      )
    )
  }

# -----------------------------------------------------------------------------
  # Remove rows containing NA values
# -----------------------------------------------------------------------------

  model_data <- model_data[
    stats::complete.cases(
      model_data[, required_variables, drop = FALSE]
    ),
    ,
    drop = FALSE
  ]

# -----------------------------------------------------------------------------
  # Remove Inf, -Inf, and NaN from numeric variables
# -----------------------------------------------------------------------------

  numeric_variables <- required_variables[
    vapply(
      model_data[, required_variables, drop = FALSE],
      is.numeric,
      logical(1)
    )
  ]

  if (length(numeric_variables) > 0) {

    finite_rows <- apply(
      model_data[, numeric_variables, drop = FALSE],
      MARGIN = 1,
      FUN = function(x) {
        all(is.finite(x))
      }
    )

    model_data <- model_data[
      finite_rows,
      ,
      drop = FALSE
    ]
  }

  if (nrow(model_data) == 0) {
    stop("No observations remain after complete-case filtering.")
  }

# -----------------------------------------------------------------------------
  # Detect duplicate species before match() can remove them
# -----------------------------------------------------------------------------

  duplicated_species <- unique(
    model_data[[species_column]][
      duplicated(model_data[[species_column]]) |
        duplicated(
          model_data[[species_column]],
          fromLast = TRUE
        )
    ]
  )

  if (length(duplicated_species) > 0) {
    stop(
      paste0(
        "Duplicate species in model dataset: ",
        paste(duplicated_species, collapse = ", ")
      )
    )
  }

# -----------------------------------------------------------------------------
  # Identify any data species absent from the master tree
# -----------------------------------------------------------------------------

  species_missing_from_tree <- setdiff(
    model_data[[species_column]],
    tree$tip.label
  )

  if (length(species_missing_from_tree) > 0) {
    warning(
      paste0(
        "The following model-data species are absent from the tree ",
        "and will be removed: ",
        paste(species_missing_from_tree, collapse = ", ")
      )
    )
  }

# -----------------------------------------------------------------------------
  # Keep only species shared by data and tree
# -----------------------------------------------------------------------------

  shared_species <- intersect(
    model_data[[species_column]],
    tree$tip.label
  )

  if (length(shared_species) == 0) {
    stop("No species are shared between the model data and tree.")
  }

  model_data <- model_data[
    model_data[[species_column]] %in% shared_species,
    ,
    drop = FALSE
  ]

# -----------------------------------------------------------------------------
  # Prune the tree to the exact model species
# -----------------------------------------------------------------------------

  model_tree <- ape::keep.tip(
    tree,
    shared_species
  )

# -----------------------------------------------------------------------------
  # Put data in exact tree-tip order
# -----------------------------------------------------------------------------

  model_data <- model_data[
    match(
      model_tree$tip.label,
      model_data[[species_column]]
    ),
    ,
    drop = FALSE
  ]

  rownames(model_data) <- model_data[[species_column]]

# -----------------------------------------------------------------------------
  # Final alignment checks
# -----------------------------------------------------------------------------

  if (anyNA(rownames(model_data))) {
    stop("Missing species names remain after data-tree alignment.")
  }

  if (anyDuplicated(rownames(model_data))) {
    stop("Duplicate species names remain after data-tree alignment.")
  }

  if (!identical(
    rownames(model_data),
    model_tree$tip.label
  )) {
    stop("The model data and tree are not aligned.")
  }

  if (nrow(model_data) != ape::Ntip(model_tree)) {
    stop(
      paste0(
        "Model-data rows and tree-tip count differ: ",
        nrow(model_data),
        " data rows versus ",
        ape::Ntip(model_tree),
        " tree tips."
      )
    )
  }

  list(
    data = model_data,
    tree = model_tree
  )
}


# -----------------------------------------------------------------------------
# HELPER FUNCTION:
# ALIGN A NAMED SE VECTOR WITH MODEL DATA
# -----------------------------------------------------------------------------

prepare_se_vector <- function(
    se_vector,
    model_data
) {

  if (is.null(names(se_vector))) {
    stop("The SE vector must be named by species.")
  }

  if (anyDuplicated(names(se_vector))) {

    duplicated_se_species <- unique(
      names(se_vector)[
        duplicated(names(se_vector)) |
          duplicated(
            names(se_vector),
            fromLast = TRUE
          )
      ]
    )

    stop(
      paste0(
        "Duplicate species names in SE vector: ",
        paste(duplicated_se_species, collapse = ", ")
      )
    )
  }

  missing_species <- setdiff(
    rownames(model_data),
    names(se_vector)
  )

  if (length(missing_species) > 0) {
    stop(
      paste0(
        "SE values are missing for: ",
        paste(missing_species, collapse = ", ")
      )
    )
  }

  aligned_se <- se_vector[
    rownames(model_data)
  ]

  if (!identical(
    names(aligned_se),
    rownames(model_data)
  )) {
    stop("The SE vector and model data are not aligned.")
  }

  if (anyNA(aligned_se)) {
    stop("The aligned SE vector contains missing values.")
  }

  if (any(!is.finite(aligned_se))) {
    stop("The aligned SE vector contains non-finite values.")
  }

  if (any(aligned_se < 0)) {
    stop("The aligned SE vector contains negative values.")
  }

  aligned_se
}


# -----------------------------------------------------------------------------
# HELPER FUNCTION:
# VERIFY MODEL DATA, TREE, SE, AND EXCLUSION LIST
# -----------------------------------------------------------------------------

verify_model_inputs <- function(
    model_data,
    model_tree,
    se_vector,
    model_name
) {

  if (!identical(
    rownames(model_data),
    model_tree$tip.label
  )) {
    stop(
      paste0(
        model_name,
        ": model data and tree are not aligned."
      )
    )
  }

  if (!identical(
    names(se_vector),
    rownames(model_data)
  )) {
    stop(
      paste0(
        model_name,
        ": SE vector and model data are not aligned."
      )
    )
  }

  excluded_species_in_data <- intersect(
    rownames(model_data),
    ambiguous_placentation_species
  )

  if (length(excluded_species_in_data) > 0) {
    stop(
      paste0(
        model_name,
        ": excluded species remain in the model data: ",
        paste(excluded_species_in_data, collapse = ", ")
      )
    )
  }

  excluded_species_in_tree <- intersect(
    model_tree$tip.label,
    ambiguous_placentation_species
  )

  if (length(excluded_species_in_tree) > 0) {
    stop(
      paste0(
        model_name,
        ": excluded species remain in the model tree: ",
        paste(excluded_species_in_tree, collapse = ", ")
      )
    )
  }

  if (!all(
    rownames(model_data) %in%
      common_species_new_data1_no_ambiguous$species
  )) {
    stop(
      paste0(
        model_name,
        ": model data contain species not found in the ",
        "new pruned dataset."
      )
    )
  }

  invisible(TRUE)
}


# -----------------------------------------------------------------------------
# FACTOR LEVELS
# -----------------------------------------------------------------------------

interdigitation_levels <- c(
  "Villous",
  "Trabecular",
  "Labyrinthine"
)

invasiveness_levels <- c(
  "Epitheliochorial",
  "Endotheliochorial",
  "Hemochorial"
)
