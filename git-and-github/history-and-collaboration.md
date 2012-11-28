Follow commands and github references by in large are in reference to github/teach.github.com

#Git Log
Git log is a super valuable tool when keeping track of your project. From just getting
a summary of who commited lately, to what was specifically commited, to even investigating
for particular changes -- git log can be used to tell us many things.


##Basics
Starting out, it's important to understand how we can limit the number of commits that we
are shown. In some bigger projects there can be hundreds or thousands of commits, and most
of those we don't care about.

* `git log -1` or `git log -15`

When we specify a dash and then a number, that tells `log` how many recent commits should
be returned to us. If we think of `git log` as a way to look back in time, the ordering
of these commits returned makes sense to be from most recent to oldest.

* `git log --pretty=oneline` or (oneline, short, medium[default], full, fuller, email, raw)
  * format the way you want to view your logs

Now that we can control how many commits we see by number, we can focus on some actual
content within the commits.

##Viewing Content

* `git log --stat`
The `--stat` flag is useful in cases of wanting to know which files were affected in
a particular commit.
```
[/github/teach.github.com]$ git log --stat
commit 5c6d6f89e5f1d4137faf2af31275456dbb8cd166
Author: brntbeer <brent.beer@gmail.com>
Date:   Fri Nov 23 17:16:56 2012 -0800

    fixed path for example hooks

 examples/_posts/2001-01-01-example-hooks.md |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
```
This gives us a bit higher view of what we're actually dealing with in terms of how many
lines were changed in a commit. So we know there was an one line change to this particular
file, but we don't actually know what this change involved. To view this, we need to see
the commit's patch.

* `git log -p`

```
[/github/teach.github.com]$ git log -p
commit 5c6d6f89e5f1d4137faf2af31275456dbb8cd166
Author: brntbeer <brent.beer@gmail.com>
Date:   Fri Nov 23 17:16:56 2012 -0800

    fixed path for example hooks

diff --git a/examples/_posts/2001-01-01-example-hooks.md b/examples/_posts/2001-01-01-example-hoo
index 217e87e..78957e7 100644
--- a/examples/_posts/2001-01-01-example-hooks.md
+++ b/examples/_posts/2001-01-01-example-hooks.md
@@ -2,7 +2,7 @@
 layout: exampleswithrelated
 title: Git Hooks
 description: An example of hooks and their power for lifecycle driven activities with Git.
-path: examples/_posts/2001-01-01-example-hooks.md
+path: examples/hooks/
 examples: post-receive-email-SMTP.py
 tags: [example, code]
 ---
```
The patch here shows us the specific file that was changed and what that change was
because there had only been one file changed in this commit. This is a small change, but
we see there was one line removed, and another almost identical line was inserted in it's 
place.

* `git log --word-diff`
  * if only a particular place in a line was changed, show that in-line

Now that we can see specific changes in a commit, how do we find a specific commit? One
way to do so would be with the `--grep` flag.

##Filtering results

* `git log --grep="add"`
`--grep` is used just like you'd use it from the command line, you have to say
specifically what you'd want to search for. When we use a term to grep for, we're only
going to search the log for that term in the commit message itself. This is one example
of why a descriptive commit message could be super useful (besides just allowing friends
or coworkers to see what you're up to without reading your code.

* `git log --diff-filter=R` needs `-M` or `-C` etc
  * find commits with only particular things, like renames
  * Matthew once committed a bunch of renames without fixing links, to find out what the files
    were and renamed to, I used this in corrdination with `--author="matthew"`

* `git log --since="2 weeks ago"
  * grab all the commits that happened between now and 2 weeks ago
* `git log --before="2 weeks ago"
  * grab commits that happened from 2 weeks ago and OLDER
* `git log 6cb8fdd...9c014a9` ie: all logs AFTER `6cb8fdd` until `9c014a9`
  * Similar to github.com/user/repo/compare/master@{2.weeks.ago}...master

* `git log --author="brent"`
  * find commits only authored by a given person


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
