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
    
    Note:
      Generated with the aid of ChatGPT.
    """
    # Create tuples with a random permutation of the numbers 0 - 8, until the created tuple
    # represents a solvable 8Puzzle.
    for i in range(steps):
      while True:
        state = tuple(random.sample(range(9), 9))
        if is_solvable(state):
          return state
  
  def is_solvable(self, state):
    """
    Determines whether an 8Puzzle initial state is solvable. A solvable 8Puzzle has an even amount
    of inversions. An inversion occurs when a larger number precedes a smaller number. For example,
    in the state (1,2,3,4,7,5,6,8,0), there are 2 inversions, because the 7 precedes the 5 and 6.
    When calculating inversions, the 0 is ignored. Therefore, this initial state is solvable.

    Args:
      state (tuple): 8Puzzle state, represented as a tuple, whose solvability will be determined.

    Returns:
      bool: Whether the 8Puzzle state is solvable or not.
    
    Note:
      Generated with the aid of ChatGPT.
    """
    # Remove 0 from the current state, and for each number, determine the amount of inversions.
    # Afterwards, return whether the amount of inversions is even.
    state_zero_removed = [x for x in state if x != 0]
    inversions = sum(
      1 for i in range(
          len(state_zero_removed)
        ) for j in range(
            i+1, len(state_zero_removed)
          ) if state_zero_removed[i] > state_zero_removed[j]
    )
    return inversions % 2 == 0
    