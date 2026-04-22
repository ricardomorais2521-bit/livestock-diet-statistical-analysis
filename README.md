# ---- Statistical Consulting: Experimental Diet Analysis ----

# --- Project Overview ---
This repository contains a complete statistical consulting project developed to evaluate the impact of an experimental diet (enriched with vitamin additives, niacin, and antibiotics) on the Average Daily Weight Gain (ADG) of Charolais calves. 

The primary objective was to determine, through rigorous statistical inference, if the experimental diet yielded a statistically significant increase in weight gain compared to the baseline median.

# --- Technical Stack & Methods ---
* **Language:** R
* **Libraries:** `moments` (for skewness and kurtosis evaluation).
* **Exploratory Data Analysis (EDA):** Boxplots, Histograms, Coefficient of Variation (CV), and Skewness analysis.
* **Normality Testing:** Shapiro-Wilk Test and Q-Q Plots.
* **Hypothesis Testing:** * Non-parametric: **Sign Test** (applied to the full sample due to severe negative skewness caused by outliers).
  * Parametric: **One-Sample Student's t-test** (applied after outlier management validated the normality assumption).

# --- Key Findings & Strategy ---
The analysis was divided into two distinct statistical environments to prevent data distortion:
1. **Full Sample Analysis (n=42):** The presence of outliers caused a rejection of normality. A non-parametric approach (Sign Test) concluded no statistical evidence of increased ADG.
2. **Outlier Management (n=40):** Removing extreme values restored data symmetry and normality. The subsequent Student's t-test confirmed the initial findings: the experimental diet did not provide a statistically significant weight increase.

*Strategic Recommendation:* The final consulting report advised the client to implement a strict control group (fed a standard diet) in future studies to properly isolate the experimental variables and validate the financial investment in the diet.

# --- Repository Structure ---
* `1ºProjeto-Consultoria.R`: The complete, reproducible R script containing all raw data arrays, EDA, visualization generation, and hypothesis testing algorithms.
* `1ºProject_Consultoria_EN.pdf`: The final executive consulting report translated to English.
* `1ºProjeto_ConsultoriaPT.pdf`: The original consulting report in Portuguese.
