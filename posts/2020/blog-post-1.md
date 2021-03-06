---
layout: blog-all.njk
title: Makefile enhances flavour of tox
date: 2020-05-13
tags: ['post']
keywords: ['make','tox']
author: Sharad Vatsa
summary: "Makefile has eased life"
profileimage: holder.js/160x170?theme=AVCS 
profiletext: I am an Automation Engineer, who is drowned in Laziness. So you can expect that I like to automate steps in a fashion, so that I do not need to do anything manually. Professionally I have worked with 3 of the Big 4 Banks and I provide Consulting services in DevOps and Automation. I am Community Driven and a Big time Googler.  
---
This is part 1 of the series where we will discuss on initials of make file and how this can enhance the taste buds of automation to tox.

Makefile or make has eased life of developers in the past and is still commonly used in various spaces.
This blog relates the usage of make with a tox infrastructure test run.

As this is for the community and if you are interested in just the code ,go ahead.
<pre  class="line-numbers">
<code class="language-make">
# Theory
# - Cleanup of old binaries and non required files
# - Performing git clone
# - Calling as shell script to build


.PHONY: build clean run git

VERSION = "0.0.1" #using '0.0.1' , use $RANDOM if you want to use it as $(shell $RANDOM)

TARGET_FILEPATH = $(addsuffix $(VERSION), ./dist/prod-build-)
TARGET_ZIPFILEPATH = $(addsuffix .tar.gz,$(TARGET_FILEPATH))

clean:
    $(shell bash ./run.sh)

run:
    $(clean)
    $(run.sh) tox

git:
    git clone https://<URL.to.repo>

$(TARGET_ZIPFILEPATH):
    $(git)
    @python3 setup.py sdist

build: $(TARGET_ZIPFILEPATH)
</code>
</pre>
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


>> Still working on Next Part 