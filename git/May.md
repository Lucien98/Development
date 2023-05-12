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

