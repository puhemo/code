---
title: "Battleship"
date: 2016-06-27 10:0
modified: 2016-06-27
categories:
  - Python
tags:
  - Python Exercise
  - Python 2.x
published: true
excerpt: |
  A simplified, one-player version of the classic board game Battleship!
---
A simplified, one-player version of the classic board game Battleship! In this version of the game, there will be a single ship hidden in a random location on a 5x5 grid. The player will have 10 guesses to try to sink the ship.

## version 1.0

Allow the player to make up to 4 guesses before they lose.

```python
from random import randint

board = []

for x in range(5):
    board.append(["O"] * 5)

def print_board(board):
    for row in board:
        print " ".join(row)

print "Let's play Battleship!"

def random_row(board):
    return randint(0, len(board) - 1)

def random_col(board):
    return randint(0, len(board[0]) - 1)

ship_row = random_row(board)
ship_col = random_col(board)

for turn in range(4):
    guess_row = int(raw_input("Guess Row:"))
    guess_col = int(raw_input("Guess Col:"))

    if guess_row == ship_row and guess_col == ship_col:
        print "Congratulations! You sunk my battleship!"
    else:
        if (guess_row < 0 or guess_row > 4) or (guess_col < 0 or guess_col > 4):
            print "Oops, that's not even in the ocean."
        elif(board[guess_row][guess_col] == "X"):
            print "You guessed that one already."
            continue
        else:
            print "You missed my battleship!"
            board[guess_row][guess_col] = "X"

    print 'Turn',turn+1
    if turn == 3:
        print 'Game Over'
    print_board(board)
```

## Reference

[Battleship!](https://www.codecademy.com/en/courses/python-beginner-en-4XuFm/0/1?curriculum_id=4f89dab3d788890003000096)
