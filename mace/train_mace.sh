#!/bin/bash
# =====================================================================
# Training of a MACE potential for UiO-66 with a guest gas (N2 or CO2)
#
# mace_run_train is installed with the mace-torch package (it is the same
# program as scripts/run_train.py of the MACE repository). Run on a GPU.
# The settings below are those used for the potentials in models/.
# =====================================================================

NAME={name}             # model name, e.g., MACE_UiO66_N2
TRAIN_FILE={train_file} # e.g., datasets/N2_train.extxyz or datasets/CO2_train.extxyz
TEST_FILE={test_file}   # e.g., datasets/N2_test.extxyz
SEED={seed}             # random seed (also sets the validation split)

mace_run_train \
  --name="${NAME}" \
  --train_file="${TRAIN_FILE}" \
  --test_file="${TEST_FILE}" \
  --valid_fraction=0.02 \
  --energy_key="energy" \
  --forces_key="forces" \
  --model="MACE" \
  --E0s="average" \
  --r_max=5.0 \
  --num_channels=128 \
  --num_interactions=2 \
  --max_L=1 \
  --correlation=2 \
  --forces_weight=100 \
  --energy_weight=10 \
  --batch_size=10 \
  --max_num_epochs=1000 \
  --patience=200 \
  --ema \
  --ema_decay=0.99 \
  --amsgrad \
  --swa \
  --default_dtype="float64" \
  --device=cuda \
  --seed=${SEED}

# Export the stage-two (SWA) model for LAMMPS:
#   python -m mace.cli.create_lammps_model ${NAME}_stagetwo.model
