board = [None, None, None, None, None, None, None, None, None]

def print_board():
    print board[0:3]
    print board[3:6]
    print board[6:9]

def win_by_diagonal(mark):
    return (board[0] == mark and board[4] == mark and board[8] == mark) or (board[6] == mark and board[4] == mark and board[2] == mark)

def make_mark(mark, space):
    board[space] = mark
    print_board()
    if win_by_diagonal(mark):
        print mark + ' Wins!'
