---
published: true
layout: post
title: 'Windows 8.1 - Powershell Script to Uninstall Default Programs'
categories: ['vagrant', 'windows', 'How-To', 'powershell']
date: 2015-05-27
---

When I am provisioning a new virtual machine with vagrant, I do not need all of the Windows 8 modern applications such as bing maps, finance, skype, etc installed onto the virtual machine.  These applications are nice on a non-virtualized machine but on a virtual machine it just uses extra resources that aren't needed.  Luckily enough Ben Hunter, wrote a powershell script to allow us to remove specific applications over at [http://blogs.technet.com/b/deploymentguys/archive/2013/10/21/removing-windows-8-1-built-in-applications.aspx](http://blogs.technet.com/b/deploymentguys/archive/2013/10/21/removing-windows-8-1-built-in-applications.aspx)

### Getting a List of Possible Applications to Remove

1. Open up a powershell command prompt.
	* Use Windows Key + R, type powershell and press enter
	
1. Run the following command.

		Get-AppxPackage | Format-Wide -Property Name -Column 1 | Out-File "${env:temp}\ModernApps.txt" | notepad "${env:temp}\ModernApps.txt"
1. In the script in the next section, modify the $AppsList variable with the programs that you wish to uninstall.

The Get-AppxPackage command returns all of the information about the install modern applications.  The returned output has a 14 different rows for each application.  Since all that we care about is the name of the application, we are piping the output to the Format-Wide command to return only the Name property in a single column, then writing the output to a file and opening that file in notepad so that you can easily copy application name to the script below.   


### Powershell Script to Remove Specified Applications
 
 This script will take a list of application in the $AppsList variable and call the Remove-AppxPackage command to uninstall the application.  Some applications such as camera and photos are not programs that you can be uninstall and may still be pinned to your start menu after this script has run.  Unfortunately, starting with Windows 8.1 Microsoft removed the ability to programmatically pin and unpin applications from the start menu, so you will have to manually unpin them.  Having to manually unpin a couple of application is much better than having to manually uninstall 19 applications.  

Note:  If you run the script below from the Powershell ISE, you will get a warning about the environment does not support Transcripts.  This warning will go away when the script is run from the powershell command line.

	#********************* 
	# Purpose:    Remove built in apps specified in list 
	# Pre-Reqs:    Windows 8.1 
	#********************* 
	
	#------------------------ 
	# Main Routine 
	#------------------------
	
	# Get log path. 
	# Will log to Task Sequence log folder if the script is running in a Task Sequence 
	# Otherwise log to \windows\temp
	
	try
	{
	    $tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment	
	    $logPath = $tsenv.Value("LogPath")
	}
	catch
	{
	    Write-Host "This script is not running in a task sequence"	
	    $logPath = $env:windir + "\temp"
	}
	
	$logFile = "$logPath\$($myInvocation.MyCommand).log"
	
	# Start logging
	Start-Transcript $logFile
	Write-Host "Logging to $logFile"
	
	# List of Applications that will be removed
	$AppsList = 
	    "microsoft.windowscommunicationsapps",
	    "Microsoft.BingFinance",
	    "Microsoft.BingMaps",`
	    "Microsoft.BingWeather",
	    "Microsoft.ZuneVideo",
	    "Microsoft.ZuneMusic",
	    "Microsoft.Media.PlayReadyClient.2",`
	    "Microsoft.XboxLIVEGames",
	    "Microsoft.HelpAndTips",
	    "Microsoft.BingSports",`
	    "Microsoft.BingNews",
	    "Microsoft.BingFoodAndDrink",
	    "Microsoft.BingTravel",
	    "Microsoft.WindowsReadingList",`
	    "Microsoft.BingHealthAndFitness",
	    "Microsoft.WindowsAlarms",
	    "Microsoft.WindowsScan",
	    "Microsoft.WindowsSoundRecorder",
	    "Microsoft.SkypeApp"
	
	ForEach ($App in $AppsList)
	{
	    $Packages = Get-AppxPackage | Where-Object {$_.Name -eq $App}
	
	    if ($Packages -ne $null)
	    {
	          Write-Host "Removing Appx Package: $App"
	
	          foreach ($Package in $Packages)
	          {
	              Remove-AppxPackage -package $Package.PackageFullName	
	          }
	    }
	    else	
	    {
	          Write-Host "Unable to find package: $App"
	    }
	
	    $ProvisionedPackage = Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -eq $App}
	
	    if ($ProvisionedPackage -ne $null)
	    {
	          Write-Host "Removing Appx Provisioned Package: $App"
	          Remove-AppxProvisionedPackage -online -packagename $ProvisionedPackage.PackageName
	    }
	    else
	    {
	          Write-Host "Unable to find provisioned package: $App"
	    }
	}
	
	# Stop logging	
	Stop-Transcript
	
###Executing Powershell Script as Part of Vagrant Provisioning

1. In the directory where you have your VagrantFile, create a directory called shell.
1. Create a new file called RemoveDefaultPrograms.ps1 int the shell folder.
1. In the shell directory, create a file called main.cmd.
1. Add the following contents to the main.cmd file.

		echo 'Removing Default Windows Programs'		
		@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\RemoveDefaultPrograms.ps1"
		
1. Open up your VagrantFile in a text editor of your choice.
1. Add the following line in the area where you have your provisioning setup.
     
		config.vm.provision :shell, path: "shell/main.cmd" 
1. When you run vagrant up, the last step it will run is the provisioning scripts.
1. If you already have a machine controlled by vagrant up and running, you can run vagrant provision to rerun the provisioning scripts.
1.  ??? ADD SAMPLE OUTPUT FROM PROVISION ???

###Conclusion

Now the start menu on the virtual machine is much cleaner and is not running unneeded live tiles in the background.  Running this script is much faster than uninstalling all of the programs by hand.  You can run this script by hand on any machine that you wish to remove some of the default modern applications that Microsoft installs as part of Windows.      