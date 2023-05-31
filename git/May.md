## 11 May
Push changes of RPVerif to github using `git commit -a` and an error occurred!

And my contribution is gone.
![ooops.png](img/May/ooops.png "an error occurred!")

## 12 May
### Get the number of lines added and deleted by an author
In git bash,

  - in a repository

		git log --author="lucien98" --pretty=tformat: --numstat| 
		 awk '{ add += $1; subs += $2; loc += $1 - $2 } END \
		 { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -;

  - in a paticular day

		git log --author="lucien98" --pretty=tformat: --since==2023-05-10 --until=2023-05-10 --numstat |
		 awk '{ add += $1; subs += $2; loc += $1 - $2 } END\
		  { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -;

  - all authors

		git log --format='%aN' | sort -u | 
		while read name; 
			do 
				echo "$name\t"; 
				git log --author="$name" --pretty=tformat: --since==2023-05-10 --until=2023-05-12 --numstat |
				 awk '{ add += $1; subs += $2; loc += $1 - $2 } END\
				  { printf "added lines: %s, removed lines: %s, total lines:%s\n", add, subs, loc }' -; 
			done

## 17 May
### create a pull request
When I inadvertently used `git push -u origin Main`, the reomte repository in github would have a branch name `Main`. Github gives me a note `Main had recent pushes about 1 hour ago [Compare & pull request]`, and I click the `[Compare & pull request]` then I get a page `create a pull request`. Now I mark it so later I'll figure out what this is about.

### pull requests
  - open: `Lucien98` wants to merge 1 commit into main from Main
  - add more commits by pushing to the Main branch on Lucien98/MasterThesis
  	+ require approval from specific reviewers before merging
  	+ continuous integration has not been set up
  	+ This branch has no conflicts with the base branch
  		* `[merge pull request]`
  - `[Confirm merge]`
  - presss `revert` will create a new branch


### branch protection rule
defines whether collaborators can delete or force push to the branch and set requirements for any pushes to the branch, such as passing status check or a linear commit history.

## 18 May
Yesterday, I inadvertently create a new branch `Main`, when I tried `git pull`, I got these

 	E:\>git pull
 	remote: Enumerating objects: 11, done.
 	remote: Counting objects: 100% (11/11), done.
 	remote: Compressing objects: 100% (3/3), done.
 	remote: Total 6 (delta 3), reused 5 (delta 3), pack-reused 0
 	Unpacking objects: 100% (6/6), 4.34 KiB | 134.00 KiB/s, done.
 	From github.com:Lucien98/MasterThesis
  	+ [new branch]      main       -> origin/main
 	Your configuration specifies to merge with the ref 'refs/heads/Main'
 	from the remote, but no such ref was fetched.

I am in the `Main` branch, but I can't see `main` branch in Main

 	E:\>git branch
 	- Main
   	chapterbib
	
	So I switch to `main`
	
 	E:\>git switch main
 	Switched to branch 'main'

and see there are two more branches:

 	E:\>git branch
   	Main
   	chapterbib

I tried `git pull`, but `There is no tracking information for the current branch.` (Why?
Why didn't the map between `origin/main` and local `main` established)


 	E:\>git pull
 	There is no tracking information for the current branch.
 	Please specify which branch you want to merge with.
 	See git-pull(1) for details.
	
     	git pull <remote> <branch>
	
 	If you wish to set tracking information for this branch you can do so with:
	
     	git branch --set-upstream-to=origin/<branch> main


Then I did what the hints tells me to do, and I succeeded.

 	E:\>git branch --set-upstream-to=origin/main main
 	Branch 'main' set up to track remote branch 'main' from 'origin'.
 	
 	E:\>git pull
 	Updating 28d22d4..78f5f6e
 	Fast-forward
  	Tex/oral_defense.tex | 494 ++++++++++++++++++++++++++++++++++++---------------
  	1 file changed, 348 insertions(+), 146 deletions(-)
### notes
  - `There is no tracking information for the current branch.`
  - `Branch 'main' set up to track remote branch 'main' from 'origin'`