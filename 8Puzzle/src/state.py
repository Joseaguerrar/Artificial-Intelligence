"""
state.py

This module provides a State class for representing the state of an 8Puzzle game.

Classes:
    State: Represents the state of an 8Puzzle game. To solve an 8Puzzle game, use this state with a
    search algorithm.

"""

import random
from search import EightPuzzle

GOAL_STATE = (1,2,3,4,5,6,7,8,0) # An 8Puzzle's goal state

class State:
  """
  Class that represents the state of the game.

  Attributes:
    board (EightPuzzle): An 8Puzzle board.
  """

  def __init__(self, board=EightPuzzle(GOAL_STATE)):
    """
    Initialize a State instance

    Args:
      board (EightPuzzle): An 8Puzzle board. If no value is provided, board is initialized to the
      goal state (1,2,3,4,5,6,7,8,0).
    """
    self.board = board

  def generate_solvable_random_state(self, steps=1):
    """
    Generate a random 8Puzzle board state from the goal one.

    Args:
      steps (int): Number of iterations in order to randomize.

    Returns:
      EightPuzzle: A random 8Puzzle state.
    """
    # Create tuples with a random permutation of the numbers 0 - 8, until the created tuple
    # represents a solvable 8Puzzle.
    for i in range(steps):
      while True:
        state = tuple(random.sample(range(9), 9))
        if is_solvable(state):
          return state
    