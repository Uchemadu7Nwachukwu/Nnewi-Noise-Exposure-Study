# 🔊 Occupational Noise Exposure and Health Outcomes Among Industrial Workers in Nnewi, Nigeria

![R](https://img.shields.io/badge/R-4.4+-276DC3?logo=r)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-success)
![Healthcare Analytics](https://img.shields.io/badge/Domain-Healthcare%20Analytics-blue)
![Public Health](https://img.shields.io/badge/Public%20Health-Epidemiology-orange)

---

## 📖 Overview

This repository contains the datasets, R scripts, statistical analyses, and visualizations for a cross-sectional study investigating **occupational noise exposure and associated health outcomes among industrial workers in Nnewi, Anambra State, Nigeria**.

The study involved **350 industrial workers** and examined:

- Occupational noise exposure levels
- Sources of workplace noise
- Auditory health effects
- Non-auditory health effects
- Dose-response relationships
- Effectiveness of personal protective equipment (PPE)

---

# 📊 Key Findings

## Noise Exposure

| Parameter | Result |
|-----------|--------:|
| Mean Noise Level | **91.9 dBA** |
| Noise Range | **76.7–106.0 dBA** |
| Workers Exposed Above 90 dBA | **66.2%** |

---

## Prevalence of Health Problems

| Health Outcome | Prevalence |
|---------------|-----------:|
| Headaches | **62.3%** |
| Chronic Fatigue | **58.6%** |
| Poor Concentration | **58.6%** |
| Irritability | **57.4%** |
| Hearing Difficulty | **56.3%** |
| Tinnitus | **49.1%** |
| Hypertension | **19.7%** |

---

## Dose–Response Relationship

Workers exposed to **very high noise levels** experienced significantly greater health risks compared with workers exposed to lower noise levels.

| Health Outcome | Odds Ratio |
|---------------|-----------:|
| Chronic Fatigue | **4.38** |
| Irritability | **3.62** |
| Headaches | **3.35** |
| Hearing Difficulty | **3.18** |
| Hypertension | **3.00** |

---

## PPE Effectiveness

Consistent use of hearing protection substantially reduced the likelihood of adverse health outcomes.

| Health Outcome | Risk Reduction |
|---------------|---------------:|
| Chronic Fatigue | **85%** |
| Headaches | **84%** |
| Tinnitus | **81%** |
| Hearing Difficulty | **65%** |

---

# 📈 Visualizations

The repository includes publication-quality figures.

### Figure 1 – Primary Sources of Occupational Noise

Heavy machinery was identified as the predominant source of workplace noise, affecting **70%** of participants.

---

### Figure 2 – Prevalence of Health Problems

Headaches were the most frequently reported health complaint (**62.3%**), followed by chronic fatigue and poor concentration (**58.6%** each).

---

### Figure 3 – Dose–Response Relationship

Demonstrates the increasing probability of adverse health outcomes with increasing occupational noise exposure.

---

### Figure 4 – Effectiveness of Hearing Protection

Illustrates the protective effect of consistent PPE use, reducing:

- Hearing difficulty by **65%**
- Tinnitus by **81%**

---

# 📂 Repository Structure

```
Nnewi-Noise-Exposure-Study/

│
├── code/
│   ├── 01_data_generation.R
│   ├── 02_data_cleaning.R
│   ├── 03_analysis_all.R
│   └── 04_visualizations.R
│
├── data/
│   └── Generated datasets (.csv)
│
├── figures/
│   └── Publication-quality figures (.png)
│
├── outputs/
│   └── Statistical summaries
│
├── paper/
│   └── Abstract and manuscript
│
└── README.md
```

---

# 💻 Software Requirements

### R (Version 4.4 or later)

Install the required packages:

```r
install.packages(c(
  "dplyr",
  "tidyr",
  "ggplot2",
  "gtsummary",
  "knitr",
  "kableExtra"
))
```

---

# ▶️ Running the Analysis

Clone the repository

```bash
git clone https://github.com/yourusername/Nnewi-Noise-Exposure-Study.git
```

Open the project in **RStudio** and run the scripts sequentially:

```r
source("code/01_data_generation.R")

source("code/02_data_cleaning.R")

source("code/03_analysis_all.R")

source("code/04_visualizations.R")
```

---

# 🎯 Research Objectives

The study aimed to:

- Quantify occupational noise exposure levels.
- Identify major sources of workplace noise.
- Determine the prevalence of auditory and non-auditory health outcomes.
- Evaluate the relationship between occupational noise exposure and health outcomes.
- Assess the effectiveness of hearing protection and other preventive measures.

---

# 🔬 Research Hypotheses

### H₀₁

There is **no significant association** between occupational noise exposure levels and health outcomes among industrial workers.

### H₀₂

Duration and intensity of occupational noise exposure **do not significantly influence** workers' health outcomes.

### H₀₃

Noise control measures and personal protective equipment **have no significant effect** on reducing adverse health outcomes.

---

# 📊 Statistical Methods

- Descriptive Statistics
- Chi-square Tests
- Binary Logistic Regression
- Odds Ratios with 95% Confidence Intervals
- Multivariable Regression Analysis
- Data Visualization using **ggplot2**

---

# 🌍 Study Location

**Nnewi, Anambra State, Nigeria**

Nnewi is one of Nigeria's largest industrial clusters, comprising manufacturing industries, automotive businesses, metal works, plastics, cable production, pharmaceuticals, and allied industrial enterprises.

---

# 👨‍💻 Author

**Uchemadu Nwachukwu**

- MSc Applied Clinical Data Analytics
- MSc Health Planning & Management
- Healthcare Data Analyst
- Clinical Researcher
- Public Health Professional

---

# 📜 Citation

If you use this repository, please cite:

> Nwachukwu, U. (2026). *Occupational Noise Exposure and Health Outcomes Among Industrial Workers in Nnewi, Nigeria*. GitHub Repository.

---

# 📄 License

This project is released under the **MIT License**.
