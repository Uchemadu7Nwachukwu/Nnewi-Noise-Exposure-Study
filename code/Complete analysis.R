# ============================================================================
# COMPLETE ANALYSIS: OBJECTIVES 1-4
# ============================================================================

library(dplyr)
library(tidyr)

noise_data <- readRDS("data/noise_data_clean.rds")

cat("\n========== OBJECTIVE 1 ==========\n")

# Table 1.1: Noise levels
cat("\nTable 1.1: Overall Noise Levels\n")
noise_data %>%
  summarise(
    N = n(),
    Mean_dBA = round(mean(NoiseLevel), 1),
    SD_dBA = round(sd(NoiseLevel), 1),
    Min_dBA = min(NoiseLevel),
    Max_dBA = max(NoiseLevel)
  ) %>% print()

# Table 1.2: Noise categories
cat("\nTable 1.2: Noise Category Distribution\n")
noise_data %>%
  group_by(NoiseCategory) %>%
  summarise(N = n(), Pct = round(n()/nrow(noise_data)*100, 1)) %>%
  print()

# Table 1.3: Noise sources
cat("\nTable 1.3: Primary Sources of Noise\n")
sources <- c("HeavyMachinery", "Hammering", "MetalCutting", "Generators",
             "Compressors", "Forklift", "Conveyor")

noise_data %>%
  summarise(across(all_of(sources), ~ round(mean(.x)*100, 1))) %>%
  pivot_longer(everything(), names_to = "Source", values_to = "Percentage") %>%
  arrange(desc(Percentage)) %>%
  print()

cat("\n========== OBJECTIVE 2 ==========\n")

cat("\nTable 2.1: Prevalence of Health Problems\n")
health_vars <- c("HearingDifficulty", "Tinnitus", "Hypertension",
                 "Headache", "Fatigue")

noise_data %>%
  summarise(across(all_of(health_vars), ~ round(mean(.x)*100, 1))) %>%
  pivot_longer(everything(), names_to = "Health_Problem", values_to = "Prevalence") %>%
  print()

cat("\n========== OBJECTIVE 3 ==========\n")

cat("\nTable 3.1: Health Outcomes by Noise Category\n")
noise_data %>%
  group_by(NoiseCategory) %>%
  summarise(
    N = n(),
    Hearing_Difficulty = round(mean(HearingDifficulty)*100, 1),
    Tinnitus = round(mean(Tinnitus)*100, 1),
    Hypertension = round(mean(Hypertension)*100, 1),
    Headache = round(mean(Headache)*100, 1),
    Fatigue = round(mean(Fatigue)*100, 1)
  ) %>%
  print()

cat("\n========== OBJECTIVE 4 ==========\n")

cat("\nTable 4.1: PPE Usage Distribution\n")
noise_data %>%
  group_by(PPE) %>%
  summarise(N = n(), Pct = round(n()/nrow(noise_data)*100, 1)) %>%
  arrange(desc(PPE)) %>%
  print()

cat("\nTable 4.2: Health Outcomes by PPE Usage\n")
noise_data %>%
  group_by(PPE) %>%
  summarise(
    N = n(),
    Hearing_Difficulty = round(mean(HearingDifficulty)*100, 1),
    Tinnitus = round(mean(Tinnitus)*100, 1),
    Headache = round(mean(Headache)*100, 1),
    Fatigue = round(mean(Fatigue)*100, 1)
  ) %>%
  print()