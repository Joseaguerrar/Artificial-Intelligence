"""
search_algorithm.py

This module provides an abstract-base class for search algorithms.

Classes:
    SearchAlgorithm: Represents a search algorithm, which will be used to solve an 8 puzzle.

"""

from abc import ABC, abstractmethod

class SearchAlgorithm(ABC):
  """
  Class that represents a search algorithm.

  Attributes:
    elapsed_times (list): Stores the elapsed time for each iteration.
  """
  def __init__(self):
    """
    Initialize a SearchAlgorithm instance
    """
    # Initialize elapsed_times as an empty list
    pass

  def run(self, initial_state):
    """
    Run the search algorithm, and measure its execution time.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.
    """
    # Record the start and end time when finding the goal state for an 8 puzzle. Afterwards, print
    # the results to a .txt file.
    pass

  @abstractmethod
  def find(self, initial_state):
    """
    Use a search algorithm to find the desired state.

    Note:
      This method must be implemented by concrete subclasses.
    """
    pass