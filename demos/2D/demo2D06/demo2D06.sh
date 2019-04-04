#!/bin/bash

# demo2D06
#
# Reconstruct one 2D image with nuclear, cell shape for PCA model
# Input
# -----
# * a valid CellOrganizer model file
#
# Output
# ------
# * one TIFF file with three slices (nuclear, cell shape, and lysosomal
#   channels)


# Author: Xiongtao Ruan (xruan@andrew.cmu.edu)
#
# Copyright (C) 2018 Murphy Lab
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

filename = '../demo2D05/lamp2.mat'
if [ ! -d $filename ]; then
    echo 'RUN demo2D05 first!'
		return
fi

echo -e "\
filenames = {'../demo2D05/lamp2.mat'};
options.numberOfSynthesizedImages = 1;
options.model.pca.pca_synthesis_method = 'reconstruction';
options.model.pca.imageSize = [1024, 1024];
options.output.OMETIFF = true;
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
" > input.txt

slml2img $(pwd)/input.txt
