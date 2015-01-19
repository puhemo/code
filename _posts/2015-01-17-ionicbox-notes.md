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

1 Open Windows Explorer and create a directory where you want to hold all of your Vagrant configuration files

2 Instead the directory created in step 1, create a directory called IonicBox

3 In Windows Explorer, create the directory under the c drive called projects

4 In Windows Explorer, do a shift+right click on the IonicBox directory and select Open Command Prompt 

5 Run: vagrant init drifty/ionic-android

6 Open notepad

7 In notepad, open the VagrantFile created in the IonicBox directory. 

8 select all of the text in the VagrantFile and remove it

9 Copy the following text into the VagrantFile

```
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
                 vb.name = "IonicBox"
           end
     end
```

So what does all of those options in the VagrantFile mean?

Ionic uses port 8100 for the web site and the live reload function use port 35729.  We forwarded these ports from IonicBox to the host machine so we can access the web server.  The following two lines do the port forwarding
```
         config.vm.network :forwarded_port, host: 8100, guest: 8100
         config.vm.network :forwarded_port, host: 35729, guest: 35729
```     
Next 
- Add folder from host to guest.  make sure c:\projects exists: 
```
         config.vm.synced_folder "c:\\projects", "/home/vagrant/projects"
```       
- Add to give the machine a name besides the generated one: 
```     
         config.vm.hostname = "[Replace with what you want your Host Name to be]"
```

- Find the virtualbox configuration section and replace it with the section below 
- To bring the machine up run
```
        vagrant up
```
- Once the machine is created in VirtualBox and running, run vagrant ssh 
- if everything went successful you should be logged in, now type exit to leave the ssh session
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

- On Host Machine Run: vagrant up
- On Host Machine Run: vagrant ssh
- On VM Run: cd vagrant_projects
- On VM Run: ionic start blank boxdemo && cd boxdemo
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
