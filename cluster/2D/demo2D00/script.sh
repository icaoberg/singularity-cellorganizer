#!/bin/bash
#
#$ -j y
#$ -S /bin/bash
#$ -cwd

## the next line selects the partition/queue
#SBATCH -p dev

## the next line selects the number of CPUs
#SBATCH -n 1

## the next line selects the memory size
#SBATCH --mem=8G

## the next line selects the walltime
#SBATCH -t 24:00:00

# demo2D00
#
# Synthesize one 2D image with nuclear, cell shape, and vesicular channels
# from all vesicular object models (nucleoli, lysosomes, endosomes, and
# mitochondria) without convolution. The model was trained from the Murphy
# Lab 2D HeLa dataset.
#
# Input
# ------
# * List of valid CellOrganizer model files
#
# Output
# ------
# * one TIFF file with six slices (nuclear, cell shape, nucleolar, lysosomal, 
# endosomal, and mitochondrial channels)
#
# Copyright (C) 2012-2020 Murphy Lab
# Lane Center for Computational Biology
# School of Computer Science
# Carnegie Mellon University
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
# 
# For additional information visit http://murphylab.web.cmu.edu or
# send email to murphy@cmu.edu

module load singularity/cellorganizer-v2.8.1

wget -nc http://www.cellorganizer.org/model_repository/models/2D/endosome.mat
wget -nc http://www.cellorganizer.org/model_repository/models/2D/lysosome.mat
wget -nc http://www.cellorganizer.org/model_repository/models/2D/mitochondrion.mat
wget -nc http://www.cellorganizer.org/model_repository/models/2D/nucleolus.mat

echo -e "filenames={'./nucleolus.mat', './lysosome.mat', './endosome.mat', './mitochondrion.mat' };
options.targetDirectory = pwd;
options.prefix = 'images';
options.compression = 'lzw';
options.output.OMETIFF = true;
options.debug = false;
options.verbose = true;
options.display = false;
options.numberOfSynthesizedImages = 5;
" > input.txt

slml2img input.txt
