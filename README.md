# singularity-cellorganizer

[![Release Status](https://img.shields.io/badge/release-v2.7.1-red.svg)](http://www.cellorganizer.org/)
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
* Added T cell single time point model including a correction method for alignment of T cells. Includes training, synthesis and info demos.
* Added outline PCA model. Includes training, synthesis and info demos.
* Added SPHARM-RPDM model for 3D cell/nuclear shapes. Includes training, synthesis and info demos.

#### Fixes 
* Fixed issues with options.train.flag. Valid options should be nuclear, cell, framework, and protein.

#### Enhancements
* Modularized and cleaned up img2slml.

### CellOrganizer v2.7.1

#### Features

* Created method slml2info to replace model2info. The method creates a report with useful information from a model file. Method writes report with Matlab Publisher. When method is deployed, then it generates a report in Markdown.
* Created method slml2report. The method creates a report comparing two model files. Method writes report with Matlab Publisher. When method is deployed, then it generates a report in Markdown.
* Created demos demo2D08 and demo2D09 to show how to make a report from a PCA framework model.

#### Enhancements

* Main methods slml2img, slml2info, slml2report and img2slml have been optimized for Matlab Compiler for release with CellOrganizer for Docker.

#### Fixes

* Fixed problem with demo3D46. Unable to synthesize image from CSGO model when combined with a vesicle model.

### CellOrganizer v2.7.0

#### Features

* Included new model class/type: constructive_geometry/half-ellipsoid
* Included new model class/type: framework/pca
* Included support for OME.TIFF with regions of interest
* Included bash scripts to run demos from compiled versions of the main functions

#### Enhancements

* img2slml now checks the combination of model class and type for every submodel before attempting to extract parameters from image 
* Improved pipeline so that CellOrganizer will stop computation and report to user if no images are found in the path or if software fails to extract parameters.
* Added demo3D44 to show how to synthesize from a model class/type constructive_geomertry/half-ellipsoid
* Added a battery of unit test for demos using Matlab testing framework
* Added demo3D45 to show how to use OME.TIFF files with ROIs.
* Added demo2D05, demo2D06, demo2D07 to show how to train and synthesize from a classtype framework/pca model

## About Singularity

## CellOrganizer v2.7.0 

### Creating the container

To create the container, run these commands

```
> singularity image.create -s 5000 cellorganizer.img
> sudo singularity build cellorganizer.img Singularity
```

### Accesing the container

To access the container, run this command

```
> singularity shell cellorganizer.img

Singularity: Invoking an interactive shell within container...

Singularity cellorganizer.img:~/singularity-cellorganizer> ls -lt /opt/cellorganizer-binaries/

total 87238
-rwxr-xr-x 1 14246 users 40728609 Mar  3 20:22 slml2img
-rwxr-xr-x 1 14246 users 48602526 Mar  3 20:21 img2slml
```

## CellOrganizer v2.7.1 

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
To run a specific app within the shell
```
> cd demos/2D/demo2D**/
> bash ./demo2D**.sh
```

---

Support for [CellOrganizer](http://cellorganizer.org/) has been provided by grants GM075205, GM090033 and GM103712 from the [National Institute of General Medical Sciences](http://www.nigms.nih.gov/), grants MCB1121919 and MCB1121793 from the [U.S. National Science Foundation](http://nsf.gov/), by a Forschungspreis from the [Alexander von Humboldt Foundation](http://www.humboldt-foundation.de/), and by the [Freiburg Institute for Advanced Studies](http://www.frias.uni-freiburg.de/lifenet?set_language=en).

[![MMBioS](https://i1.wp.com/www.cellorganizer.org/wp-content/uploads/2017/08/MMBioSlogo-e1503517857313.gif?h=60)](http://www.mmbios.org)

Copyright (c) 2007-2019 by the [Murphy Lab](http://murphylab.web.cmu.edu) at the [Computational Biology Department](http://www.cbd.cmu.edu) in [Carnegie Mellon University](http://www.cmu.edu)
