"""
iterative_deepening_search.py

This module is a concrete subclass that inherits from the SearchAlgorithm class.

Classes:
  IterativeDeepeningSearch: Represents the iterative deepening search algorithm, which will be used
  to solve an 8 puzzle.
"""

from search_algorithm import SearchAlgorithm
from search import iterative_deepening_search

class IterativeDeepeningSearch(SearchAlgorithm):
  """
  Class that represents the iterative deepening search algorithm.
  """
  def __init__(self):
    """
    Initialize a IterativeDeepeningSearch instance
    """
    # Call the base class constructor
    super().__init__()

  def find(self, initial_state):
    """
    Use the iterative deepening search algorithm to find the desired state.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.

    Note:
      Implementation of the base class abstract method.
    """
    return iterative_deepening_search(initial_state.board)