# singularity-cellorganizer

[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/2228)
[![Release Status](https://img.shields.io/badge/release-v2.8.0-red.svg)](http://www.cellorganizer.org/)
[![Build Status](https://travis-ci.org/icaoberg/singularity-cellorganizer.svg?branch=master)](https://travis-ci.org/icaoberg/singularity-cellorganizer)
[![GitHub issues](https://img.shields.io/github/issues/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/issues)
[![GitHub forks](https://img.shields.io/github/forks/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/network)
[![GitHub stars](https://img.shields.io/github/stars/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/stargazers)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/quick-guide-gplv3.en.html)

## About CellOrganizer 

![CellOrganizer Logo](http://www.cellorganizer.org/wp-content/uploads/2017/08/CellOrganizerLogo2-250.jpg)

The [CellOrganizer](http://cellorganizer.org/) project provides tools for

* learning generative models of cell organization directly from images
* storing and retrieving those models
* synthesizing cell images (or other representations) from one or more models

Model learning captures variation among cells in a collection of images. Images used for model learning and instances synthesized from models can be two- or three-dimensional static images or movies.

[CellOrganizer](http://cellorganizer.org/) can learn models of

* cell shape
* nuclear shape
* chromatin texture
* vesicular organelle size, shape and position
* microtubule distribution.

These models can be conditional upon each other. For example, for a given synthesized cell instance, organelle position is dependent upon the cell and nuclear shape of that instance.

Cell types for which generative models for at least some organelles have been built include human HeLa cells, mouse NIH 3T3 cells, and Arabidopsis protoplasts. Planned projects include mouse T lymphocytes and rat PC12 cells.

### CellOrganizer v2.8.0

#### Features
* Added improved model for generating protein distributions during T cell synapse formation that only requires annotation of cell couples at a single time point model and improves synapse alignment. Includes training, synthesis and info demos.
* Added outline PCA model for 2D cell and nuclear shapes. Includes training, synthesis and info demos.
* Added SPHARM-RPDM model for 3D cell and nuclear shapes (see https://doi.org/10.1093/bioinformatics/bty983). Includes training, synthesis and info demos.

#### Fixes 
* Fixed issues with options.train.flag. Valid options should be nuclear, cell, framework, and protein.

#### Enhancements
* Modularized and cleaned up img2slml.

## Running on Singularity

## CellOrganizer v2.8.0 

### Creating the container

To create the container, run this command

```
> bash ./script.sh 
```
### Accessing the container

To access the container, run the command

```
> singularity shell cellorganizer.simg

Singularity: Invoking an interactive shell within container...
```
To list the possible apps, run
```
Singularity cellorganizer.img:~/singularity-cellorganizer> ls -lt /opt/cellorganizer-binaries/

total 111821
-rwxr-xr-x 1 14246 users 12699470 Mar 29 14:25 slml2report
-rwxr-xr-x 1 14246 users 12471747 Mar 29 14:25 slml2info
-rwxr-xr-x 1 14246 users 40728639 Mar 29 14:25 slml2img
-rwxr-xr-x 1 14246 users 48604048 Mar 29 14:25 img2slml
```
### Running Demos
To run a specific demo
```
> cd demos/2D/demo2D**/
> singularity run ~/path/to/cellorganizer.simg demo2D**.sh
```

---

Support for [CellOrganizer](http://cellorganizer.org/) has been provided by grants GM075205, GM090033 and GM103712 from the [National Institute of General Medical Sciences](http://www.nigms.nih.gov/), grants MCB1121919 and MCB1121793 from the [U.S. National Science Foundation](http://nsf.gov/), by a Forschungspreis from the [Alexander von Humboldt Foundation](http://www.humboldt-foundation.de/), and by the [Freiburg Institute for Advanced Studies](http://www.frias.uni-freiburg.de/lifenet?set_language=en).

[![MMBioS](https://i1.wp.com/www.cellorganizer.org/wp-content/uploads/2017/08/MMBioSlogo-e1503517857313.gif?h=60)](http://www.mmbios.org)

Copyright (c) 2007-2019 by the [Murphy Lab](http://murphylab.web.cmu.edu) at the [Computational Biology Department](http://www.cbd.cmu.edu) in [Carnegie Mellon University](http://www.cmu.edu)
