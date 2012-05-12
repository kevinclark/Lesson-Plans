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

def make_mark(mark, space):
    board[space] = mark
    print_board()
    if win_by_diagonal(mark) or win_by_vertical(mark) or win_by_horizontal(mark):
        print mark + ' Wins!'
