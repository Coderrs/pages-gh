---
layout: blog-all.njk
title: Docker with VS code in Windows - Sounds like fun !!!
date: 2020-10-08
tags: ['post']
keywords: ['docker','vscode','Windows']
author: Sharad Vatsa
summary: "Docker with VS code in Windows - Sounds like fun !!!"
profileimage: holder.js/160x170?theme=AVCS 
profiletext: I am an Automation Engineer, who is drowned in Laziness. So you can expect that I like to automate steps in a fashion, so that I do not need to do anything manually. Professionally I have worked with 3 of the Big 4 Banks and I provide Consulting services in DevOps and Automation. I am Community Driven and a Big time Googler.  
---
### Docker can now easily be installed in the windows Operating system, quick considerations follow(s) as below.

1) Check Windows Operating system is compatible with latest docker installer 
2) Virtualization support in BIOS
3) Check Enough RAM / Storage (HDD) and CPU

### Want to proceed with installation 

Lets Download the Stable version of Docker Desktop Installer from Community website url :  https://hub.docker.com/editions/community/docker-ce-desktop-windows/ 

You will get below features as part of the installer, which means day by day it is more windows now .... 
 - HyperV (No more Virtual box requirements)
 - WSL2 (WSL stands for Windows Subsystem for Linux)

Lets Download and Install the wsl2 kernel for windows, in case you are prompted to do so before you click on restart button 
https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel


If you have followed the steps as above , you should now see a whale in system tray (notification area).