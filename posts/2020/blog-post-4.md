---
layout: blog-all.njk
title: Performance testing for dummies
date: 2020-08-01
tags: ['post']
summary: The iterative style of development in the Agile has changed the way we build and test the software.
keywords: ['workload', 'modelling']
author: Vijay Hatewar
profileimage: data:image/jpeg;base64,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 
profiletext: 
---

# Performance testing for dummies 

The iterative style of development in the Agile has changed the way we build and test the software.

During the waterfall days, the performance test was primarily executed in the last phase of the product. However, an agile approach requires you to test your product before every release. The shift towards continuous integration and development has changed how we plan overall performance tests and how often we test however there has not been any change in the way we strategize the performance testing.

Though we no longer are required to build elaborate test plans that we used to write when the  waterfall model was prevalent, we still should invest a great deal of time and effort in strategizing the performance testing project. 

The first step of which is building the workload model. 

What is the workload model?

The workload model is the primary artefact in the performance testing process based on which performance testing approach is decided.
The principal objective behind the workload model is to identify the list of critical business transactions and the load distribution for running various performance tests such as load,  volume, spike, stress and scalability. 

Following are the primary phases in the performance testing life cycle planning.

1. Defining non-functional requirements &  service level agreements. 
2. Workload Modelling.
3. Scripting of (for automation) critical business processes using your preferred tool. 
4. Building pipelines to run your tests.
5. Running baseline performance tests and performance benchmarking. 
6. Performance monitoring. 
7. Reporting. 

Let us assume that your business owner has expectations that under standard peak load, 90 percent of the critical transactions should be completed within 3 seconds and remaining 10 percent within the SLA of 10 seconds

**In this blog, we shall discuss the workload modelling.** 

Performance tests are executed to full-proof your application from probable failures that may occur due to sudden (Spike testing) or gradual increase in the load or volume (scalability testing), from infrastructure failures, from untuned code or a performance bottleneck due to incorrectly configured components in the system. 

The objective of performance testing is to simulate a load onto a production-like environment and identify gaps in your application and environment before they become a real business problem. This can only be achieved by first building an appropriate simulation model that correctly captures your critical business processes, list of critical APIs or database queries. 
The workload model is the document that will capture these details and also provide the  calculations that will guide a performance tester with required details to carry out performance testing such as an expected number transactions per seconds (TPS), pacing and thinking time calculations for every in-scope business-critical process. 

__There are four different sources of truths that a performance engineer should utilize to build his workload model.__ 

| Source Type | Tools/Sources |
|------------|---------------|
|Actuals/Production logs| Web server logs, Database queries, or Data mining tools such as Splunk or Logstash Kibana.|
|Testimony (from Business)| A businessperson who has an understanding of the expected growth of the software product you are testing.
|Comparison| Your competitor’s product in the market or their published sales numbers.|
|Inference |Result of the process of reasoning in which the tester knows some unperceived character of a software product through the testing or domain experience.| 

## Parrot Principle or 80/20 rule.
The widely accepted approach in the performance testing space is that 80% business volume is contributed by 20% business transactions. The workload model for performance testing is often designed with the same assumptions that are based on the Pareto principle. 

The Pareto principle (also known as the 80/20 rule, the law of the vital few, or the principle of factor sparsity) states that, for many events, roughly 80% of the effects come from 20% of the causes. 

Following is the pictorial illustration of the Pareto principle applied to community fundraising

<img src="/img/Pareto_principle.jpg" style="max-height: 300px; float: center;" class="img-fluid" alt="Responsive image">

Let us say after applying the above principle you have recognised the list of the critical business transactions. And based on the data obtained from the different sources of knowledge such production logs; you have identified transaction volume for each business-critical transaction and the peak load volume. 
The next step is ascertaining required pacing and thinking time to build the workload model. 
The mathematical principle that I use to build this simulation model is Little's law of queueing theory which states that the long-term average number L of customers in a stationary system is equal to the long-term average effective arrival rate λ multiplied by the average time W that a customer spends in the system. Expressed algebraically the law is

_L = λ W_

| Business Process | Steps | Avg think time (seconds) | Total think time (_W_) | Total Users(_L_) | Pacing time (_λ_) |
|------------|---------------|------------|---------------|------------|---------------|
| BP -1 | 5 | 10 | 50 | 30 | 1.6 |
| BP -2 | 10 | 10 | 100 | 200 | 2 |
| BP -3 | 7 | 10 | 70 | 140 | 2 |
| BP -4 | 14 | 10 | 140 | 300 | 2.14 |
| BP -5 | 11 | 10 | 110 | 300 | 2.7 | 

_W_ - Think time is average time users spend on every page.
_L_ - Total users during peak load hour 
_λ_ – Interval between the iteration of same transactions. 

#### Suggestions:

**Use the above steps to execute your baseline performance tests.**
**To achieve expected TPS, modify your total user count, pacing time values for in-scope transactions  for any other goal-oriented performance testing such as stress or scalable testing.**  

[Vijay Hatewar](https://www.linkedin.com/in/vijay-hatewar-a3a40b4/)