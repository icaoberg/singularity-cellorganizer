#!/bin/bash

# demo3D01
#
# Synthesize one 3D image with nuclear, cell shape, and vesicular channels
# from all vesicular object models (lysosomes, mitochondria, nucleoli, and
# endosomes) with sampling method set to render vesicular objects as
# ellipsoids without convolution. The model was trained from the Murphy Lab
# 3D HeLa dataset.
#
# Input 
# ------
# * a list of valid CellOrganizer model files
#
# Output
# ------
# * six TIFF files (nuclear, cell shape, lysosomal, mitochondrial,
#   nucleolar, and endosomal channels)
#
# Created: Robert F. Murphy
#
# Copyright (C) 2013-2018 Murphy Lab
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

wget -nc http://www.cellorganizer.org/model_repository/models/3D/nuc.mat
wget -nc http://www.cellorganizer.org/model_repository/models/3D/lamp2.mat
wget -nc http://www.cellorganizer.org/model_repository/models/3D/mit.mat
wget -nc http://www.cellorganizer.org/model_repository/models/3D/tfr.mat

echo -e "options.seed = 12345;
try; state = rng( options.seed ); catch err; rand( 'seed', options.seed ); end;
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
options.sampling.method = 'disc';
options.debug = false;
options.verbose = true;
options.display = false;
options.numberOfGaussianObjects = 25;
filenames = {'./nuc.mat','./lamp2.mat','./tfr.mat', './mit.mat'};
" > input.txt

slml2img input.txt
