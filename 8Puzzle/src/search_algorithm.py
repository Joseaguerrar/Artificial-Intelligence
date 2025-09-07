"""
search_algorithm.py

This module provides an abstract-base class for search algorithms.

Classes:
  SearchAlgorithm: Represents a search algorithm, which will be used to solve an 8 puzzle.

"""

from abc import ABC, abstractmethod
import time

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
    # Initialize elapsed_times as an empty list.
    self.elapsed_times = []
    self.memory_usage_stats = []

  def run(self, initial_state):
    """
    Run the search algorithm, and measure its execution time.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.

    Returns:
      (result_node, elapsed_seconds)
    """
    # Record the start and end time when finding the goal state for an 8 puzzle. Afterwards, print
    # the results to a .txt file.

    # Measure elapsed time.
    start = time.perf_counter()
    result = self.find(initial_state)
    elapsed = time.perf_counter() - start

    # Add time to list.
    self.elapsed_times.append(elapsed)

    # Get depth if it exists and add to file.
    depth = getattr(result, "depth", None)
    file_name = f"{self.__class__.__name__}_results.txt"
    with open(file_name, "a", encoding="utf-8") as f:
      if depth is not None:
        f.write(f"time_s={elapsed:.6f}, depth={depth}\n")
      else:
        f.write(f"time_s={elapsed:.6f}\n")

    return result, elapsed


  @abstractmethod
  def find(self, initial_state):
    """
    Use a search algorithm to find the desired state.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.

    Note:
      This method must be implemented by concrete subclasses.
    """
    pass