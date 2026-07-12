# Occupational Noise Exposure Study: Nnewi, Anambra State

## Overview
This repository contains the analysis code, datasets, and visualizations for a study investigating **noise exposure and associated health problems** among 350 industrial workers in Nnewi, Anambra State, Nigeria.

---

## Key Findings

### Noise Exposure
| Parameter | Value |
|:---|:---:|
| Mean Noise Level | **91.9 dBA** |
| Range | 76.7 – 106.0 dBA |
| Workers >90 dBA | **66.2%** |

### Health Problems
| Health Problem | Prevalence |
|:---|:---:|
| Headaches | **62.3%** |
| Chronic Fatigue | **58.6%** |
| Poor Concentration | **58.6%** |
| Irritability | **57.4%** |
| Hearing Difficulty | **56.3%** |
| Tinnitus | **49.1%** |
| Hypertension | **19.7%** |

### Dose-Response Relationships
| Health Outcome | Odds Ratio (Very High vs Low) |
|:---|:---:|
| Chronic Fatigue | **4.38** |
| Irritability | **3.62** |
| Headaches | **3.35** |
| Hearing Difficulty | **3.18** |
| Hypertension | **3.00** |

### PPE Effectiveness
| Health Outcome | Risk Reduction (Always vs Never) |
|:---|:---:|
| Chronic Fatigue | **85%** |
| Headaches | **84%** |
| Tinnitus | **81%** |
| Hearing Difficulty | **65%** |

---

## Figures

### Figure 1: Primary Sources of Noise
![Figure 1](figures/figure_1_noise_sources_bar.png)
*Heavy machinery was the most prevalent source, affecting 70.0% of workers.*

### Figure 2: Prevalence of Health Problems
![Figure 2](figures/figure_2_donut_health.png)
*Headaches were the most prevalent condition (62.3%), followed by fatigue and poor concentration (58.6%).*

### Figure 3: Dose-Response Relationship
![Figure 3](figures/figure_3_dose_response_line.png)
*A clear dose-response relationship exists between noise intensity and health outcomes.*

### Figure 4: PPE Effectiveness
![Figure 4](figures/figure_4_ppe_effectiveness_bar.png)
*Consistent PPE use reduces hearing difficulty by 65% and tinnitus by 81%.*

---

## Repository Structure
Nnewi-Noise-Exposure-Study/
│
├── code/ # R scripts for analysis
├── figures/ # All visualizations (PNG)
├── data/ # Generated dataset (CSV)
├── outputs/ # Results summary
└── paper/ # Abstract and summary

---

## Software Requirements

```r
# Required R packages
install.packages(c(
  "dplyr",      # Data manipulation
  "tidyr",      # Data reshaping
  "ggplot2",    # Visualization
  "gtsummary",  # Statistical tables
  "knitr",      # Report generation
  "kableExtra"  # Table styling
))

How to Run the Analysis

# Clone the repository
git clone https://github.com/yourusername/Nnewi-Noise-Exposure-Study.git

# Open RStudio and set working directory
# Run scripts in order:
source("code/01_data_generation.R")
source("code/02_data_cleaning.R")
source("code/03_analysis_all.R")
source("code/04_visualizations.R")

Research Objectives
Determine levels and sources of noise exposure

Assess prevalence of auditory and non-auditory health problems

Examine relationship between exposure and health outcomes

Evaluate use and effectiveness of protective measures

Hypotheses
H₀₁: No significant relationship between noise exposure levels and health problems

H₀₂: Duration and intensity do not significantly influence health problems

H₀₃: Noise control measures and PPE have no significant effect on health outcomes
---
