# Structure files

| File | Content |
|---|---|
| `data.UiO-66.ddec` | UiO-66 cell (3,648 atoms, 2 × 2 × 2 conventional cells) with UFF parameters and DDEC charges; types 1 C_R, 2 H_, 3 O_R, 4 O_3_z, 5 Zr |
| `data.MIL-101.ddec` | MIL-101(Cr) rhombohedral primitive cell (3,604 atoms) with UFF4MOF parameters and DDEC charges; types 1 Cr4+2, 2 O_2, 3 C_R, 4 H_, 5 Cr6f3, 6 F_, 7 O_2_z (activated, fluoride-capped framework) |
| `UiO66_2N2_primitive.data` | UiO-66 primitive cell (114 atoms) with two N₂ molecules, for the MACE N₂ potential; types 1 C, 2 H, 3 N, 4 O, 5 Zr |
| `UiO66_2CO2_primitive.data` | UiO-66 primitive cell (114 atoms) with two CO₂ molecules (atoms 115 to 120), for the MACE CO₂ potential; types 1 Zr, 2 to 4 O, 5 and 6 H, 7 to 9 C |
| `CO2.txt` | molecule file for CO₂ (TraPPE, rigid, three sites) |
| `N2.txt` | molecule file for N₂ (rigid, two sites with the TraPPE Lennard-Jones parameters, no partial charges) |
| `H2O.txt` | molecule file for H₂O (SPC/E, rigid) |

The guest parameters (TraPPE CO₂: ε/k_B = 27.0 and 79.0 K, σ = 2.80 and 3.05 Å, q = +0.70e and −0.35e, C-O 1.16 Å; N₂: ε/k_B = 36.0 K, σ = 3.31 Å (TraPPE), no partial charges, N-N 1.095 Å; SPC/E H₂O: ε/k_B = 78.2 K, σ = 3.166 Å, q = −0.8476e and +0.4238e, O-H 1.0 Å, H-O-H 109.47°) are set in the LAMMPS scripts.
