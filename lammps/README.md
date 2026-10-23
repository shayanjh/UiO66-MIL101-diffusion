# LAMMPS input scripts

The input scripts follow the simulation protocol of Section 2 of the article. The force field and the simulation logic are given in full. Everything that depends on the particular system is collected at the top of each script in a USER INPUTS block, as variables whose values are placeholders such as `{datafile}` or `{N_targets}`. Each placeholder must be replaced, either in the script or on the command line, for example

```
lmp -var datafile UiO66_relaxed.data -var out_prefix UiO66_CO2 -var Tf 298.15 \
    -var Nt 32 64 160 -var Pd 0.5 1.0 1.0 -var seed 1486221 -var n_exchange 50 -in in.gcmc_UiO66_CO2
```

The molecule files `CO2.txt`, `N2.txt`, and `H2O.txt` are in `structures/` and must be copied to the folder in which LAMMPS is run.

## Contents

| File | Purpose |
|---|---|
| `framework/in.relax_framework` | minimization and NPT relaxation of an empty framework |
| `gcmc/in.gcmc_UiO66_CO2`, `_N2`, `_H2O` | staged MD-GCMC loading of UiO-66 |
| `gcmc/in.gcmc_MIL101_CO2`, `_N2`, `_H2O` | staged MD-GCMC loading of MIL-101(Cr) |
| `gcmc/in.gcmc_UiO66_H2O_CO2` | coadsorption of CO₂ in UiO-66 preloaded with water |
| `msd_uff/in.msd_UiO66_CO2`, `_N2`, `_H2O` | MSD of single gases in UiO-66 (UFF) |
| `msd_uff/in.msd_MIL101_CO2`, `_N2`, `_H2O` | MSD of single gases in MIL-101(Cr) (UFF) |
| `msd_uff/in.msd_UiO66_H2O_CO2` | MSD of both species in the CO₂/H₂O mixture in UiO-66 |
| `mace/in.msd_mace` | MSD of N₂ or CO₂ in UiO-66 with a MACE potential (any cell size) |
| `mace/in.nve_mace` | energy-conservation test of a MACE potential |

## Staged MD-GCMC loading

* Framework NVT and rigid guests NVT, with GCMC insertions and deletions of whole molecules (`fix gcmc ... rigid`), the reservoir pressure given with `fugacity_coeff 1`.
* `Nt` holds the target numbers of molecules and `Pd` the reservoir pressure (atm) of each stage. The pressure is raised from stage to stage; a stage ends when the number of molecules reaches its target, GCMC is switched off, the system is relaxed by MD for `settle` steps, and the snapshot `<out_prefix>_N<target>.data` is written. A stage that does not reach its target within `stage_max` steps is skipped.
* The largest per-atom potential energy is printed with every snapshot; values orders of magnitude larger than typical indicate an overlap, and the snapshot should be discarded.
* The pressures act as insertion drivers: they set how fast a target is reached, not which configuration is written. For water, an equilibrium state at relative humidity RH corresponds to a reservoir pressure RH × P_sat(T).
* Loadings in mmol/g follow from N × 1000 / (framework mass in g/mol): 53,249.6 g/mol for the UiO-66 cell and 46,466.5 g/mol for the MIL-101(Cr) cell.
* The zero-loading points of the article (one guest molecule in the cell) are obtained with a single target, `Nt 1`, at a low reservoir pressure.

## Mean-squared displacements (UFF)

* Each iteration starts from the same loaded snapshot with new random velocities, relaxes the system for 20,000 steps (framework NVT, rigid guests NVT), and runs the production for 2 × 10⁶ steps of 0.5 fs (1 ns) with the rigid guests in NVE and the framework in NVT (or NVE, `frame_ensemble`).
* The MSD is written every 100 steps, one block per iteration, with the columns iteration, step, MSD_x, MSD_y, MSD_z, and MSD_total (Å²).
* For the triclinic MIL-101(Cr) cell, the image flags of the data file must be kept, since they keep molecules that span the periodic boundary whole.

## MACE simulations

* `in.msd_mace`: energy minimization, NVT thermalization at 300 K for 5,000 steps, and NVE production of the whole system for 10⁶ steps of 1 fs (1 ns). `replicate_cell` builds larger cells (2 × 2 × 2 for the finite-size test of the article).
* `in.nve_mace`: Langevin equilibration followed by an NVE run; the drift of the total energy per atom measures energy conservation.
* `pair_coeff * * <model> <elements>` maps the atom types of the data file to elements: `C H N O Zr` for `structures/UiO66_2N2_primitive.data`, and `Zr O O O H H C C C` for `structures/UiO66_2CO2_primitive.data`. The guest atoms are selected with `guest_select`: `"type 3"` for the N₂ file, and `"variable isguest"` for the CO₂ file, whose guest atoms share their types with the framework (they are the last 6 atoms of each 120-atom cell).
