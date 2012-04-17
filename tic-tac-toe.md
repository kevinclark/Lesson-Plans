# Tic tac toe and python

Today we're going to teach our computers to help us play tic tac toe
with each other. To do it, we're going to use a programming language
called 'python'. Programming languages are the way humans tell
computers what to do and how to do it.

### Installation

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

On mac with Lion or Snow Leopard, you're going to open the python 
interpreter by hitting command-space, typing terminal, and hitting 
enter. Then you're going to type 'idle' and hit enter.

On mac with Leopard, you're going to open the python 
interpreter by hitting command-space, typing terminal, and hitting enter.
Then you're going to 'python -m idlelib.idle' and hit enter.

On windows, you're going to open the python interpreter by hitting the
windows key, typeing 'idle', and hit enter.


This is how we're going to interact with the computer. It's sort of like
a chat window. We type in something and it replies:


```
>>> 5
5
```

If I give it a number, it'll reply with that number. It can handle
arithmetic:

```
>>> 3 + 4
7
```

One thing you should know is that it's ok if you make mistakes in this
program. If you do, it try to tell you about the mistake, and you can
do it again. So don't be afraid to try things on your own. Experimenting
is part of the fun.

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
replying with a group of characters. We call that a string. If we want
to print the value of the string, you use the word 'print' with a string
in quotes. Go ahead and print your name:

```
>>> print 'Kevin'
Kevin
```

Just like you can add numbers together, you can add strings together
too. Try putting two words together, like this:

```
>>> "Hello" + "world"
'Helloworld'
```

Notice that it doesn't put a space in for you - you'd need to do it
yourself:

```
>>> "Hello " + "world"
'Hello world'
```

Another thing python understands is lists. For example, if I wanted to
make a list of the names of the creatures in my house, I'd do this

```
>>> ["Ada the Dog", "Ella the Cat", "Kevin the Human"]
["Ada the Doc", "Ella the Cat", "Kevin the Human"]
```

Just like we sometimes number lists, so does the computer. It numbers
like this.

0. "Ada the Dog"
1. "Ella the Cat"
2. "Kevin the Human"

When we want to find out what's at a certain number, we can ask with
square brackets:

```
>>> ["Ada the Dog", "Ella the Cat", "Kevin the Human"][1]
"Ella the Cat"
```

With those basics, let's play some tic tac toe.



### Implementing Tic Tac Toe


Quick review of how to play. A tic tac toe board looks like this:


```
  |  |  
--------
  |  |
--------
  |  |

```

Two people play by taking turns making marks (Xs and Os generally) in
the 9 spaces. Someone wins when they get 3 in a row. If nobody gets 3
in a row and the board is filled, the game is a tie.

When playing the game, we usually just draw on the board itself, but we
could just as easily keep a list of where marks have been made. If we
just number the squares:


```
0 |1 |2
--------
3 |4 |5
--------
6 |7 |8

```

So instead of marking an X or O in the square itself, we'd just update
the list in the right place. So let's do that. Create a list of 9 spaces
for the board. Each space is going to be empty initially - we'll use the
None value to do that:

```
>>> [None, None, None, None, None, None, None, None, None]
[None, None, None, None, None, None, None, None, None]
```

It's a little tiring writing the full list out each time, so let's give
it a name. We can do that by using the equals sign. A single equals sign
makes the name on the left hand side point to the thing on the right
hand side. Go ahead and name the list 'board'.

```
>>> board = [None, None, None, None, None, None, None, None, None]
```

You can make a name refer to different things at different time, so we
call it a 'variable'. It varies. You'll notice that when you assign a
variable, python doesn't respond with anything. There's no result in an
assignment. But you can find out what's in a variable by using its name.

```
>>> board
[None, None, None, None, None, None, None, None, None]
```

Now that we've got a board, we need to be able to mark it. If you want to update
the board, you can do it like this:

```
>>> board[4] = "x"
```

You can read this like 'the board at item 4 is assigned "x"'. If you ask
for the board now, you'll see it's changed:

```
>>> board
[None, None, None, None, 'x', None, None, None, None]
```

So now we've got a board and can make changes to it, but it doesn't
really look much like tic tac toe. We want the board to be three rows
of three.

We can do that by printing the first three items, then the second three, then
the last three.

To do this, we can 'slice' up the list. This looks a lot like accessing
an item in the list.

```
>>> board[0:3]
[None, None, None]
```

The first number in the brackets is the space to start at and the second
number is the boundary. You can read this as "the items in the board
from 0 up to 3". The boundary isn't included, so it's always going to be
past the actual spaces you're going to get back. So to print the three
rows of the board, do it like this:

```
>>> print board[0:3]
[None, None, None]
>>> print board[3:6]
[None, 'x', None]
>>> print board[6:9]
[None, None, None]
```

This is more usable - it looks a little like a board. But having to
print each of the rows by hand is slow. Let's let python do that for us.
A group of instructions is like a recipe for the computer. We call them
functions, and we'll use the 'def' word to define one.
It will need a name, so let's call it 'print_board'.

(Note: we'll need to mention the indentation when they're typing it)

```
>>> def print_board():
      print board[0:3]
      print board[3:6]
      print board[6:9]

```

If we ask python about print_board, it will tell us that it's a
function.

```
>>> print_board
<function print_board at 0x10a15f230>
```

To tell python to run the function, use parenthesis:

