import math

# -----------------------------
# Given data
# -----------------------------
population_mean = 75       # μ : Claimed population mean
sample_mean = 72           # x̄ : Sample mean
sample_std = 6             # s : Sample standard deviation
sample_size = 10           # n : Sample size
alpha = 0.05               # Significance level (5%)

# -----------------------------
# Hypothesis Test Setup
# H0: μ = 75
# H1: μ ≠ 75  (Two-tailed test)
# -----------------------------

z_critical = 1.96           # Critical Z-value for α = 0.05 (two-tailed)

# Standard Error of the Mean
standard_error = sample_std / math.sqrt(sample_size)

# Critical region bounds
lower_bound = population_mean - z_critical * standard_error
upper_bound = population_mean + z_critical * standard_error

# -----------------------------
# Results
# -----------------------------
print("Z-Test Using Critical Value Method")
print("----------------------------------")
print(f"Lower Critical Value : {lower_bound:.2f}")
print(f"Upper Critical Value : {upper_bound:.2f}")

# Decision rule
if lower_bound <= sample_mean <= upper_bound:
    print("\nDecision: Fail to Reject H₀")
    print("Conclusion: The sample data supports the institute's claim.")
else:
    print("\nDecision: Reject H₀")
    print("Conclusion: The sample data does not support the institute's claim.")
