board = [None, None, None, None, None, None, None, None, None]

def print_board():
    print board[0:3]
    print board[3:6]
    print board[6:9]

def win_by_diagonal(mark):
    return (board[0] == mark and board[4] == mark and board[8] == mark) or (board[6] == mark and board[4] == mark and board[2] == mark)

def win_by_vertical(mark):
    return (board[0] == mark and board[3] == mark and board[6] == mark) or (board[1] == mark and board[4] == mark and board[7] == mark) or (board[2] == mark and board[5] == mark and board[8]== mark)

def win_by_horizontal(mark):
	return (board[0] == mark and board[1] == mark and board[2] == mark) or (board[3] == mark and board[4] == mark and board[5] == mark) or (board[6] == mark and board[7] == mark and board[8] == mark)

def validate_move(space):
    if space < 0 or space > 8:
        print "I don't understand how to make a mark at space %s" % space
        return False
    if board[space] is not None:
        print "%s has already gone there!" % board[space]
        return False
    return True

def prompt_for_space():
    space = None
    
    try:
        space = int(raw_input("Give me a space number from 0 to 8 (and then hit enter): "))
    except ValueError:
        print "That's not a number."
        return prompt_for_space()

    if not validate_move(space):
        return prompt_for_space()
    
    return space


def human_players(mark):
    print "It's %s's turn - where would you like to play, %s?" % (mark, mark)
    return prompt_for_space()


def play(mark='X', takeTurn=human_players):
    print "\nThe board looks like this:"
    print_board()
    print


    space = takeTurn(mark)               
    board[space] = mark

    if win_by_diagonal(mark) or win_by_horizontal(mark) or win_by_vertical(mark):
        print "%s wins! Good job!" % mark
        print
        print_board()
    elif not [space for space in board if space is None]:
        print "It's a draw!"
    else:
        play('O' if mark == 'X' else 'X')    

play()
