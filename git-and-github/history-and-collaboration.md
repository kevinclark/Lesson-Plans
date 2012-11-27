#Git Log
* `git log --stat`
* `git log -p`
* `git log -1` or `git log -15`
* `git log --grep="deploy"`
* `git log --author="matthew"`
* `git log --pretty=oneline` or (oneline, short, medium[default], full, fuller, email, raw)
* `git log --word-diff`
* `git log --diff-filter=R` needs `-M` or `-C` etc
* `git log --since="2 weeks ago"
* `git log 6cb8fdd...9c014a9` ie: all logs AFTER 6cb8fdd until 9c014a9
  * Similar to github.com/user/repo/compare/master@{2.weeks.ago}...master

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
