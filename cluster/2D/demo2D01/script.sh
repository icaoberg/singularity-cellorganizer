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

# demo2D01
#
# Train 2D generative model of the nucleus, cell shape, and lysosome using
# all LAMP2 images in the Murphy Lab 2D HeLa dataset.
#
# Input
# -----
# * a directory of raw or synthetic nucleus images
# * a directory of raw or synthetic cell shape images
# * a directory of raw or synthetic lysosome images
# * the resolution of the images (all images should have the same resolution)
#
# Output
# ------
# * a valid SLML model file
#
# Author: Ivan E. Cao-Berg (icaoberg@scs.cmu.edu)
#
# Copyright (C) 2013-2020 Murphy Lab
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

echo "Downloading the image dataset from www.cellorganizer.org"
DIRECTORY=./images/HeLa/2D/LAM
if [ ! -d "$DIRECTORY" ]; then
	wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.8.0/docker/images/demo2D01.tgz
	mkdir -p ./images/HeLa/2D/LAM
	tar -xf demo2D01.tgz -C ./images/HeLa/2D/LAM/
	rm -f demo2D01.tgz
	find . -type f -name "._cell*" -exec rm -f {} \;
fi

echo -e "\
options.verbose = true;
options.debug = false;
options.display = false;
options.model.name = 'demo2D01';
options.train.flag = 'all';
options.nucleus.class = 'nuclear_membrane';
options.nucleus.type = 'medial_axis';
options.cell.class = 'cell_membrane';
options.cell.type = 'ratio';
options.protein.class = 'vesicle';
options.protein.type = 'gmm';
dimensionality = '2D';

