---
published: false
title: Ionicbox and how to use it
layout: post
tags: [ionic]
categories: [programming, mobile-development]
---

If you have looked at setting up the [Ionic Framework](http://www.ionicframework.com) or have it done it before, you know on much of a pain it can be, especially when something doesn't work.  Luckily, Ionic offers a free virtual machine called [Ionicbox](https://github.com/driftyco/ionic-box) that is already configured with all of the software that you need.  

### Prerequisites:

Before you can use [Ionicbox](https://github.com/driftyco/ionic-box) you need to install [VirtualBox](http://www.virtualbox.org) and [Vagrant](http://www.vagrantup.com).  If you are on Windows and using [Chocolatey](http://www.chocolatey.org), you can install both using  cinst virtualbox and cinst vagrant.

[VirtalBox](http://www.virtualbox.org) is a free virtual machine program.  A virtual machine is a complete computer and operating system run from within your current operating system.  It makes it possible to run Linux on a Windows Machine, Windows on a Mac, etc.  

[Vagrant](http://www.vagrantup.com) is an easy way to manage virtual machines.  A full explaination is out of scope for this article.  

### Ionic Box

Make sure that you installed VirtualBox and Vagrant before proceeding.  

### Installing

1. Open Windows Explorer and create a directory where you want to hold all of your Vagrant configuration files

2. Instead the directory created in step 1, create a directory called IonicBox

3. In Windows Explorer, create the directory under the c drive called projects (i.e. c:\projects)

4. In Windows Explorer, do a shift+right click on the IonicBox directory and select Open Command Prompt 

5. Run: vagrant init drifty/ionic-android

6. Open notepad

7. In notepad, open the VagrantFile created in the IonicBox directory. 

8. select all of the text in the VagrantFile and remove it

9. Copy the following text into the VagrantFile

```
     # -*- mode: ruby -*-
     # vi: set ft=ruby :
     Vagrant.configure(2) do |config|
           config.vm.box = "drifty/ionic-android"
           config.vm.hostname = "[Replace with what you want your Host Name to be]" # No Spaced Allowed
           config.vm.boot_timeout = 600
           config.vm.network :forwarded_port, host: 8100, guest: 8100
           config.vm.network :forwarded_port, host: 35729, guest: 35729
           config.vm.synced_folder "c:\\projects", "/home/vagrant/vagrant_projects"
           config.vm.provider "virtualbox" do |vb|
                 vb.gui = false
                 vb.customize ["modifyvm", :id, "--vram", "128"]
                 vb.customize ["modifyvm", :id, "--usb", "on"]
                 vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
                 vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects", "1"]
                 vb.memory = 2048
                 vb.cpus = 2	 
                 vb.name = "IonicBox" # This is the name in the VirtualBox Manager UI
           end
     end
```

### So what do  all of those options in the VagrantFile mean?

In the configuration we configure the video and physical memory of the virtual machine.  Since IonicBox is just a shell without a GUI, it doesn't need a lot of resources, so we only give it 2 gigs of memory.  Now if your host system doesn't have a lot of memory, you will need to dial this down.  

Ionic uses port 8100 for the web site and the live reload function use port 35729.  We forwarded these ports from IonicBox to the host machine so we can access the web server.  The following two lines do the port forwarding
```
         config.vm.network :forwarded_port, host: 8100, guest: 8100
         config.vm.network :forwarded_port, host: 35729, guest: 35729
```     

The IonicBox is just a Linux shell with no GUI so you will want to use a feature in VirtualBox called Shared Folders to be able to edit the files from your host machine.  In our case we are using c:\projects on the host machine which is linked to ~/vagrant_projects on the IonicBox
```
         config.vm.synced_folder "c:\\projects", "/home/vagrant/projects"
```       

Next we set up the VirtualBox options

-We don't need the VirtualBox GUI since we are going to SSH into the machine so we can turn it off with 
```
vb.gui = false
```
- We set the Video Ram to 128 megs
```
vb.customize ["modifyvm", :id, "--vram", "128"]
```
- Turn on the USB drivers so that we can connect an Android device
```
vb.customize ["modifyvm", :id, "--usb", "on"]
```
-Add a usb device filter for a Android Device
```
                 vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
```
- Turn on Symlinks to the synced_folder above.  This is needed if your Host Operating System is Windows in order node/npm to work correctly.  
```
vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects", "1"]
```


- Set the system memory for the virtual machine.  If you host machine is low on memory you can reduce this down.  You must have this much memory free when the virtual machine starts up
```
vb.memory = 2048
```
- Number of Physical CPUs to allocate.  My machine only has 2 physical CPUs.  You can allocate more or take it down to 1
```
vb.cpus = 2	 
```
- The name to use for the virtual machine in the VirtualBox Manager UI
```
vb.name = "IonicBox"
```

### Starting up the IonicBox and Getting logged in

- Open a command prompt and navigate to the IonicBox folder that contains the VagrantFile.  Run command below. This command will take a while the first time you run it since it has to download the vagrant box container which is about 1 gig in size.
``` 
vagrant up
```
- To login to the machine, use the same command prompt as previous step and run
```
vagrant ssh
```
- if everything went successful you should be logged in


### Testing the IonicBox

Now lets create our first Ionic project.  

On the IonicBox ssh connection:

```
     cd vagrant_projects
     ionic start tabs firstApp && cd firstApp
```

You now have a Ionic project in a directory called firstApp.

If you are using Windows as your host operating system you will need to setup a symbolic link for the node_modules folder sicne windows has a length limitation when using shared folders.


- On VM Run: mkdir ~/node_modules
- On VM Run: cp ~/vagrant_projets/boxdemo/package.json ~/package.json
- On VM Run: ls -s ~/node_modules node_modules
- On VM Run: cd ~/
- On VM Run: npm install
- On VM you may be also need to run: sudo npm install bower -g
- On VM Run: ionic serve
- On Host Machine pen Web Browser on host machine and navigate to http://localhost:8100
- if you want to hibernate the virtual machine, on the host machine in the VagrantFile directory for the VM run

```
           vagrant suspend
```           
           
- if you want to shutdown the virtual machine, on the host machine in the VagrantFile directory from the VM run
```      

           vagrant halt
```
- if you are done with the IonicBox and wish to remove it, on the host machine in the VagrantFile directory run 
```
      
           vagrant destroy 
```
 - Note that sometimes this leaves behind the directory that contained the Virtual Machine.  Before you can run vagrant up again, you will need to manually delete this directory.

## Configuration File

     # -*- mode: ruby -*-
     # vi: set ft=ruby :
     Vagrant.configure(2) do |config|
           config.vm.box = "drifty/ionic-android"
           config.vm.hostname = "IonicBox"
           config.vm.boot_timeout = 600
           config.vm.network :forwarded_port, host: 8100, guest: 8100
           config.vm.network :forwarded_port, host: 35729, guest: 35729
           config.vm.synced_folder "c:\\projects", "/home/vagrant/vagrant_projects"
           config.vm.provider "virtualbox" do |vb|
                 vb.gui = false
                 vb.customize ["modifyvm", :id, "--vram", "128"]
                 vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
                 vb.customize ["modifyvm", :id, "--usb", "on"]
                 vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
                 vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects", "1"]
                 vb.memory = 2048
                 vb.cpus = 2	 
                 vb.name = "IonicBox Linux"
           end
     end


The first thing I noticed was that the at IonicBox only boots to a command prompt and there are no other instructions at [https://github.com/driftyco/ionic-box](https://github.com/driftyco/ionic-box) on how to use the virtual machine.  Luckily, my friend [Troy Miles](https://twitter.com/therockncoder) has the missing instructions on how to use Ionicbox  [http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html](http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html).  Below are the quick steps.  For more details on the steps see Troy's blog post.


## Troubleshooting

- you should be back to a normal command prompt, type vagrant halt to shutdown the virtual machine
- from the command prompt run:
```
         "c:\program files\oracle\virtualbox\VBoxManage" setextradata "[Your VM Box Name] VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects 1
```       
- To validate the configuration change run:
```
        "c:\program files\oracle\virtualbox\VBoxManage" getextradataOn VM  "[Your VM Box NameOn VM ]" enumerate
```
- It should include a line such as 
```
        Key: VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects, Value: 1
```
