## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(knitr)
library(mhcnuggetsr)
library(testthat)

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))
  readLines(peptides_path, warn = FALSE)
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc = mhc_1_haplotype
  )
  df <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  kable(df)
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc = mhc_1_haplotype,
    ba_models = TRUE
  )
  df <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  kable(df)
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_2_haplotype <- "HLA-DRB101:01"
  expect_true(mhc_2_haplotype %in% get_trained_mhc_2_haplotypes())
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc = mhc_2_haplotype
  )
  df <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  kable(df)
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_1_haplotype <- "HLA-A02:60"
  expect_false(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = mhc_1_haplotype
  )
  df <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  kable(df)
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  basename(get_example_filenames())
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  cat(get_trained_mhc_1_haplotypes())
}

## -----------------------------------------------------------------------------
if (is_mhcnuggets_installed()) {
  cat(get_trained_mhc_2_haplotypes())
}

## -----------------------------------------------------------------------------
mhcnuggetsr_report()

