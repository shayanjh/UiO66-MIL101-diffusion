# MACE potentials

Two MACE potentials were trained, one for UiO-66 with N₂ and one for UiO-66 with CO₂, on reference data of the UiO-66 primitive cell (114 atoms) with 1 to 7 guest molecules, computed with VASP at the PBE-D3(BJ) level. The datasets provided here are those with two guest molecules per cell, used for the tests reported in the article.

## Contents

| Folder or file | Content |
|---|---|
| `vasp/INCAR_aimd_loaded` | ab initio MD (NVT, Langevin, 300 K, 1 fs) of the primitive cell with guest molecules |
| `vasp/INCAR_single_point` | single points of short-range guest-framework contact configurations (N₂ data) |
| `vasp/INCAR_aimd_isolated_gas` | ab initio MD of an isolated guest molecule (N₂ data) |
| `vasp/KPOINTS` | Γ point |
| `vasp/POTCAR_labels.txt` | PAW potentials used (POTCAR files cannot be redistributed) |
| `notebooks/prepare_dataset.ipynb` | conversion of `vasprun.xml` files into extended XYZ training and test sets |
| `train_mace.sh` | training command and settings |
| `datasets/N2/` | `msd_N02_train.extxyz` (730 configurations: 514 framework + 2 N₂, 36 contact configurations, 180 isolated N₂) and `msd_N02_test.extxyz` (81 configurations) |
| `datasets/CO2/` | `msd_N02.extxyz` (1,963 configurations of the framework + 2 CO₂; 2 percent used for validation) and `vasprun_CO2_unseen.extxyz` (22 configurations from an independent ab initio MD trajectory, not used in training) |
| `models/N2/`, `models/CO2/` | trained potentials (stage two): `*.model` for ASE and `*.model-lammps.pt` for LAMMPS |
| `notebooks/validation_N2.ipynb`, `validation_CO2.ipynb` | accuracy against DFT, phonon dispersion, equation of state and bulk modulus, and analysis of the NVE runs |

The notebooks expect the model and dataset files in their working folder; copy them there or edit the file names in the setup cells. The outputs of the notebooks have been cleared.

## Settings

Cutoff 5.0 Å, 128 channels, 2 interactions, max_L = 1, correlation order 2, energy and force weights 10 and 100, batch size 10, up to 1,000 epochs with early stopping (patience 200), exponential moving average (decay 0.99), AMSGrad, stochastic weight averaging, float64. The validation results reported in the article are summarized in `data/computed/mace_validation_CO2.csv` and in Section 3 of the article.
