"""
iterative_deepening_heuristic_search.py

This module is a concrete subclass that inherits from the SearchAlgorithm class.

Classes:
  IterativeDeepeningHeuristicSearch: Represents the iterative deepening heuristic search algorithm,
  which will be used to solve an 8 puzzle.
"""

from search_algorithm import SearchAlgorithm

class IterativeDeepeningHeuristicSearch(SearchAlgorithm):
  """
  Class that represents the iterative deepening heuristic search algorithm.
  """
  def __init__(self):
    """
    Initialize a IterativeDeepeningHeuristicSearch instance
    """
    # Call the base class constructor
    super().__init__()

  def find(self, initial_state):
    """
    Use the iterative deepening heuristic search algorithm to find the desired state.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.

    Note:
      Implementation of the base class abstract method.
    """
    pass