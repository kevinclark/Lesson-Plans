The following commands and GitHub references by in large are in reference to <https://github.com/brntbeer/teach.github.com>
unless otherwise specified.

To follow along: `git clone https://github.com/brntbeer/teach.gitub.com` and navigate
into the project from your terminal.

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

Seeing the commits and their messages can be pretty important, but we can also format
these commits to give us more of less information.

* `git log --pretty=oneline` or (oneline, short, medium[default], full, fuller, email, raw)

`--pretty=` will allow us to vary the control of what our commit messages show. By
default `git log` uses `medium`, but we can see that with `oneline` or `short` we can
change what kind of embedded information we are presented with. For instance, if I
didn't want to see committer, author, or date information and only cared about the
subject of a commit message (first line), oneline is clearly best. However, if I have a
more complicated project and want to see both authored date and commit date, I'd want
to use `fuller`. The commit date is the date that is shown by default with `medium`, but
depending on different types of collaboration, your commit may have actually been
authored many days previous [Ed Note: If I made a commit, created a Pull request, and
had that pull request accepted 3 days later, the difference in authored and commit date
would be 3 days]

Now that we can control how many commits we see, and what level of detail we see in the
summary, often we want to filter these results even more before we start digging through
content.


##Filtering results

* `git log --author="brent"`
  * find commits only authored by a given person

* `git log --grep="add"`

`--grep` is used just like you'd use it from the command line, you have to say
specifically what you'd want to search for. When we use a term to grep for, we're only
going to search the log for that term in the commit message itself. This is one example
of why a descriptive commit message could be super useful (besides just allowing friends
or coworkers to see what you're up to without reading your code).
  * Grep will even look at words you're not actually seeing (pretty=short but word exists
  in the message body, still finds it!)

_Bonus Online Material_
* `git log --since="2 weeks ago"
  * grab all the commits that happened between now and 2 weeks ago
* `git log --before="2 weeks ago"
  * grab commits that happened from 2 weeks ago and OLDER
* `git log gh-pages@{2.weeks.ago}...gh-pages`
  * Similar to github.com/user/repo/compare/master@{2.weeks.ago}...master

* `git log --diff-filter=R` (needs `-M` or `-C` etc for renames)

The `diff-filter=` command is super useful when you're wanting to find commits that did
specific things. Some of the more common flags are: Added (A), Copied (C), Deleted (D),
Modified (M), Renamed (R). The Rename or Copy flag are ones that I've found particularly
useful due to the simple nature of finding commits with only renames.

One specific example of when I've had to filter on a rename was a few weeks ago for our
teach.github.com repo when I had noticed a few links were not working as intended.
It had seemed the pages those links were pointing to no longer existed, and I had a hunch
that they were simply renamed. By using `--diff-filter=R -M` I was able to more
appropriately get an idea of which commits included those renames. Using an additional
flag of `-p` allows me to actually see those renames.


##Viewing Content

* `git log -1 --stat`

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

* `git log -1 -p`

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

* `git log -1 -p --word-diff`

```
[/github/teach.github.com]$ git log -1 -p --word-diff
commit 5c6d6f89e5f1d4137faf2af31275456dbb8cd166
Author: brntbeer <brent.beer@gmail.com>
Date:   Fri Nov 23 17:16:56 2012 -0800

    fixed path for example hooks

diff --git a/examples/_posts/2001-01-01-example-hooks.md b/examples/_posts/2001-
index 217e87e..78957e7 100644
--- a/examples/_posts/2001-01-01-example-hooks.md
+++ b/examples/_posts/2001-01-01-example-hooks.md
@@ -2,7 +2,7 @@
layout: exampleswithrelated
title: Git Hooks
description: An example of hooks and their power for lifecycle driven activities
path: [-examples/_posts/2001-01-01-example-hooks.md-]{+examples/hooks/+}
examples: post-receive-email-SMTP.py
tags: [example, code]
---
```

