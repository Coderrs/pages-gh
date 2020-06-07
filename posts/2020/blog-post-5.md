---
layout: blog-all.njk
title: Salesforce & DevOps
date: 2020-05-13
tags: ['post']
keywords: ['salesforce','devops']
author: Apoorva Gautam
summary: "Salesforce Automation & Azure DevOps"
profileimage: holder.js/160x170?theme=AVCS 
profiletext: Senior Software professional with experience in application and web services development. Highly motivated and result oriented professional with excellent skill-set spanning Decision making, Analytical and Problem Solving. Successfully led teams of varying compositions aided by strong Interpersonal and Communication skills. Solid experience in requirement analysis, software design and development of software in multiple technologies.  
---

We can easily set-up the CI/CD pipelines in Azure Devops either by utilizing the YAML file or by writing a
PowerShell script to define the individual deployment subtasks.
In this blog, we will unravel the step-by-step process to structure the Azure Devops by making use of YAML
files.

### Salesforce Authentication (using SFDX CLI):
-  Developers should login to their SF environment by using sfdx force: auth:web:login command and
set the alias of the environment(for ex: AVCS-DEV) and generate the SFDX authURL through following
verbose flag commands sfdx force:org:display -u AVCS-DEV –verbose.
-  Copy the SFDX authURL value generated in previous step, it usually starts with force://PlatformCLI for
ex: force://PlatformCLI::<encrypted_token>@business-ruby-2985-dev-ed.cs73.my.salesforce.com

### Azure Config for creating new pipelines:
- Go to your Azure project > Pipelines > Environments
-  Click on new environment and use the standard naming convention for the environment. For ex: <org_name>-<environment_name > i.e. AVCS-DEV
-  For adding multiple approvers to manage the release, click on the 3 dots.
<img src="/img/blog/5/1.jpg" style="max-height: 300px; float: center;" class="img-fluid" alt="Responsive image">

### Setting-up Environment variables:
- Go to your Azure project > Pipelines > Library > Variable Group
<img src="/img/blog/5/2.jpg" style="max-height: 300px; float: center;" class="img-fluid" alt="Responsive image">
- Name of the variable group should follow a specific syntax: <org_name>-config-<environment_name>, i.e.: AVCS-config-DEV.
- Navigate to variable section(see the screenshot below) and create a new variable named as authURL
with value SfdxAuth Url (force://PlatformCLI::<encrypted_token>@business-ruby-2985-dev-
ed.cs73.my.salesforce.com) copied from the previous step.
<img src="/img/blog/5/3.jpg" style="max-height: 300px; float: center;" class="img-fluid" alt="Responsive image">

### Adding the YAML file in Repository (GIT)
Download the yml templates below and copy them in the root directory of your project repository. Make sure
that the sfdx-deploy,yml is added under the "templates" folder.

<pre class="line-numbers">
<code class="language-yml">
# File: azure-pipelines.yml
stages:
- stage: Build
  jobs:
  - job: Build
    pool:
      vmImage: 'macOS-10.14'
    steps:
    - task: CopyFiles@2
      inputs:
        SourceFolder: '$(Build.SourcesDirectory)'
        Contents: '**'
        TargetFolder: '$(Build.ArtifactStagingDirectory)'
      displayName: "Copy $(sourceFolder) to artifact staging directory"
    
    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(Build.ArtifactStagingDirectory)'
        ArtifactName: 'app'
        publishLocation: 'Container'
      displayName: "Publish Azure artifact"
########DEV#######################
- stage: Deploy_DEV
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/master'))
  jobs:
  - template: templates/sfdx-deploy.yml 
    parameters:
      authUrl: $(brocode-dev-authurl) 
      targetEnv: 'brocode_dev_ed'
      config: brocode-config
      compareWith: 'origin/master'
      testlevel: 'NoTestRun'
########SIT#######################
- stage: Deploy_SIT
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/master'))
  jobs:
  - template: templates/sfdx-deploy.yml  
    parameters:
      authUrl: $(brocode-sit-authurl) 
      targetEnv: 'brocode_sit_ed'
      config: brocode-config
      compareWith: 'origin/master'
      testlevel: 'RunLocalTests'
########UAT#######################
- stage: Deploy_UAT
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/release'))
  jobs:
  - template: templates/sfdx-deploy.yml  
    parameters:
      authUrl: $(brocode-uat-authurl) 
      targetEnv: 'brocode_uat_ed'
      config: brocode-config
      compareWith: 'origin/master'
      testlevel: 'RunSpecifiedTests'
</code>
</pre>


<pre class="line-numbers">
<code class="language-yml">
# File: templates/sfdx-steps.yml
parameters: 
  authUrl: ''
  targetEnv: ''
  config: ''
  compareWith: 'origin/master'
  testlevel: ''

jobs:
- deployment: ${{ parameters.targetEnv }} # only alphanumeric plus underscores allowed, may not start with a number
  displayName: ${{ parameters.targetEnv }} #friendly name
  variables:
  - group: ${{ parameters.config }}
  pool:
    vmImage: 'Ubuntu-16.04'
  ###### creates an environment if it doesn’t exist
  environment: ${{ parameters.targetEnv }}
  strategy:
    ###### default deployment strategy
    runOnce:
      deploy:
        steps:
        - task: DownloadBuildArtifacts@0
          inputs:
            buildType: 'current'
            downloadType: 'single'
            artifactName: 'app'
            downloadPath: '$(System.ArtifactsDirectory)'

        - task: UseNode@1
          inputs:
            checkLatest: true
          displayName: "Node 10.x install"

        - script: |
            npm install -g sfdx-cli
          displayName: "npm install sfdx-cli"

        - script: |
            echo ${{ parameters.authUrl }} > credentials.txt
            sfdx force:auth:sfdxurl:store -f credentials.txt -a $(Environment.Name)
          displayName: "Authorise sfdx"
        
        - script: |
            cd "$(System.ArtifactsDirectory)/app"
            echo sfdx force:mdapi:deploy 
            sfdx force:mdapi:deploy -d ./src -u $(Environment.Name) -l ${{parameters.testlevel}} -w 600 -c
          displayName: "sfdx deploy"


</code>
</pre>
<img src="/img/blog/5/3.jpg" style="max-height: 300px; float: center;" class="img-fluid" alt="Responsive image">
