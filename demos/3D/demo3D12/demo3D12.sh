# demo3D12
#
# Train 3D generative model of the nucleus, cell shape, and lysosome using
# 30 LAMP2 images in the Murphy Lab 3D HeLa dataset.
#
# Input
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * a directory of raw or synthetic lysosome images
# * the resolution of the images (all images should have the same
#   resolution)
#
# Output
# ------
# * a valid SLML model file
#
# Ivan E. Cao-Berg
#
# Copyright (C) 2012-2017 Murphy Lab
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
#
# July 27, 2012 I. Cao-Berg Modified demo so that it looks for framework.mat in the current directory as well as in the demo3D11 folder
#
# July 30, 2012 I. Cao-Berg Fixed a bug in the method that would not set theocation of the framework file is the number of input
#                           arguments was not zero
#               I. Cao-Berg Fixed model parameter that describes pattern name
#               I. Cao-Berg Fixed cytonuclearflag so that it is set to be nuclear when the nucleoli pattern is selected
#
# July 31, 2012 I. Cao-Berg Fixed model.proteinModel.class that was set to lysosome for all patterns
#
# Jan 20, 2012 I. Cao-Berg Updated method so that if decompressed folder is
#                          found, it skips decompression of the tarballs
#
# May 15, 2013 I. Cao-Berg Updated method to support wildcards
#
# March 17, 2014 I. Cao-Berg Updated method so that 3D nuclear models types
#                             is labelled 'cylindrical_surface'
#
# April 24, 2014 I. Cao-Berg Fixed bug where it trying to load the
# framework from the models folder instead of the demo3D11 folder
#
# February 3, 2016 I. Cao-Berg Fixed small bug that would not allow the
# demo to download the image collection if the compressed file was present
# somewhere else in the working path
#
# March 9, 2016 I. Cao-Berg Fixed problem where resolution was not set and
# thus method would fail

DIRECTORY=../demo3D11/images/HeLa/3D/processed
if [ ! -d "$DIRECTORY" ]; then
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.8.0/docker/images/demo3D11.tgz
	mkdir -p ../demo3D11/images/HeLa/3D/processed
	tar -xvf demo3D11.tgz -C ../demo3D11/images/HeLa/3D/processed/
	rm -f demo3D11.tgz
fi

echo -e "
pattern = 'LAMP2';
dimensionality = '3D';
options.model.name = 'all';
options.model.id = num2str(now);
options.nucleus.type = 'cylindrical_surface';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.id = num2str(now);
options.cell.type = 'ratio';
options.cell.id = num2str(now);
options.cell.class = 'cell_membrane';
options.protein.type = 'gmm';
options.protein.class = 'vesicle';
options.protein.id = num2str(now);
if strcmpi( options.protein.class, 'vesicle' )	options.protein.cytonuclearflag = 'nuc';	else	options.protein.cytonuclearflag = 'cyto'; end

options.verbose = true;
options.debug = false;

options.documentation.description='This model has been trained using demo3D12 from CellOrganizer';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FEEL FREE TO MODIFY THE VARIABLES IN THIS BLOCK
directory = '../demo3D11/images/HeLa/3D/processed';
for i = 1:10; dnaImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch0_t1.tif']; cellImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch1_t1.tif']; proteinImagesDirectoryPath{i} = [directory filesep 'LAM_cell' num2str(i) '_ch2_t1.tif']; options.masks{i} = [directory filesep 'LAM_cell' num2str(i) '_mask_t1.tif']; end;
options = ml_initparam( options, struct( 'train', struct( 'flag', 'all' )));
options.model.resolution=[0.049, 0.049, 0.2000];
options.model.filename = 'LAMP2.xml';

" > input.txt




img2slml input.txt