```
>>> print_board()
[None, None, None]
[None, 'x', None]
[None, None, None]
```

Go ahead and add some more marks and print the board:

```
>>> board[0] = 'x'
>>> board[8] = 'x'
>>> print_board()
['x', None, None]
[None, 'x', None]
[None, None, 'x']
```

This is better than before, but the computer doesn't know about winning
and losing yet, which means this isn't much of a game. Let's think about
when someone wins. Someone wins when they have the same mark in 3 spaces
in a row. How do we tell if two spaces have the same mark? We'll use the
double equals sign to check for equality. Notice that this is different
than the single equals sign which we used for assignment. Double equals
works like this:

```
>>> 1 == 1
True
>>> 1 == 2
False
```

You can also use the words 'and' or 'or' to make bigger comparions like this:

```
>>> 1 == 1 and 3 == 3
True
>>> 1 == 2 and 3 == 3
False
>>> 1 == 2 or 3 == 3
True
```

(Pull out the board again so there's numbers accessible)

So if we want to see if the center tile has an 'x' in it, we can just do
like so:

```
>>> board[4] == 'x'
True
```

And, using 'and' and 'or', we can check if the diagonal from the top
left to the bottom right has the same mark by making a larger check:


```
>>> board[0] == 'x' and board[4] == 'x' and board[8] == 'x'
True
```

If we make the same check for the other diagonal, we'll get a different
answer:

```
>>> board[2] == 'x' and board[4] == 'x' and board[6] == 'x'
False
```

We know if we've won on a diagonal if either of these things are True.
We win if we have the same mark on one diagonal OR the other.

```
>>> (board[0] == 'x' and board[4] == 'x' and board[8] == 'x') or (board[6] == 'x' and board[4] == 'x' and board[2] == 'x')
True
```

I put parenthesis around the two parts for the two diagonals. This makes
it clear that it's one set of comparisons OR the other set of
comparisons.

Since we know how to check if a player wins on a diagonal, let's give it a name.
We're going to do this just like with print_board.

```
>>> def win_by_diagonal():
      (board[0] == 'x' and board[4] == 'x' and board[8] == 'x') or (board[6] == 'x' and board[4] == 'x' and board[2] == 'x')
```

Go ahead and run it with parenthesis:

```
>>> win_by_diagonal()
```

And nothing happens. This is a little like asking a robot to bake you a cake, but
forgetting to tell it to give it to you afterwards. Python ran our
function, but never told us what the result was. To do that, let's
re-define win_by_diagonal using the 'return' word. That tells python to
return that value to us when we run the function.

```
>>> def win_by_diagonal():
      return (board[0] == 'x' and board[4] == 'x' and board[8] == 'x') or (board[6] == 'x' and board[4] == 'x' and board[2] == 'x')
```

Now when we run it we get an answer back:

```
>>> win_by_diagonal()
True
```

At this point, if we want to finish describing what a winning board
looks like, we would defin win_by_row and win_by_column just like we did
with diagonals, but we'll leave that for later. Instead, notice what
happens when I mark the board with 'o' instead of 'x':

```
>>> board[0] = 'o'
>>> board[4] = 'o'
>>> board[8] = 'o'
>>> print_board()
['o', None, None]
[None, 'o', None]
[None, None, 'o']
>>> win_by_diagonal()
False
```

This happens because when we defined win_by_diagonal, we checked to make
sure that 'x' was the same in each space. What we really mean is 'is the
mark of the player the same in each space'. So to make python understand
that, we're going to pay attention to the parenthesis I asked you to
ignore earlier. Instead of putting nothing in between them, we're going
to put the word 'mark'. That essentially tells python not to worry about
the fact that it doesn't know what 'mark' means. We're going to tell it
later when we run the function. Instead it can use mark as a
placeholder. So let's redefine the function:

```
>>> def win_by_diagonal(mark):
	    return (board[0] == mark and board[4] == mark and board[8] == mark) or (board[6] == mark and board[4] == mark and board[2] == mark)
```

And now run it by passing in the mark:

```
>>> win_by_diagonal('x')
False
>>> win_by_diagonal('o')
True
```

Neat, right? At this point we can print a board, make changes to it, and
find out if someone has won. But we're still doing it mostly by hand. We
can make this feel a lot more game like by having the computer do more
for us. So let's think about what our steps are so we can tell python:

* The player makes a mark on a space of the board.
* We print the new board.

This is something we already know how to say, so let's group it and give it a name:

```
>>> def make_mark(mark, space):
      board[space] = mark
      print_board()
>>> make_mark('x', 2)
['o', None, 'x']
[None, 'o', None]
[None, None, 'o']
```

This is much better, but 'o' has already won - maybe it should say so.
We know how to check to see if someone has won and we know how to print
a message. Here we need to print a message *if* someone has won. So to
do that, we'll re-define make_mark and use the 'if' word:

```
>>> def make_mark(mark, space):
      board[space] = mark
      print_board()
      if win_by_diagonal(mark):
        print "You win!"
>>> make_mark('o', 1)
['o', 'o', 'x']
[None, 'o', None]
[None, None, 'o']
You win!
```

(Right here we should probably clear the board and show it doing the
right thing from the beginning)

It's not perfect yet. But that's ok - we've gotten a lot closer, and
doing the rest isn't much more complicated. If you want to do more, your
mentors are here to help.
