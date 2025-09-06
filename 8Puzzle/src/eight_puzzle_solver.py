"""
eight_puzzle_solver.py

This module is a concrete subclass that inherits from the SearchAlgorithm class.

Classes:
  EightPuzzleSolver: Represents a solver, which uses the breadth first, gready breadth first
  heuristic, iterative deepening and iterative deepening heuristic search algorithms, to solve an
  8 puzzle.
"""

from search_algorithm import SearchAlgorithm

class EightPuzzleSolver(SearchAlgorithm):
  """
  Class that represents an 8 puzzle solver.
  """
  def __init__(self, iterations_count=20):
    """
    Initialize a EightPuzzleSolver instance
    """
    pass

  def run(self):
    """
    Use the breadth first, gready breadth first heuristic, iterative deepening and iterative
    deepening heuristic search algorithms, to solve an 8 puzzle. After each iteration, record and
    write execution time statistics.
    """
    pass