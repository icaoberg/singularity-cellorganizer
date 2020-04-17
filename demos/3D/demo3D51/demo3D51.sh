# demo3D51
#
# Train 3D generative SPHARM-RPDM cell shape model using the Murphy Lab 3D HeLa dataset.
#
# Input
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * the resolution of the images (all images should have the same
#   resolution)
#
# Output
# ------
# * a valid SLML model file
#
# Xiongtao Ruan (xruan@andrew.cmu.edu)
#
# Copyright (C) 2018 Murphy Lab
# Computational Biology Department
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

echo -e "
options.verbose = true;
options.debug = ~false;
options.display = false;
options.model.name = 'demo3D51';
options = ml_initparam( options, struct('train', struct( 'flag', 'cell' )));
options.cell.class = 'cell_membrane';
options.cell.type = 'spharm_rpdm';
options.rpdm_options.postprocess = ~false;
options.rpdm_options.maxDeg = 31;
options.rpdm_options.components = {'cell'};
options.latent_dim = 15;
directory = '../demo3D11/images/HeLa/3D/processed/';
dnaImagesDirectoryPath = [ directory filesep 'LAM_cell[1-9]_ch0_t1.tif' ];
cellImagesDirectoryPath = [ directory filesep 'LAM_cell[1-9]_ch1_t1.tif' ];
proteinImagesDirectoryPath = []
options.masks = [ directory filesep 'LAM_cell[1-9]_mask_t1.tif' ];
options.model.resolution = [0.049, 0.049, 0.2000];
options.downsampling = [5, 5, 1];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.model.name = 'lamp2';
options.nucleus.name = 'LAMP2';
options.cell.model = 'LAMP2';
dimensionality = '3D';
options.documentation.description = 'This model has been trained using demo3D51 from CellOrganizer';
options.segminnucfraction = 0.1;
" > input.txt

img2slml input.txt
