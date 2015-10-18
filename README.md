# chef-repo-ci
CI helper scripts for pipelining a chef-repo git workflow

I'm currently using gitlab to host a private chef-repo. Using the gitlabCI
I'm triggering verification and pre-check

I'd also like to be able to use a Berksfile to drive the creation of 
new CI jobs to publish each (internal) cookbook from source

Functionality is extended by including a class in the ChefObjects module. The class (per type
of object) includes a SELECTOR regex constant which is applied to each candidate file in turn
until a matching class is found.

Classes can implement any module which matches a git action (modify, delete, etc)