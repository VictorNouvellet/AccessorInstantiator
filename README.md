# AccessorInstantiator 
[![GitHub license](https://img.shields.io/badge/license-New%20BSD-blue.svg)](https://raw.githubusercontent.com/VictorNouvellet/AccessorInstantiator/master/LICENCE.txt) ![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)

First demo project aiming to demonstrate the JXCore host usability.

This project is based off of [JXCore iOS Sample](https://github.com/jxcore/jxcore-ios-sample).

This repository does not contains the source code for the JXCore host. You need to download it from the svn repository [here](https://www.icyphy.org/accessors/svn.html) and include it in this project. Please do not commit any files from this repo owned by University of California Berkeley in this project.

This app consists in:

 * Instantiating accessors
 * Running swarmlets

## Getting started
### Prequisites

* [Xcode 8.3 or greater](https://developer.apple.com/xcode/)
* Swift 3.1


### Installation

1. Clone or [download](https://github.com/VictorNouvellet/AccessorInstantiator) this project.
- Download the latest version of the JXCore host from the [accessors repo on the iCyPhy website](https://www.icyphy.org/accessors/svn.html)
- Move files from `$PTII/org/terraswarm/accessor/accessors/web/hosts/jxcore` folder to the `JS` folder of this project. $PTII stands for the root folder of the svn repo.
- Open Xcode and make sure your device is connected to your computer
- Build & Run by using ⌘+R.


## User Steps after installation

- Open the app
- Begin editing your accessor
- Tap the 'Instantiate' button to instantiate it
- Slide the upper window to the right to edit your swarmlet
- Tap the 'Run' button to run it
- See the log results on the window below

## Contributing

Everything works around one branch (`master`) to follow the [Github Flow](https://guides.github.com/introduction/flow/). 
Feel free to submit pull requests.
Test your (not yet tested) code if possible before pull requests.

## Authors
Victor Nouvellet - victor (dot) nouvellet (at) gmail (dot) com

## License
Thanks to the JXCore team for [the work](https://github.com/jxcore/jxcore) done so far. Built files are included in the JXcore folder.
AccessorInstantiator is released under a New BSD License. See LICENSE file for details.

## See also
* [Accessors](http://accessors.org)
* [Cordova Host Wiki](https://www.icyphy.org/accessors/wiki/Main/CordovaHost)

## To-do
* Create Accessor Instantiator logo
* Improve design
* Add acknowledgement about JXCore project maintenance
* Create CapeCode "iOS project generation" button





