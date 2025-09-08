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

  def generate_solvable_random_state(self, steps=15):
    """
    Generate a random 8Puzzle state by performing a random walk of `steps` moves from the goal 
    state. Guarantees solvability.

    Args:
      steps (int): Number of random moves to apply starting from the goal state.
    """
    state = GOAL_STATE
    last_action = None

    for _ in range(steps):
      # Create an AIMA problem with the current state (goal).
      puzzle = EightPuzzle(state)

      # Ask AIMA for the legal actions (that is moving 0 in any direction).
      actions = puzzle.actions(state)

      # Avoid last movement immediately if there was one.
      if last_action:
        # Basically, we get the opposite move.
        inverse = {'UP':'DOWN', 'DOWN':'UP', 'LEFT':'RIGHT', 'RIGHT':'LEFT'}

        # And we filter actions to avoid that immediate inverse.
        # For example, if we moved 0 to the right, we can't move it to the left now, because
        # that would leave us with the previous state.
        actions = [a for a in actions if a != inverse[last_action]] or actions

      # Then we choose a random move.
      action = random.choice(actions)
      state = puzzle.result(state, action)
      last_action = action

    self.board = EightPuzzle(state)
