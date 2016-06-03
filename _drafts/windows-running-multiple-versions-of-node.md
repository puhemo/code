---
layout: post
title: 'Running Multiple Version of Node On Windows'
date: 2016-06-04 06:00
categories: ['nodejs']
published: true
excerpt: |


---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

We are going to use [nvm](https://github.com/coreybutler/nvm-windows/) to to manage switching between different versions of node.  

1. Uninstall existing version of node 
1. Delete any existing nodejs installation directories.  e.g. "C:\Program Files\nodejs") that might remain. NVM's generated symlink will not overwrite an existing (even empty) installation directory.
1. Delete the npm install directory at C:\Users\[Your User]\AppData\Roaming\npm



We are now ready to install nvm.  Download the installer from [https://github.com/coreybutler/nvm/releases](https://github.com/coreybutler/nvm/releases)

**To upgrade**, run the new installer. It will safely overwrite the files it needs to update without touching your node.js installations. Make sure you use the same installation and symlink folder. If you originally installed to the default locations, you just need to click "next" on each window until it finishes.

Install a node version

1. Get a the list so you can see what is available

        $ nvm list available
        
1. Pick the one you want to install

        $ nvm install 4.4.5
        $ nvm install 5.10.1
        
1. Select the node version to use

        $ nvm use 4.4.5
        $ nvm use 5.10.1
        
    >Only 1 node version can be activate at a  time
    {:.warning}
                    
**Usage**

* nvm arch [32 or 64] Show if node is running in 32 or 64 bit mode. Specify 32 or 64 to override the default architecture.
* nvm install <version> [arch]: The version can be a node.js version or "latest" for the latest stable version. Optionally specify whether to install the 32 or 64 bit version (defaults to system arch). Set [arch] to "all" to install 32 AND 64 bit versions.
* nvm list [available]: List the node.js installations. Type available at the end to show a list of versions available for download.
* nvm on: Enable node.js version management.
* nvm off: Disable node.js version management (does not uninstall anything).
* nvm proxy [url]: Set a proxy to use for downloads. Leave [url] blank to see the current proxy. Set [url] to "none" to remove the proxy.
* nvm uninstall <version>: Uninstall a specific version.
* nvm use <version> [arch]: Switch to use the specified version. Optionally specify 32/64bit architecture. nvm use <arch> will continue using the selected version, but switch to 32/64 bit mode based on the value supplied to <arch>.
* nvm root <path>: Set the directory where nvm should store different versions of node.js. If <path> is not set, the current root will be displayed.
* nvm version: Displays the current running version of NVM for Windows.

>Gotcha! Please note that any global npm modules you may have installed are not shared between the various versions of node.js you have installed. Additionally, some npm modules may not be supported in the version of node you're using, so be aware of your environment as you work
{:.warning}