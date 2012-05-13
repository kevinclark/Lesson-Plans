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

* 0 - 'chocolate'
* 1 - 'vanilla'
* 2 - 'cookies and cream'

When we want to find what item is at a place in the list, we use the
square brackets and give the position we want to lookup:

```
>>> ['chocolate', 'vanilla', 'cookies and cream'][1]
'vanilla'
```

For those of you that have been to the other python sessions, everything
so far is something you've seen. Now we're going to do a couple new
things.

If we want to find out if something is in the list or not,
we can ask python with the word 'in'.

```
>>> 'chocolate' in ['chocolate', 'vanilla', 'cookies and cream']
True
>>> 'cheese' in ['chocolate', 'vanilla', 'cookies and cream']
False
```

'in' is going to help us figure out where the computer should go when it
plays tic tac toe, so remember it.

Now we're going to talk about one new way to store information - a dictionary.

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

This is more than I'd like to type out over and over, so I'm going to
give it a shorter name. I can do that with the single equals sign. On
the left goes the name I want to give the thing on the right:

```
>>> favs = {'food': 'pizza', 'color': 'blue'}
{'food': 'pizza', 'color': 'blue'}
>>> favs['color']
'blue'
```

### Running the Game

Now that we know how to talk to the computer, let's get to the game.
First, we need to open the file that explains how to play. Click on
File, then Open, then find the tic-tac-toe-2 directory in the bundle you
downloaded from the web. Finally, click on `tictactoe2.py` and then
open.


There's a lot of stuff in here, but we're only going to worry about the
code at the very top - the block that says 'def computer_player'. That
section is the code that is run when it's time for the computer to play.
Think of it as the place where we can list instructions for how it
should make its decision.

Before we talk about how that works, you should play the game. To do
that, open the Run menu and click Run Module. It should open the
interpreter again, and ask you to play. Make sure to click on the
interpreter window when this happens or you'll still be in the other
window. If it opens the interpreter and doesn't print the board, make
sure you're clicked on the interpreter and hit the enter key and then
the board should show up. You can play by putting in the number of the
square you'd like to make a mark in.

[Ed note: Here I'm going to remind them about our numbering scheme
(which is mentioned in the file) and demonstrate how to play on the
board. ]


You probably noticed that the computer isn't very good at tic tac toe.
Let's look at how it's making decisions. As I said before, it's
controlled by this thing labeled 'computer_player' in our game file.
That thing is called a function, and it's the instructions for choosing
where the computer player is going to make a mark. When that runs, it's
given a dictionary that explains what the world looks like. Let's print
out the 'world' so we can understand what information it has to make a
decision. To do this, type this line underneath 'def computer_player':

```
print world
```

Make sure to hit tab to indent it to line up with the line that starts
with 'return'.

When you're done, go back to 'Run' and click 'Run Module'. It will ask
you to save - say OK. Go ahead and start playing again. Now you should
notice that when the computer goes, a line like this shows up:

```
{'xs': [4], 'os': [], 'empty': [0, 1, 2, 3, 5, 6, 7, 8]}
```

This is a dictionary that describes our game world. 'xs' points to the
list of spaces where the X player has gone. 'os' points to the list of
spaces where the 'O' player has gone. And 'empty' points to the list of
spaces where nobody has gone.

If we look back at what 'computer_player' is doing, it's a combination
of things we learned about before:

```
    return world['empty'][0]
```

'return' is our way of telling python that it should stop running the
current function and give the thing to the right of return to whatever started it.
We call that the 'result' of the function. In our case, the result is
what we get when we lookup the 'empty' key in the world dictionary
(which will be the list of empty spaces), and then look up the item in
the 0th space (the front) of the list. In steps, it goes like this
(reading from left to right):

`world` looks like:
```
{'xs': [4], 'os': [], 'empty': [0, 1, 2, 3, 5, 6, 7, 8]}
```

To the right of `world` is square brackets with 'empty' in them, so the
result of that lookup is going to be the list:

```
[0, 1, 2, 3, 5, 6, 7, 8]
```

To the right of that is another set of square brackets with a 0 in it.
So it's just like doing:


```
[0, 1, 2, 3, 5, 6, 7, 8][0]
```

And that's going to be the first item in the list - in this case, 0.

So that's the whole strategy for the current computer player - it makes
a mark in the first place it can. That makes it really bad at defense,
so not much of an opponent. We'd like it to be able to put up a
challenge, so it should respond to what we're doing.


