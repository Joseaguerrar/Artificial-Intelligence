"""
eight_puzzle_solver.py

This module is a concrete subclass that inherits from the SearchAlgorithm class.

Classes:
  EightPuzzleSolver: Represents a solver, which uses the breadth first, gready breadth first
  heuristic, iterative deepening and iterative deepening heuristic search algorithms, to solve an
  8 puzzle.
"""

from search_algorithm import SearchAlgorithm
from state import State
from breadth_first_search import BreadthFirstSearch
from breadth_first_heuristic_search import BreadthFirstHeuristicSearch
from iterative_deepening_search import IterativeDeepeningSearch
from iterative_deepening_heuristic_search import IterativeDeepeningHeuristicSearch
from itertools import repeat

class EightPuzzleSolver(SearchAlgorithm):
  """
  Class that represents an 8 puzzle solver.
  """
  def __init__(self, iterations_count=20, search_algorithms=None):
    """
    Initialize a EightPuzzleSolver instance. If not search algorithms are specified, all search
    algorithms are used.
    """
    self.iterations_count = iterations_count
    if search_algorithms is None:
      self.search_algorithms = [BreadthFirstSearch(), BreadthFirstHeuristicSearch(),
                                IterativeDeepeningSearch(), IterativeDeepeningHeuristicSearch()]

  def run(self):
    """
    Use the breadth first, gready breadth first heuristic, iterative deepening and iterative
    deepening heuristic search algorithms, to solve an 8 puzzle. After each iteration, record and
    write execution time statistics.
    """
    # Repeat is used, because the value of the index doesn't matter.
    for _ in repeat(None, self.iterations_count):
      initial_state = State()
      initial_state.generate_solvable_random_state()
      for search_algorithm in self.search_algorithms:
        search_algorithm.run(initial_state)
    self.write_average_statistics()
  
  def write_average_statistics(self):
    """
    Write average execution time and memory usage statistics for each of the registered search
    algorithms.
    """
    file_name = f"{self.__class__.__name__}_results.txt"
    with open(file_name, "a", encoding="utf-8") as f:
      for search_algorithm in self.search_algorithms:
        f.write(
          f"average_time_s={sum(
            search_algorithm.elapsed_times) / self.iterations_count:.6f}\n")
        f.write(
          f"average_memory_KB={sum(
            search_algorithm.memory_usage_stats) / self.iterations_count / 1024:.6f}\n")

