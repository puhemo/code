---
published: true
title: Ionicbox and how to use it
layout: post
tags: [ionic]
categories: [programming, mobile-development]
---

Today, I decided to try out the [Ionicbox](https://github.com/driftyco/ionic-box) so that I could see what the experience was like and be able to better explain it to newbies.  Ionicbox is a a pre-configured virtual machine that has everything installed that you need to do development using the [Ionic Framework](http://www.ionicframework.com/).

The first thing I noticed was that the at IonicBox only boots to a command prompt and there are no other instructions at [https://github.com/driftyco/ionic-box](https://github.com/driftyco/ionic-box) on how to use the virtual machine.  Luckily, my friend [Troy Miles](https://twitter.com/therockncoder) has the missing instructions on how to use Ionicbox  [http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html](http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html).  Below are the quick steps.  For more details on the steps see Troy's blog post.

## Quick Steps
- Install [Virtualbox](http://www.virtualbox.org)
- Install [Vagrant](http://www.vagrantup.com)
- Open Command Prompt
- Create a directory to hold the vagrant configuraton file for the IonicBox
- Navigate to the created directory
- run vagrant init drifty/ionic-android
- In the directory a file called VagrantFile was created.  Open it in notepad or your favorite text editor
- Add to forward the web server port: 

         config.vm.network :forwarded_port, host: 8100, guest: 8100
     
- Add to forward the live reload port: 

         config.vm.network :forwarded_port, host: 35729, guest: 35729
     
- Add folder from host to guest.  make sure c:\projects exists: 

         config.vm.synced_folder "c:\\projects", "/home/vagrant/projects"
       
- Add to give the machine a name besides the generated one: 
     
         config.vm.hostname = "[Replace with what you want your Host Name to be]"


- Find the virtualbox configuration section and replace it with the section below 
- To bring the machine up run

        vagrant up

- Once the machine is created in VirtualBox and running, run vagrant ssh 
- if everything went successful you should be logged in, now type exit to leave the ssh session
- you should be back to a normal command prompt, type vagrant halt to shutdown the virtual machine
- from the command prompt run:

         "c:\program files\oracle\virtualbox\VBoxManage" setextradata "[Your VM Box Name] VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects 1
       
- To validate the configuration change run:

        "c:\program files\oracle\virtualbox\VBoxManage" getextradataOn VM  "[Your VM Box NameOn VM ]" enumerate

- It should include a line such as 

        Key: VBoxInternal2/SharedFoldersEnableSymlinksCreate/home_vagrant_vagrant_projects, Value: 1


- On Host Machine Run: vagrant up
- On Host Machine Run: vagrant ssh
- On VM Run: cd vagrant_projects
- On VM Run: ionic start blank boxdemo && cd boxdemo
- On VM Run: npm install
- On VM Run: sudo npm install bower -g
- On VM Run: ionic serve
- On Host Machine pen Web Browser on host machine and navigate to http://localhost:8100
- if you want to hibernate the virtual machine, on the host machine in the VagrantFile directory for the VM run


           vagrant suspend
           
           
- if you want to shutdown the virtual machine, on the host machine in the VagrantFile directory from the VM run
         

           vagrant halt

- if you are done with the IonicBox and wish to remove it, on the host machine in the VagrantFile directory run 

      
           vagrant destroy 

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
                 vb.memory = 2048
                 vb.cpus = 2	 
                 vb.name = "IonicBox Linux"
           end
     end
