# ============================================================================
# DATA CLEANING AND PREPARATION
# ============================================================================

library(dplyr)

noise_data <- read.csv("data/noise_data_350.csv")

# Check for missing values
colSums(is.na(noise_data))

# Create derived variables
noise_data <- noise_data %>%
  mutate(
    Hypertension = ifelse(SBP >= 140 | DBP >= 90, 1, 0),
    PPE_Group = case_when(
      PPE %in% c("Always", "Often") ~ "Protected",
      PPE == "Sometimes" ~ "Inconsistent",
      TRUE ~ "Unprotected"
    )
  )

# Save cleaned data
saveRDS(noise_data, "data/noise_data_clean.rds")
write.csv(noise_data, "data/noise_data_clean.csv", row.names = FALSE)