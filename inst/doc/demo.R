## ----include = FALSE----------------------------------------------------------
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

## ----pick_mhc_1_haplotype-----------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
}

## ----pick_mhc_2_haplotype-----------------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_2_haplotype <- "HLA-DRB101:01"
  expect_true(mhc_2_haplotype %in% get_trained_mhc_2_haplotypes())
}

## ----pick_mhc_1_haplotype_supertype-------------------------------------------
if (is_mhcnuggets_installed()) {
  mhc_1_haplotype <- "HLA-A02:60"
  expect_false(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
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

