#!/bin/bash

#  demo3D11
# 
#  Train 3D generative model of the cell framework (nucleus and cell shape)
#  using the Murphy Lab 3D HeLa TfR dataset.
# 
#  Input
#  -----
#  * a directory of raw or synthetic nucleus images
#  * a directory of raw or synthetic cell shape images
#  * the resolution of the images (all images should have the same
#    resolution)
# 
#  Output
#  ------
#  * a valid model
#
#  Ivan E. Cao-Berg
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

DIRECTORY=./images/HeLa/3D/processed
if [ ! -d "$DIRECTORY" ]; then
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.8.0/docker/images/demo3D11.tgz
	mkdir -p ./images/HeLa/3D/processed
	tar -xvf demo3D11.tgz -C ./images/HeLa/3D/processed/
	rm -f demo3D11.tgz
fi



echo -e "\
options.sampling.method = 'disc';
options.debug = true;
options.verbose = true;
options.display = false;
options.temporary_results = [ pwd filesep 'temporary_results' ];
options.downsampling = [5,5,1];
options = ml_initparam(options, struct('train', struct( 'flag', 'framework' )));
options.model.filename = '3D_HeLa_framework.xml';
options.model.name = '3d_hela_framework_model';
options.model.id = num2str(now);
options.nucleus.type = 'cylindrical_surface';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.name = 'all';
options.nucleus.id = num2str(now);
options.cell.type = 'ratio';
options.cell.class = 'cell_membrane';
options.cell.model = 'framework';
options.cell.id = num2str(now);
options.model.resolution = [0.049, 0.049, 0.2000];
directory = 'images/HeLa/3D/processed';
dimensionality = '3D';
for i = 1:15; dnaImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch0_t1.tif']; cellImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch1_t1.tif']; proteinImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch2_t1.tif']; options.masks{i} = [directory filesep 'LAM_cell' num2str(i) '_mask_t1.tif']; end;
options.documentation.author = 'Murphy Lab';
options.documentation.email = 'murphy@cmu.edu';
options.documentation.website = 'murphy@cmu.edu';
options.documentation.description = 'This is the framework model is the result from demo3D11.';
options.documentation.date = date;\
" > input.txt

img2slml input.txt
