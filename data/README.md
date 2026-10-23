# Data

Self-diffusivities are in m²/s (or in units of 10⁻⁹ m²/s where stated in the column name), loadings in mmol/g, and errors are one standard deviation from bootstrap resampling of the independent iterations.

## computed/

| File | Content |
|---|---|
| `self_diffusivities.csv` | self-diffusivities of CO₂, N₂, and H₂O in UiO-66 (UFF and MACE) and MIL-101(Cr) (UFF) at every loading (Figs. 13 to 20 of the article) |
| `mace_vs_uff_table1.csv` | MACE and UFF self-diffusivities at the same loadings and their deviation (Table 1) |
| `finite_size_test_N2.csv` | self-diffusivity of N₂ at 1.2 mmol/g in the MACE primitive cell and 2 × 2 × 2 supercell, and with the UFF |
| `timestep_test_CO2_UiO66_UFF.csv` | self-diffusivity of CO₂ in UiO-66 (UFF) with time steps of 0.5 and 1 fs |
| `coadsorption_CO2_H2O_UiO66_UFF.csv` | self-diffusivities of CO₂ and H₂O in their mixture in UiO-66 and in the pure components |
| `mace_validation_CO2.csv` | accuracy, phonon, equation-of-state, and NVE results of the MACE CO₂ potential |

Main column names: `loading_mmol_g` loading; `D_m2_s`, `D_std_m2_s` self-diffusivity and its standard deviation; `figure` figure of the article; `note` comments.