We can see with `--word-diff` that Git actually knows this change was really changing
that same line.


#GitHub Collaboration
[Ed Note: `git checkout collaboration-testing` before running through these examples, as
some of these only exist on that branch from @brntbeer's repo]

Collaborating on a project is incredibly important when working with other team
members or other developers in general. I think it's super useful to send pull requests
often, especially when I'm working on a repository that isn't my own. This allows me to
not step on anyones toes, even if I have access to push to that repository. This is my
prefered method of collaboration with any project I'm working on.


## Issues
* File an issue
  * Issue structure: assigned to, milestone, labels

  As the name suggest, issues are often used to file about things that are wrong or things
  that are broken. But this doesn't have to always be the case, it can be used as a project
  management tool to track progression towards a larger milestone as well as what someone
  is specifically working on. In the past I would often create issues of my daily or weekly
  items and assign them priority tags and work towards a milestone for the end of a sprint.

  * Fill out the issue's message. @reply to someone on it

  Using mentions to get someone's specific attention can be useful. You can do this with
  a bit of auto-completion and the `@` symbol. This is perfect for getting some peer
  review from someone who may otherwise not be watching for updates on this repo or if you
  know a section of your code affects them.

* Comment on the issue

Once this issue is filed, we can see comments on the thread as they come in and really
give us a sense of the conversation that's happening.

* reply to the issue with a sha1 hash complaining that commit broke something
  * show that it links

  Mention an entire commit from anywhere a comment is allowed helps tie things together
  nicely. We can see this if we dig out an old commit hash from `git log` and paste it
  into a comment box.

* ask specifics about the commit

Although this commit may help to give us additional context to where an issue actually
is, we may not know the specifics about the issue that's be filed. Thats where line
linking can come into play. After a bit of conversation back and forth it may be
easiest to just say, "Take a look at these lines here, this is the broken part" and
link to the actual file:
<https://github.com/brntbeer/teach.github.com/blob/gh-pages/stylesheets/page.css#L1-4>

* close issue from commit message.

Once we see where the actual problem is at, we can create a commit and close this issue.
We can see if we look for previous commits with `--grep="Close"` that there is already
at least 1 commit that closed an issue.

## Pull Request
Pull-request work very similarly to issues. Except, instead of just starting a discussion
you're actually putting some code behind it. Code speaks louder than words. Also, an
issue is filed when you create a pull-request because of how closely they are related
to one another.

* Can reference other issues it may fix from the comments/message as well
  * link to an open issue and see the mention on the issue from this pull request

  Maybe you're creating a pull-request to knock out a few issues. In doing so, you
  can refer to those issues in your initial pull-request. When we do this, we can go
  look at those issues and see that they all get updated with links to the pull-request
  because they were mentioned. This is just one way that GitHub helps tie everything
  together and ensure that if you want to preserve historical references and your
  mindset, you can.

* additional commits after some comments are rolling.

When we have our pull-request filed, we may get some comments about it either giving
us support, or requesting some additional changes. Let's assume we get asked for
some fixes.

When we make these fixes and push to our branch, we don't need to re-submit a
pull-request. The commits are put right there in line with the comments, really
keeping up as items of the conversation.

* Comment on a commit and see it pulled to the pull request discussion

One of these new commits may get the attention of someone not watching the pull-request.
In that case, they may comment on that commit itself (either line comment or full commit
comment). When they do this, even though it's not in the pull-request, the comment is
pulled to the pull-request ensuring all the conversation is in one location.

* Fix the section commented on and see it become an "Outdated diff"

Sometimes, I'll receive feedback requesting I change some of my fixes. This isn't a
problem, but what happens to the context of what needs fixed once it already is? You may
already know that a pull request will update as new commits come in, but we don't want
to forget that useful conversation about the newer commits. GitHub will actually store
those commits and hide it from the current context. <https://github.com/brntbeer/teach.github.com/pull/3>
