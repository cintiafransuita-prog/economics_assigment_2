# Installs the R packages the notebook needs and registers the R kernel for Jupyter.
# Run from the repo root with: uv run Rscript scripts/setup_r.R

packages <- c(
  "IRkernel",   # R kernel for Jupyter
  "tidyverse",  # data wrangling and plots
  "estimatr",   # regressions with standard errors clustered by plant
  "broom",      # tidy model output
  "kableExtra"  # tables with grouped column headers
)

missing <- setdiff(packages, rownames(installed.packages()))
if (length(missing) > 0) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}

still_missing <- setdiff(packages, rownames(installed.packages()))
if (length(still_missing) > 0) {
  stop("Could not install: ", paste(still_missing, collapse = ", "))
}

# Registers the kernel as "ir" for the current user, the name the notebook expects.
IRkernel::installspec()
