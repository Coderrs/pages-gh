---
layout: blog-all.njk
title: Makefile enhances flavour of tox
date: 2020-05-30
tags: ['post']
keywords: ['make','tox']
author: Sharad
summary: "Makefile has eased life"
profileimage:  
profiletext: 
---

Makefile or make has eased life of developers in the past and is still commonly used in various spaces.
This blog relates the usage of make with a tox infrastructure test run.

As this is for the community and if you are interested in just the code ,go ahead.

<script src="https://gist.github.com/sharadvatsa/eff3d9c00f79e42f1a7ae7ddb1f58bb9.js"></script>

What does that means ?

<code>make clean</code> # will clean the directory

## Let us look at the code line by line

line 7 : phony here is to ensure explicit calls to build clean run git, this is not an order of execution
for indepth understanding Refer :: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html

line 9 : this is assignment of a string "0.0.1" to a variable

line 11 : this appends $(VERSION) with ./dist/prod-build- thus variable "TARGET_FILEPATH" =  /dist/prod-build-0.0.1
line 12 : this will make TARGET_ZIPFILEPATH = /dist/prod-build-0.0.1.tar.gz

line 14, 17, 21, 24, 28 : all represents a call similar to a goto statement

## Lets see the code calls and respective outputs

<code>make clean build</code> # will clean the directory , then do a git clone (line 22), execute a python sdist (line 26)

<code>make clean build run</code> # will do "make clean build" in sequence and thereafter will perform clean (line 15) and then run with tox parameter (line 19)
