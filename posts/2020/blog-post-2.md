---
layout: blog-all.njk
title: Blog Jenkins with Docker Slaves
date: 2020-11-05
tags: ['Jenkins Docker Slaves']
author: Amit Dsouza
---
# Jenkins with Docker Slaves
As a DevOps Engineer I used to quite often run into a requirement by the product engineering team, to install new libraries required for a Jenkins pipeline of their product. These were previously actioned by spinning up a new EC2 box as a jnlp slave with those libraries or tools, in order to ensure there were no interference between two different slaves required by different product teams. This worked well for a while but didn’t make sense since there would have to be a new instance spun up for every different slave. 

All of this changed with the dawn of Docker. We realised that we can leverage containers as slaves thus saving on management of separate servers and consolidating them as a single ECS or EKS cluster. The redesign of the management of slaves had fewer steps and the advantage of infrastructure or in this case Jenkins slaves as code. 

I migrated our Jenkins onto ECS and referenced the Docker files published by Jenkins and created a master and slave base template thus ensuring we always know what version of Jenkins we are always pulling. Our images were stored in AWS ECR and I designed the designed child images inheritance structure to be used for our slave images.
 
Base-slave-template
	  |Python
           |Boto3

I implemented a pipeline which would create an image and push it to ECR after performing security checks. 
With this I could hand over the ability to use new libraries directly to the developer teams.
They would write new docker files with any additional libraries and send us a pull request, once we approve the request the pieline would create a image and push it to ECR making a new slave available. This enabled us to hand over such requests to the developers themselves while still having control over the final image and thus ensuring what goes through.  

The multiple advantages we achieved from this are:
All slaves were managed on a single cluster with auto scaling enabled
Each slave were completely isolated from each other thus ensuring any changes or even mistakes made while creating a slave does not affect any other existing slave.
The Inheritance structure gave us a design which would be scalable in the future.

[Amit Dsouza](https://www.linkedin.com/in/amit-dsouza/)