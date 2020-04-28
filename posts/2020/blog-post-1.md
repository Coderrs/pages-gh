---
layout: blog-all.njk
title: Makefile enhances flavour of tox
date: 2020-05-30
tags: ['post']
---

Makefile is a known term for people of my age or one's who work with 'C'.
Terminology of Makefile do not seem so common with python and testing.
Here I am sharing my understanding on how we can utilize make for a cleaner and reusable testing.

I am not going to stop really busy guyz, if you just want to get a code for your important work and do not want to read a thing.

``` Makefile
# Theory
# 1) Cleanup of old binaries and non required files
# 2) Performing git clone
# 3) Calling as shell script to build


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
```


Its been while with me writing blogs or a paragraph, sentences in