dnaImagesDirectoryPath{1}='./images/HeLa/2D/LAM/orgdna/cell10.tif'
cellImagesDirectoryPath{1}='./images/HeLa/2D/LAM/orgcell/cell10.tif'
proteinImagesDirectoryPath{1}='./images/HeLa/2D/LAM/orgprot/cell10.tif'
options.masks{1}='./images/HeLa/2D/LAM/crop/cell10.tif'
dnaImagesDirectoryPath{2}='./images/HeLa/2D/LAM/orgdna/cell11.tif'
cellImagesDirectoryPath{2}='./images/HeLa/2D/LAM/orgcell/cell11.tif'
proteinImagesDirectoryPath{2}='./images/HeLa/2D/LAM/orgprot/cell11.tif'
options.masks{2}='./images/HeLa/2D/LAM/crop/cell11.tif'
dnaImagesDirectoryPath{3}='./images/HeLa/2D/LAM/orgdna/cell12.tif'
cellImagesDirectoryPath{3}='./images/HeLa/2D/LAM/orgcell/cell12.tif'
proteinImagesDirectoryPath{3}='./images/HeLa/2D/LAM/orgprot/cell12.tif'
options.masks{3}='./images/HeLa/2D/LAM/crop/cell12.tif'
dnaImagesDirectoryPath{4}='./images/HeLa/2D/LAM/orgdna/cell13.tif'
cellImagesDirectoryPath{4}='./images/HeLa/2D/LAM/orgcell/cell13.tif'
proteinImagesDirectoryPath{4}='./images/HeLa/2D/LAM/orgprot/cell13.tif'
options.masks{4}='./images/HeLa/2D/LAM/crop/cell13.tif'
dnaImagesDirectoryPath{5}='./images/HeLa/2D/LAM/orgdna/cell14.tif'
cellImagesDirectoryPath{5}='./images/HeLa/2D/LAM/orgcell/cell14.tif'
proteinImagesDirectoryPath{5}='./images/HeLa/2D/LAM/orgprot/cell14.tif'
options.masks{5}='./images/HeLa/2D/LAM/crop/cell14.tif'
dnaImagesDirectoryPath{6}='./images/HeLa/2D/LAM/orgdna/cell15.tif'
cellImagesDirectoryPath{6}='./images/HeLa/2D/LAM/orgcell/cell15.tif'
proteinImagesDirectoryPath{6}='./images/HeLa/2D/LAM/orgprot/cell15.tif'
options.masks{6}='./images/HeLa/2D/LAM/crop/cell15.tif'
dnaImagesDirectoryPath{7}='./images/HeLa/2D/LAM/orgdna/cell16.tif'
cellImagesDirectoryPath{7}='./images/HeLa/2D/LAM/orgcell/cell16.tif'
proteinImagesDirectoryPath{7}='./images/HeLa/2D/LAM/orgprot/cell16.tif'
options.masks{7}='./images/HeLa/2D/LAM/crop/cell16.tif'
dnaImagesDirectoryPath{8}='./images/HeLa/2D/LAM/orgdna/cell17.tif'
cellImagesDirectoryPath{8}='./images/HeLa/2D/LAM/orgcell/cell17.tif'
proteinImagesDirectoryPath{8}='./images/HeLa/2D/LAM/orgprot/cell17.tif'
options.masks{8}='./images/HeLa/2D/LAM/crop/cell17.tif'
dnaImagesDirectoryPath{9}='./images/HeLa/2D/LAM/orgdna/cell18.tif'
cellImagesDirectoryPath{9}='./images/HeLa/2D/LAM/orgcell/cell18.tif'
proteinImagesDirectoryPath{9}='./images/HeLa/2D/LAM/orgprot/cell18.tif'
options.masks{9}='./images/HeLa/2D/LAM/crop/cell18.tif'
dnaImagesDirectoryPath{10}='./images/HeLa/2D/LAM/orgdna/cell19.tif'
cellImagesDirectoryPath{10}='./images/HeLa/2D/LAM/orgcell/cell19.tif'
proteinImagesDirectoryPath{10}='./images/HeLa/2D/LAM/orgprot/cell19.tif'
options.masks{10}='./images/HeLa/2D/LAM/crop/cell19.tif'
dnaImagesDirectoryPath{11}='./images/HeLa/2D/LAM/orgdna/cell1.tif'
cellImagesDirectoryPath{11}='./images/HeLa/2D/LAM/orgcell/cell1.tif'
proteinImagesDirectoryPath{11}='./images/HeLa/2D/LAM/orgprot/cell1.tif'
options.masks{11}='./images/HeLa/2D/LAM/crop/cell1.tif'
dnaImagesDirectoryPath{12}='./images/HeLa/2D/LAM/orgdna/cell20.tif'
cellImagesDirectoryPath{12}='./images/HeLa/2D/LAM/orgcell/cell20.tif'
proteinImagesDirectoryPath{12}='./images/HeLa/2D/LAM/orgprot/cell20.tif'
options.masks{12}='./images/HeLa/2D/LAM/crop/cell20.tif'
dnaImagesDirectoryPath{13}='./images/HeLa/2D/LAM/orgdna/cell21.tif'
cellImagesDirectoryPath{13}='./images/HeLa/2D/LAM/orgcell/cell21.tif'
proteinImagesDirectoryPath{13}='./images/HeLa/2D/LAM/orgprot/cell21.tif'
options.masks{13}='./images/HeLa/2D/LAM/crop/cell21.tif'
dnaImagesDirectoryPath{14}='./images/HeLa/2D/LAM/orgdna/cell22.tif'
cellImagesDirectoryPath{14}='./images/HeLa/2D/LAM/orgcell/cell22.tif'
proteinImagesDirectoryPath{14}='./images/HeLa/2D/LAM/orgprot/cell22.tif'
options.masks{14}='./images/HeLa/2D/LAM/crop/cell22.tif'
dnaImagesDirectoryPath{15}='./images/HeLa/2D/LAM/orgdna/cell23.tif'
cellImagesDirectoryPath{15}='./images/HeLa/2D/LAM/orgcell/cell23.tif'
proteinImagesDirectoryPath{15}='./images/HeLa/2D/LAM/orgprot/cell23.tif'
options.masks{15}='./images/HeLa/2D/LAM/crop/cell23.tif'
dnaImagesDirectoryPath{16}='./images/HeLa/2D/LAM/orgdna/cell24.tif'
cellImagesDirectoryPath{16}='./images/HeLa/2D/LAM/orgcell/cell24.tif'
proteinImagesDirectoryPath{16}='./images/HeLa/2D/LAM/orgprot/cell24.tif'
options.masks{16}='./images/HeLa/2D/LAM/crop/cell24.tif'
dnaImagesDirectoryPath{17}='./images/HeLa/2D/LAM/orgdna/cell25.tif'
cellImagesDirectoryPath{17}='./images/HeLa/2D/LAM/orgcell/cell25.tif'
proteinImagesDirectoryPath{17}='./images/HeLa/2D/LAM/orgprot/cell25.tif'
options.masks{17}='./images/HeLa/2D/LAM/crop/cell25.tif'
dnaImagesDirectoryPath{18}='./images/HeLa/2D/LAM/orgdna/cell26.tif'
cellImagesDirectoryPath{18}='./images/HeLa/2D/LAM/orgcell/cell26.tif'
proteinImagesDirectoryPath{18}='./images/HeLa/2D/LAM/orgprot/cell26.tif'
options.masks{18}='./images/HeLa/2D/LAM/crop/cell26.tif'
dnaImagesDirectoryPath{19}='./images/HeLa/2D/LAM/orgdna/cell27.tif'
cellImagesDirectoryPath{19}='./images/HeLa/2D/LAM/orgcell/cell27.tif'
proteinImagesDirectoryPath{19}='./images/HeLa/2D/LAM/orgprot/cell27.tif'
options.masks{19}='./images/HeLa/2D/LAM/crop/cell27.tif'
dnaImagesDirectoryPath{20}='./images/HeLa/2D/LAM/orgdna/cell28.tif'
cellImagesDirectoryPath{20}='./images/HeLa/2D/LAM/orgcell/cell28.tif'
proteinImagesDirectoryPath{20}='./images/HeLa/2D/LAM/orgprot/cell28.tif'
options.masks{20}='./images/HeLa/2D/LAM/crop/cell28.tif'
dnaImagesDirectoryPath{21}='./images/HeLa/2D/LAM/orgdna/cell29.tif'
cellImagesDirectoryPath{21}='./images/HeLa/2D/LAM/orgcell/cell29.tif'
proteinImagesDirectoryPath{21}='./images/HeLa/2D/LAM/orgprot/cell29.tif'
options.masks{21}='./images/HeLa/2D/LAM/crop/cell29.tif'
dnaImagesDirectoryPath{22}='./images/HeLa/2D/LAM/orgdna/cell2.tif'
cellImagesDirectoryPath{22}='./images/HeLa/2D/LAM/orgcell/cell2.tif'
proteinImagesDirectoryPath{22}='./images/HeLa/2D/LAM/orgprot/cell2.tif'
options.masks{22}='./images/HeLa/2D/LAM/crop/cell2.tif'
dnaImagesDirectoryPath{23}='./images/HeLa/2D/LAM/orgdna/cell30.tif'
cellImagesDirectoryPath{23}='./images/HeLa/2D/LAM/orgcell/cell30.tif'
proteinImagesDirectoryPath{23}='./images/HeLa/2D/LAM/orgprot/cell30.tif'
options.masks{23}='./images/HeLa/2D/LAM/crop/cell30.tif'
dnaImagesDirectoryPath{24}='./images/HeLa/2D/LAM/orgdna/cell31.tif'
cellImagesDirectoryPath{24}='./images/HeLa/2D/LAM/orgcell/cell31.tif'
proteinImagesDirectoryPath{24}='./images/HeLa/2D/LAM/orgprot/cell31.tif'
options.masks{24}='./images/HeLa/2D/LAM/crop/cell31.tif'
dnaImagesDirectoryPath{25}='./images/HeLa/2D/LAM/orgdna/cell32.tif'
cellImagesDirectoryPath{25}='./images/HeLa/2D/LAM/orgcell/cell32.tif'
proteinImagesDirectoryPath{25}='./images/HeLa/2D/LAM/orgprot/cell32.tif'
options.masks{25}='./images/HeLa/2D/LAM/crop/cell32.tif'
dnaImagesDirectoryPath{26}='./images/HeLa/2D/LAM/orgdna/cell33.tif'
cellImagesDirectoryPath{26}='./images/HeLa/2D/LAM/orgcell/cell33.tif'
proteinImagesDirectoryPath{26}='./images/HeLa/2D/LAM/orgprot/cell33.tif'
options.masks{26}='./images/HeLa/2D/LAM/crop/cell33.tif'
dnaImagesDirectoryPath{27}='./images/HeLa/2D/LAM/orgdna/cell34.tif'
cellImagesDirectoryPath{27}='./images/HeLa/2D/LAM/orgcell/cell34.tif'
proteinImagesDirectoryPath{27}='./images/HeLa/2D/LAM/orgprot/cell34.tif'
options.masks{27}='./images/HeLa/2D/LAM/crop/cell34.tif'
dnaImagesDirectoryPath{28}='./images/HeLa/2D/LAM/orgdna/cell35.tif'
cellImagesDirectoryPath{28}='./images/HeLa/2D/LAM/orgcell/cell35.tif'
proteinImagesDirectoryPath{28}='./images/HeLa/2D/LAM/orgprot/cell35.tif'
options.masks{28}='./images/HeLa/2D/LAM/crop/cell35.tif'
dnaImagesDirectoryPath{29}='./images/HeLa/2D/LAM/orgdna/cell36.tif'
cellImagesDirectoryPath{29}='./images/HeLa/2D/LAM/orgcell/cell36.tif'
proteinImagesDirectoryPath{29}='./images/HeLa/2D/LAM/orgprot/cell36.tif'
options.masks{29}='./images/HeLa/2D/LAM/crop/cell36.tif'
dnaImagesDirectoryPath{30}='./images/HeLa/2D/LAM/orgdna/cell37.tif'
cellImagesDirectoryPath{30}='./images/HeLa/2D/LAM/orgcell/cell37.tif'
proteinImagesDirectoryPath{30}='./images/HeLa/2D/LAM/orgprot/cell37.tif'
options.masks{30}='./images/HeLa/2D/LAM/crop/cell37.tif'
dnaImagesDirectoryPath{31}='./images/HeLa/2D/LAM/orgdna/cell38.tif'
cellImagesDirectoryPath{31}='./images/HeLa/2D/LAM/orgcell/cell38.tif'
proteinImagesDirectoryPath{31}='./images/HeLa/2D/LAM/orgprot/cell38.tif'
options.masks{31}='./images/HeLa/2D/LAM/crop/cell38.tif'
dnaImagesDirectoryPath{32}='./images/HeLa/2D/LAM/orgdna/cell39.tif'
cellImagesDirectoryPath{32}='./images/HeLa/2D/LAM/orgcell/cell39.tif'
proteinImagesDirectoryPath{32}='./images/HeLa/2D/LAM/orgprot/cell39.tif'
options.masks{32}='./images/HeLa/2D/LAM/crop/cell39.tif'
dnaImagesDirectoryPath{33}='./images/HeLa/2D/LAM/orgdna/cell3.tif'
cellImagesDirectoryPath{33}='./images/HeLa/2D/LAM/orgcell/cell3.tif'
proteinImagesDirectoryPath{33}='./images/HeLa/2D/LAM/orgprot/cell3.tif'
options.masks{33}='./images/HeLa/2D/LAM/crop/cell3.tif'
dnaImagesDirectoryPath{34}='./images/HeLa/2D/LAM/orgdna/cell40.tif'
cellImagesDirectoryPath{34}='./images/HeLa/2D/LAM/orgcell/cell40.tif'
proteinImagesDirectoryPath{34}='./images/HeLa/2D/LAM/orgprot/cell40.tif'
options.masks{34}='./images/HeLa/2D/LAM/crop/cell40.tif'
dnaImagesDirectoryPath{35}='./images/HeLa/2D/LAM/orgdna/cell41.tif'
cellImagesDirectoryPath{35}='./images/HeLa/2D/LAM/orgcell/cell41.tif'
proteinImagesDirectoryPath{35}='./images/HeLa/2D/LAM/orgprot/cell41.tif'
options.masks{35}='./images/HeLa/2D/LAM/crop/cell41.tif'
dnaImagesDirectoryPath{36}='./images/HeLa/2D/LAM/orgdna/cell42.tif'
cellImagesDirectoryPath{36}='./images/HeLa/2D/LAM/orgcell/cell42.tif'
proteinImagesDirectoryPath{36}='./images/HeLa/2D/LAM/orgprot/cell42.tif'
options.masks{36}='./images/HeLa/2D/LAM/crop/cell42.tif'
dnaImagesDirectoryPath{37}='./images/HeLa/2D/LAM/orgdna/cell43.tif'
cellImagesDirectoryPath{37}='./images/HeLa/2D/LAM/orgcell/cell43.tif'
proteinImagesDirectoryPath{37}='./images/HeLa/2D/LAM/orgprot/cell43.tif'
options.masks{37}='./images/HeLa/2D/LAM/crop/cell43.tif'
dnaImagesDirectoryPath{38}='./images/HeLa/2D/LAM/orgdna/cell44.tif'
cellImagesDirectoryPath{38}='./images/HeLa/2D/LAM/orgcell/cell44.tif'
proteinImagesDirectoryPath{38}='./images/HeLa/2D/LAM/orgprot/cell44.tif'
options.masks{38}='./images/HeLa/2D/LAM/crop/cell44.tif'
dnaImagesDirectoryPath{39}='./images/HeLa/2D/LAM/orgdna/cell45.tif'
cellImagesDirectoryPath{39}='./images/HeLa/2D/LAM/orgcell/cell45.tif'
proteinImagesDirectoryPath{39}='./images/HeLa/2D/LAM/orgprot/cell45.tif'
options.masks{39}='./images/HeLa/2D/LAM/crop/cell45.tif'
dnaImagesDirectoryPath{40}='./images/HeLa/2D/LAM/orgdna/cell46.tif'
cellImagesDirectoryPath{40}='./images/HeLa/2D/LAM/orgcell/cell46.tif'
proteinImagesDirectoryPath{40}='./images/HeLa/2D/LAM/orgprot/cell46.tif'
options.masks{40}='./images/HeLa/2D/LAM/crop/cell46.tif'
dnaImagesDirectoryPath{41}='./images/HeLa/2D/LAM/orgdna/cell47.tif'
cellImagesDirectoryPath{41}='./images/HeLa/2D/LAM/orgcell/cell47.tif'
proteinImagesDirectoryPath{41}='./images/HeLa/2D/LAM/orgprot/cell47.tif'
options.masks{41}='./images/HeLa/2D/LAM/crop/cell47.tif'
dnaImagesDirectoryPath{42}='./images/HeLa/2D/LAM/orgdna/cell48.tif'
cellImagesDirectoryPath{42}='./images/HeLa/2D/LAM/orgcell/cell48.tif'
proteinImagesDirectoryPath{42}='./images/HeLa/2D/LAM/orgprot/cell48.tif'
options.masks{42}='./images/HeLa/2D/LAM/crop/cell48.tif'
dnaImagesDirectoryPath{43}='./images/HeLa/2D/LAM/orgdna/cell49.tif'
cellImagesDirectoryPath{43}='./images/HeLa/2D/LAM/orgcell/cell49.tif'
proteinImagesDirectoryPath{43}='./images/HeLa/2D/LAM/orgprot/cell49.tif'
options.masks{43}='./images/HeLa/2D/LAM/crop/cell49.tif'
dnaImagesDirectoryPath{44}='./images/HeLa/2D/LAM/orgdna/cell4.tif'
cellImagesDirectoryPath{44}='./images/HeLa/2D/LAM/orgcell/cell4.tif'
proteinImagesDirectoryPath{44}='./images/HeLa/2D/LAM/orgprot/cell4.tif'
options.masks{44}='./images/HeLa/2D/LAM/crop/cell4.tif'
dnaImagesDirectoryPath{45}='./images/HeLa/2D/LAM/orgdna/cell50.tif'
cellImagesDirectoryPath{45}='./images/HeLa/2D/LAM/orgcell/cell50.tif'
proteinImagesDirectoryPath{45}='./images/HeLa/2D/LAM/orgprot/cell50.tif'
options.masks{45}='./images/HeLa/2D/LAM/crop/cell50.tif'
dnaImagesDirectoryPath{46}='./images/HeLa/2D/LAM/orgdna/cell5.tif'
cellImagesDirectoryPath{46}='./images/HeLa/2D/LAM/orgcell/cell5.tif'
proteinImagesDirectoryPath{46}='./images/HeLa/2D/LAM/orgprot/cell5.tif'
options.masks{46}='./images/HeLa/2D/LAM/crop/cell5.tif'
dnaImagesDirectoryPath{47}='./images/HeLa/2D/LAM/orgdna/cell6.tif'
cellImagesDirectoryPath{47}='./images/HeLa/2D/LAM/orgcell/cell6.tif'
proteinImagesDirectoryPath{47}='./images/HeLa/2D/LAM/orgprot/cell6.tif'
options.masks{47}='./images/HeLa/2D/LAM/crop/cell6.tif'
dnaImagesDirectoryPath{48}='./images/HeLa/2D/LAM/orgdna/cell7.tif'
cellImagesDirectoryPath{48}='./images/HeLa/2D/LAM/orgcell/cell7.tif'
proteinImagesDirectoryPath{48}='./images/HeLa/2D/LAM/orgprot/cell7.tif'
options.masks{48}='./images/HeLa/2D/LAM/crop/cell7.tif'
dnaImagesDirectoryPath{49}='./images/HeLa/2D/LAM/orgdna/cell8.tif'
cellImagesDirectoryPath{49}='./images/HeLa/2D/LAM/orgcell/cell8.tif'
proteinImagesDirectoryPath{49}='./images/HeLa/2D/LAM/orgprot/cell8.tif'
options.masks{49}='./images/HeLa/2D/LAM/crop/cell8.tif'
dnaImagesDirectoryPath{50}='./images/HeLa/2D/LAM/orgdna/cell9.tif'
cellImagesDirectoryPath{50}='./images/HeLa/2D/LAM/orgcell/cell9.tif'
proteinImagesDirectoryPath{50}='./images/HeLa/2D/LAM/orgprot/cell9.tif'
options.masks{50}='./images/HeLa/2D/LAM/crop/cell9.tif'

options.model.resolution = [ 0.49, 0.49 ];
options.model.filename = 'lamp2.xml';
options.model.id = 'lamp2';
options.model.name = 'lamp2';
options.documentation.description = 'This model has been trained using demo2D01 from CellOrganizer';\
" > input.txt

img2slml input.txt
