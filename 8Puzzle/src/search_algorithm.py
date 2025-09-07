"""
search_algorithm.py

This module provides an abstract-base class for search algorithms.

Classes:
  SearchAlgorithm: Represents a search algorithm, which will be used to solve an 8 puzzle.

"""

from abc import ABC, abstractmethod
import time
import tracemalloc

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
    self.depth_stats = []

  def run(self, initial_state):
    """
    Run the search algorithm, and measure its execution time.

    Args:
      initial_state (EightPuzzle): An 8 puzzle with a randomized initial state.
    """
    # Record the start and end time when finding the goal state for an 8 puzzle. Afterwards, print
    # the results to a .txt file.

    # Measure elapsed time and memory usage.
    tracemalloc.start()
    start = time.perf_counter()
    result = self.find(initial_state)
    elapsed = time.perf_counter() - start
    # Only need the current allocated memory. If peak is needed, subsitute _ for peak.
    current, _ = tracemalloc.get_traced_memory()
    tracemalloc.stop()
    # Add time and memory usage to lists.
    self.elapsed_times.append(elapsed)
    self.memory_usage_stats.append(current)

    # Get depth if it exists and add to file. Additionally, add time and memory usage stats.
    depth = getattr(result, "depth", None)
    file_name = f"{self.__class__.__name__}_results.txt"
    with open(file_name, "a", encoding="utf-8") as f:
      if depth is not None:
        f.write(f"time_s={elapsed:.6f}, depth={depth}\n")
        self.depth_stats.append(depth)
      else:
        f.write(f"time_s={elapsed:.6f}\n")
      f.write(f"memory_KB={current / 1024:.6f}\n")


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