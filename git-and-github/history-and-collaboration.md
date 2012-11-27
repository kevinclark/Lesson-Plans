Follow commands and github references by in large are in reference to github/teach.github.com

#Git Log
* `git log --stat`
  * great for finding out files that were affected in a particular commit
* `git log -p`
  * Shows the full patch of that file, super useful when I want to see what happened
    in that commit instead of just the log message
* `git log -1` or `git log -15`
  * narrows down the total commits you need to look at
* `git log --grep="deploy"`
  * uses grep to search commit messages
* `git log --author="brent"`
  * find commits only authored by a given person
* `git log --pretty=oneline` or (oneline, short, medium[default], full, fuller, email, raw)
  * format the way you want to view your logs
* `git log --word-diff`
  * if only a particular place in a line was changed, show that in-line
* `git log --diff-filter=R` needs `-M` or `-C` etc
  * find commits with only particular things, like renames
  * Matthew once committed a bunch of renames without fixing links, to find out what the files
    were and renamed to, I used this in corrdination with `--author="matthew"`
* `git log --since="2 weeks ago"
  * grab all the commits that happened between now and 2 weeks ago
* `git log --before="2 weeks ago"
  * grab commits that happened from 2 weeks ago and OLDER
* `git log 6cb8fdd...9c014a9` ie: all logs AFTER 6cb8fdd until 9c014a9
  * Similar to github.com/user/repo/compare/master@{2.weeks.ago}...master

* Chaining previous flags together

#GitHub Collaboration
* closing issue from commit messages
  * `git log --grep="fixed"` or `git log --grep="closed"`
* Pull Request
  * Outdated diff link
* Any Comment thread (including a pull request)
  * Mentions ('@matthewmccullough', and auto-completing?)
  * sha1 hash of another commit link (it's smart, it'll automatically detect the sha)
  * referencing another issue link (#15)
    * also updates a message on to that issue saying that it was referenced somewhere else
  * Line linking of a particular file (even at a particular point in time)
