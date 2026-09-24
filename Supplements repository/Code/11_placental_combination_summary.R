# =============================================================================
# Placental combinations and represented taxonomic orders
# =============================================================================

library(dplyr)
library(tidyr)

output_dir1 <- if (exists("output_folder1")) output_folder1 else "results"
dir.create(output_dir1, recursive = TRUE, showWarnings = FALSE)

invasiveness_levels1 <- c("Epitheliochorial", "Endotheliochorial", "Hemochorial")
interdigitation_levels1 <- c("Villous", "Trabecular", "Labyrinthine")

placenta_data1 <- gestation_length1 |>
  filter(!is.na(species), !is.na(invasiveness), !is.na(interdigitation)) |>
  mutate(
    invasiveness = factor(invasiveness, levels = invasiveness_levels1),
    interdigitation = factor(interdigitation, levels = interdigitation_levels1),
    taxonomic_order = case_when(
      taxonomic_order == "Cetacea" ~ "Artiodactyla",
      taxonomic_order == "Erinaceomorpha" ~ "Eulipotyphla",
      taxonomic_order == "Therapsida" ~ "Artiodactyla",
      TRUE ~ taxonomic_order
    )
  )

order_counts1 <- placenta_data1 |>
  filter(!is.na(taxonomic_order)) |>
  distinct(species, invasiveness, interdigitation, taxonomic_order) |>
  count(invasiveness, interdigitation, taxonomic_order, name = "order_n")

order_summary1 <- order_counts1 |>
  arrange(invasiveness, interdigitation, desc(order_n), taxonomic_order) |>
  group_by(invasiveness, interdigitation) |>
  summarise(
    `Orders Most Represented` = {
      repeated1 <- paste0(taxonomic_order[order_n > 1], " (", order_n[order_n > 1], ")")
      single1 <- taxonomic_order[order_n == 1]
      if (length(single1)) repeated1 <- c(repeated1, paste0("others (1 each: ", paste(single1, collapse = ", "), ")"))
      paste(repeated1, collapse = ", ")
    },
    .groups = "drop"
  )

combination_counts1 <- placenta_data1 |>
  distinct(species, invasiveness, interdigitation) |>
  count(invasiveness, interdigitation, name = "n species")

placental_combination_table1 <- expand_grid(
  invasiveness = factor(invasiveness_levels1, levels = invasiveness_levels1),
  interdigitation = factor(interdigitation_levels1, levels = interdigitation_levels1)
) |>
  left_join(combination_counts1, by = c("invasiveness", "interdigitation")) |>
  mutate(
    `n species` = replace_na(`n species`, 0L),
    Rarity = case_when(
      `n species` == 0 ~ "Absent",
      `n species` <= 2 ~ "Very rare",
      `n species` <= 10 ~ "Rare",
      `n species` <= 30 ~ "Uncommon",
      `n species` <= 75 ~ "Moderately common",
      TRUE ~ "Common"
    )
  ) |>
  left_join(order_summary1, by = c("invasiveness", "interdigitation")) |>
  mutate(`Orders Most Represented` = if_else(`n species` == 0, NA_character_, `Orders Most Represented`)) |>
  arrange(invasiveness, interdigitation)

write.csv(
  placental_combination_table1,
  file.path(output_dir1, "taxonomic_order_placenta_table.csv"),
  row.names = FALSE,
  na = "NA"
)
