# chef-repo-ci
### CI helper scripts for pipelining a chef-repo git workflow

## Background

I'm currently using gitlab to host a private chef-repo. Using the gitlabCI
I'm triggering verification and pre-check

## Using

Trigger this from your CI build on merges to master, or validation of changes in a branch. Feed
it the output of git diff --name-status SHA1 SHA2

While I've only implemented the push actions so far, I'll add the --verify flag (and actions)
later.

## Extending

Functionality is extended by including a class in the ChefObjects module. The class (per type
of object) includes a SELECTOR regex constant which is applied to each candidate file in turn
until a matching class is found.

Classes can implement any module which matches a git action (addition, deletion, etc). We'd want 
to support all of the possible git status flags, so write a method in each class that performs
the corresponding required action. Taken from the git-diff manpage:

       Possible status letters are:

       o   A: addition of a file

       o   C: copy of a file into a new one

       o   D: deletion of a file

       o   M: modification of the contents or mode of a file

       o   R: renaming of a file

## Patches welcome

Fork it, add some tests under spec/unit, submit a pull request.

