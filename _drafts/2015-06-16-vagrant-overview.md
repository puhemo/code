----
title: 'Vagrant - Easy Virtual Machine Management'
---

Article Series:

1. Vagrant - Easy Virtual Machine Management
1. Vagrant - Provisioning with Chocolatey
1. Vagrant - Remove Default Programs
1. Vagrant - Network Options
1. Vagrant - Installing BoxStarter
1. Vagrant - Installing All of the Your Software
1. Vagrant - Multiple Machines
1. Vagrant - Azure Virtual Machines
1. Vagrant - Creating Your Own Base Boxes

Outline:

* What is Vagrant?
* Getting Started
	* Installing Chocolatey
	* Installing Virtualbox
	* Installing Vagrant
* Your First Machine
	* Give basic instructions for vagrant init
	* Example what vagrant init will do for you
	* Basic Vagrant Box configurations
	* Configuring Virtualbox in VagrantFile
	* Starting up machine
	* Logging into machine
	* Vagrant commands
* Where to get machines?
	* Give the cloud url
	* Give example of the type of boxes
* Next Steps
	* Provisioning
	
##What is Vagrant?

Vagrant allows you to create and manage lightweight reproducible virtual machines.   Essentially,  all of the configurations to be able to create a virtual machine, configure it, and install all of the software are kept separate from the virtual machine.  This allows you to at any delete the virtual machine and then re-create it with all of the same configurations later on if you need it again.   No longer do you have to be afraid to delete a virtual machine for a project that isn't active.   You can also give the Vagrant  configuration to a co-worker or move it to another machine and be assured that everything will get setup correctly when you create the virtual machine on the new machine.  

When I say all of the configurations are stored in a separate file what does that mean?  Vagrant create a file called VagrantFile for each virtual machine,  The VagrantFile holds information about the box the virtual machine is based off of, how to setup the network, the virtual machine  provider configuration (virtualbox, vmare, hyper-v, azure, etc), and any provisioning scripts to run (shell , puppet, chef, etc) .  

Before, we can see Vagrant in action, we first need to install a little bit of software onto your machine.

##Getting Started

In this section, we will install all of the software needed to be able to Vagrant.  

There are 3 pieces of software that we need:
1. Chocolatey
1. Virtual
1. Vagrant

###Chocolatey

Chocolatey is a Windows software install manager.  It solves several common issues with software installed:
	* Where do I find the installer for software?
	* How do I find the 64 bit vs 32 bit version?
	* What default options should I select?
	* Where should  I install the software to?
	* etc
	* etc

To install Chocolatey, open an administrative command prompt and  run the command below or get the command right on the home for Chocolatey at  [http://chocolatey.org](http://chocolatey.org)  .

	!!!PUT CHOCO INSTALL SCRIPT COMMAND HERE

Go ahead and close the command prompt that you used to install Chocolatey.  This is needed so that all of the environment variables get refresh that are part of the Chocolatey installer.

Now that we have Chocolatey installed, we can start installing software or as Chocolatey calls them, packages.

To install a package, you would run the command:

	choco instal [package name]
	
You can find the package names on the Chocolatey Gallery at [http://chocolatey.org](http://chocolatey.org].  

Next we are going to install Virtualbox using Chocolatey.

###Virtualbox

For this tutorial, I am using Virtualbox as the virtual machine provider.  You could also use Hyper-V (free)  or VMWare (paid).  If you are using Hyper-V already, you can not use Virtualbox at the same as they conflict with each other.

If you already have Virtualbox installed, you can skip this step.  

Open an administrative command prompt and run the following Chocolatey command.  

	choco install virtualbox.?????
	
The command above will also instal Virtualbox as it is listed as a dependency for the virtualbox.???? package.


## Your First Machine

##Where to get machines?

##Next Steps