#!/bin/bash

# demo3D59
#
#Synthesize one 3D image with nuclear, cell shape and a vesicular channel.
#This demo exports portions of the synthetic image as an SBML Spatial instance.

# Input 
# ------
# * a valid CellOrganizer model file
#
# Output
# ------
# * SBML Instance
# * single channel tif files
# * ometiff file
#
# Created: Robert F. Murphy
#
# Copyright (C) 2013-2019 Murphy Lab
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

wget -nc http://www.cellorganizer.org/model_repository/models/3D/tfr.mat
wget -nc http://www.cellorganizer.org/model_repository/models/3D/spharm/lamp2.mat
 
echo -e "options.output_filename = 'combined_model.mat';
options.selection = [1,1,0;0,0,1];
files = {'lamp2.mat','tfr.mat'};
" > input_combine.txt
slml2slml input_combine.txt

echo -e "options.seed = 639848;
try; state = rng( options.seed ); catch err; rand( 'seed', options.seed ); end;
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
options.sampling.method = 'disc';
options.debug = false;
options.verbose = true;
options.synthesis = 'all';
options.model.spharm_rpdm.synthesis_method = 'random_sampling';
options.model.spharm_rpdm.imageSize = [205, 205, 18];
options.numberOfSynthesizedImages = 1;
options.numberOfGaussianObjects = 100;
options.rendAtStd = 1;
options.overlapthresh = 1;
options.output.tifimages = true;
options.output.OMETIFF = true;
options.output.indexedimage = true;
options.output.SBMLSpatial = true;
options.SBML.spatial_use_compression = true;
options.SBML.spatial_use_analytic_meshes = true;
options.SBML.spatial_image = false;
options.SBML.spatial_vcell_compatible = false;
options.oobbuffer = 0.1;

filenames = {'combined_model.mat'};
" > input.txt

slml2img input.txt

rm input_combine.txt
rm input.txt
