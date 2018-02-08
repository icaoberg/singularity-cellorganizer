# singularity-cellorganizer

[![Release Status](https://img.shields.io/badge/release-prealpha-red.svg)](http://www.cellorganizer.org/)
[![Build Status](https://travis-ci.org/icaoberg/singularity-cellorganizer.svg?branch=master)](https://travis-ci.org/icaoberg/singularity-cellorganizer)
[![GitHub issues](https://img.shields.io/github/issues/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/issues)
[![GitHub forks](https://img.shields.io/github/forks/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/network)
[![GitHub stars](https://img.shields.io/github/stars/icaoberg/singularity-cellorganizer.svg)](https://github.com/icaoberg/singularity-cellorganizer/stargazers)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/quick-guide-gplv3.en.html)

## About CellOrganizer 

![CellOrganizer Logo](http://cellorganizer.org/CellOrganizerLogo2-250.jpg)

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

### CellOrganizer Releases

#### CellOrganizer v2.7.0

##### Release Highlights

###### Features

* Included new model class/type: constructive_geomertry/half-ellipsoid.
* Included support for OME.TIFF with regions of interest.

###### Enhancements
* `img2slml` now checks the combination of model class and type for every submodel before attempting to extract parameters from image
* Improved pipeline so that CellOrganizer will stop computation and report to user if no images are found in the path or if software fails to extract parameters.
* Added `demo3D44` to show how to synthesize from a model class/type constructive_geomertry/half-ellipsoid
* Added a battery of unit test for demos using Matlab testing framework
* Added `demo3D45` to show how to use OME.TIFF files with ROIs.

---

Support for [CellOrganizer](http://cellorganizer.org/) has been provided by grants GM075205, GM090033 and GM103712 from the [National Institute of General Medical Sciences](http://www.nigms.nih.gov/), grants MCB1121919 and MCB1121793 from the [U.S. National Science Foundation](http://nsf.gov/), by a Forschungspreis from the [Alexander von Humboldt Foundation](http://www.humboldt-foundation.de/), and by the [Freiburg Institute for Advanced Studies](http://www.frias.uni-freiburg.de/lifenet?set_language=en).

[![MMBioS](http://cellorganizer.org/MMBioSlogo.gif)](http://www.mmbios.org)

Copyright © 2007-2018 by the [Murphy Lab](http://murphylab.web.cmu.edu) at the [Computational Biology Department](http://www.cbd.cmu.edu) in [Carnegie Mellon University](http://www.cmu.edu)
