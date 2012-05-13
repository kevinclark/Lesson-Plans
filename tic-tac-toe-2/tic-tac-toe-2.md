# Teaching the computer to play tic tac toe

Today, we're going to take an existing tic tac toe game and teach the
computer to play with us.

The tic tac toe implementation is based on the version written [here](https://github.com/kevinclark/Lesson-Plans/tree/master/tic-tac-toe).
It's been extended to handle turns, and validating moved, and to make it
easy to write a computer controlled player.

If you'd like to follow along, or move ahead, the lesson plan can be
found [here](https://github.com/kevinclark/Lesson-Plans/blob/master/tic-tac-toe-2/tic-tac-toe-2.md).


### Prereqs - Installing Python and getting the game code


#### Downloading code

To download the game we'll be basing our code on, please download and extract the zipfile located [here](https://github.com/kevinclark/Lesson-Plans/zipball/master).


#### Windows

On windows, download and run the python 2.7 installer from
http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi

After running the installer:

1. Choose 'Install for all users', and click Next.
2. Leave the default directory selected 'C:\Python27\', and click Next.
3. Leave all options selected, and click Next.
4. Click Yes if you get a User Account Control prompt asking for
   permission to install software.
5. Click Finish
6. Click Yes to restart your computer.


#### Mac OSX

Mac OSX has python built in.



### Starting the interpreter and basics

On mac, you're going to open the python interpreter by hitting
command-space, typing terminal, and hitting enter. Then you're going to
type 'python -m idlelib.idle' and hit enter.

On windows, you're going to open the python interpreter by hitting the
windows key, typeing 'idle', and hit enter.


This part will be familiar for some of you. I'm going to go over some
basics, but there will be new stuff too that you'll want to use to
control your computer player.

This screen that you've brought up is called the 'interpreter'. Just
like an interpreter might help you talk to someone who speaks Spanish,
or Dutch, or Swahili, this window helps you talk to the computer using a
language called Python. Think of this like a chat window. You type
something, and hit enter, and python responds.

```
>>> 5
5
```

If I give python a number, it will reply with that number. It already
knows arithmetic:

```
>>> 3 + 4
7
```

Go ahead and try putting in some numbers and see what happens.

One thing that might happen when you type things in is that you may make
a mistake. Don't worry when that happens - you can always try again. So
don't be afraid to try things on your own. Experimenting is part of the
fun.

So far we've only given python numbers. If I give it a sequece of
letters, this happens:

```
>>> kevin

Traceback (most recent call last):
  File "<pyshell#152>", line 1, in <module>
    kevin
NameError: name 'kevin' is not defined
```

This is python's way of telling me it doesn't know the word 'kevin'.

If I want it to understand that I mean the sequence of characters 'kevin' and that
it's not the name of something, I need to put quotes around it.

```
>>> 'Kevin'
'Kevin'
```

It puts quotes around the result because it's indicating that it's
replying with a group of characters. We call that a string.

Another thing python understands is lists. If I wanted to make a list of
ice cream flavors I like, I'd do it like this:

```
>>> ['chocolate', 'vanilla', 'cookies and cream']
['chocolate', 'vanilla', 'cookies and cream']
```

Sometimes we number things in lists - python does this too. But python
numbers lists starting with zero. So if we looked at the numbers python
gave the items in my list of ice cream flavors, it would look like this:

0. 'chocolate'
1. 'vanilla'
2. 'cookies and cream'

When we want to find what item is at a place in the list, we use the
square brackets and give the position we want to lookup:

```
>>> ['chocolate', 'vanilla', 'cookies and cream'][1]
'vanilla'
```

For those of you that have been to the other python sessions, everything
so far is something you've seen. Now we're going to talk about one new way to
store information today - a dictionary.

The dictionaries we use at home and school and work hold words and their
meanings. If you lookup the word 'cat' in the dictionary, you find that
it's small animal with fur and claws. Dictionaries in python are
similar. If I wanted to make a dictionary of animals, I might do it like
this:

```
>>> {'cat': 'a small furry animal with claws'}
{'cat': 'a small furry animal with claws'}
```

We create a dictionary using the curly braces. This dictionary has one
entry - 'cat'. If we want to look up what cat points to, we use the
square brackets, just like with lists. But this time, instead number of
the item in the list, we give the thing we're trying to look up. That
thing is called a 'key'.

```
>>> {'cat': 'a small furry animal with claws'}['cat']
'a small furry animal with claws'
```

Just like with lists, we can have more than one thing in a dictionary by
using commas.  If I wanted a dictionary of my favorite things, I might do it
like this:

```
>>> {'food': 'pizza', 'color': 'blue'}
{'food': 'pizza', 'color': 'blue'}
```
