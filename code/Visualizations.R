# ============================================================================
# ALL VISUALIZATIONS FOR THE STUDY
# ============================================================================

library(ggplot2)
library(dplyr)
library(tidyr)

noise_data <- readRDS("data/noise_data_clean.rds")

# FIGURE 1: Primary Sources of Noise
sources <- c("HeavyMachinery", "Hammering", "MetalCutting", "Generators",
             "Compressors", "Forklift", "Conveyor")

source_labels <- c("Heavy Machinery", "Hammering/Impact", "Metal Cutting",
                   "Generators", "Compressors", "Forklift/Vehicles", "Conveyor Systems")

source_data <- noise_data %>%
  summarise(across(all_of(sources), ~ round(mean(.x)*100, 1))) %>%
  pivot_longer(everything(), names_to = "Source", values_to = "Percentage") %>%
  mutate(Source_Label = source_labels[match(Source, sources)])

fig1 <- ggplot(source_data, aes(x = reorder(Source_Label, -Percentage),
                                y = Percentage, fill = Source_Label)) +
  geom_bar(stat = "identity", width = 0.7) +
  geom_text(aes(label = paste0(Percentage, "%")), vjust = -0.5, size = 5) +
  labs(title = "Primary Sources of Noise Exposure (N = 350)",
       x = "Noise Source", y = "Workers Exposed (%)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none") +
  scale_fill_brewer(palette = "Set3") +
  ylim(0, 85)

ggsave("figures/figure_1_noise_sources_bar.png", fig1, width = 10, height = 6)

# FIGURE 2: Donut Chart
health_vars <- c("HearingDifficulty", "Tinnitus", "Headache", "Fatigue", "Hypertension")
health_labels <- c("Hearing Difficulty", "Tinnitus", "Headaches", "Chronic Fatigue", "Hypertension")

health_data <- noise_data %>%
  summarise(across(all_of(health_vars), ~ round(mean(.x)*100, 1))) %>%
  pivot_longer(everything(), names_to = "Health_Problem", values_to = "Prevalence") %>%
  mutate(Health_Label = health_labels[match(Health_Problem, health_vars)]) %>%
  arrange(desc(Prevalence))

fig2 <- ggplot(health_data, aes(x = 2, y = Prevalence, fill = reorder(Health_Label, -Prevalence))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y", start = 0) +
  xlim(0.5, 2.5) +
  geom_text(aes(label = paste0(Prevalence, "%")),
            position = position_stack(vjust = 0.5), size = 4, fontface = "bold") +
  labs(title = "Prevalence of Health Problems (N = 350)", fill = "Health Problem") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        legend.position = "right") +
  scale_fill_brewer(palette = "Set3")

ggsave("figures/figure_2_donut_health.png", fig2, width = 10, height = 8)

# FIGURE 3: Dose-Response Line Chart
dose_data <- noise_data %>%
  group_by(NoiseCategory) %>%
  summarise(
    Hearing_Difficulty = round(mean(HearingDifficulty)*100, 1),
    Tinnitus = round(mean(Tinnitus)*100, 1),
    Headache = round(mean(Headache)*100, 1),
    Fatigue = round(mean(Fatigue)*100, 1)
  ) %>%
  pivot_longer(-NoiseCategory, names_to = "Health_Problem", values_to = "Prevalence") %>%
  mutate(Health_Problem = case_when(
    Health_Problem == "Hearing_Difficulty" ~ "Hearing Difficulty",
    Health_Problem == "Tinnitus" ~ "Tinnitus",
    Health_Problem == "Headache" ~ "Headaches",
    Health_Problem == "Fatigue" ~ "Chronic Fatigue"
  ))

fig3 <- ggplot(dose_data, aes(x = NoiseCategory, y = Prevalence,
                              color = Health_Problem, group = Health_Problem)) +
  geom_line(size = 1.2) + geom_point(size = 3) +
  labs(title = "Dose-Response Relationship",
       x = "Noise Category", y = "Prevalence (%)", color = "Health Problem") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        legend.position = "bottom") +
  scale_color_brewer(palette = "Set1") + ylim(0, 85)

ggsave("figures/figure_3_dose_response_line.png", fig3, width = 10, height = 6)

# FIGURE 4: PPE Effectiveness
ppe_data <- noise_data %>%
  group_by(PPE) %>%
  summarise(
    Hearing_Difficulty = round(mean(HearingDifficulty)*100, 1),
    Tinnitus = round(mean(Tinnitus)*100, 1),
    Headache = round(mean(Headache)*100, 1),
    Fatigue = round(mean(Fatigue)*100, 1)
  ) %>%
  pivot_longer(-c(PPE), names_to = "Health_Problem", values_to = "Prevalence") %>%
  mutate(Health_Problem = case_when(
    Health_Problem == "Hearing_Difficulty" ~ "Hearing Difficulty",
    Health_Problem == "Tinnitus" ~ "Tinnitus",
    Health_Problem == "Headache" ~ "Headaches",
    Health_Problem == "Fatigue" ~ "Chronic Fatigue"
  )) %>%
  mutate(PPE = factor(PPE, levels = c("Always", "Often", "Sometimes", "Rarely", "Never")))

fig4 <- ggplot(ppe_data, aes(x = PPE, y = Prevalence, fill = Health_Problem)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9), width = 0.8) +
  geom_text(aes(label = paste0(Prevalence, "%")),
            position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  labs(title = "Prevalence of Health Problems by PPE Usage Category",
       x = "PPE Use Frequency", y = "Prevalence (%)", fill = "Health Problem") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        legend.position = "bottom") +
  scale_fill_brewer(palette = "Set2") + ylim(0, 100)

ggsave("figures/figure_4_ppe_effectiveness_bar.png", fig4, width = 10, height = 6)