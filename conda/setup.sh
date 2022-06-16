#!/bin/bash

brew bundle --file Brewfile

conda init
conda activate base
conda env update --file conda-base.yaml

cd "../ipython" && ./setup.sh
