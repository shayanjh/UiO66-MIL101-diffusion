# Analysis

| File | Content |
|---|---|
| `msd_diffusion_analysis.ipynb` | reads the MSD files of all frameworks, gases, and loadings, discards incomplete iterations, averages the MSD over the iterations, and computes the self-diffusivity from the Einstein relation (fit over the last 50 percent of the trajectory unless stated otherwise), with the error from bootstrap resampling of the iterations; it also plots D versus loading |
| `MOF_characterization.ipynb` | XRD pattern, radial distribution functions and coordination numbers, geometric surface area and void fractions, FTIR spectrum, and pore-size distribution of UiO-66 (UFF and MACE) and MIL-101(Cr) |

The MSD notebook expects the folder layout described in its first cell (`<framework>/<gas>/<loading>mmol/msd*.txt`). The outputs of the notebooks have been cleared. The experimental reference patterns and spectra used for comparison in the characterization notebook are not included; they are cited in the article.
