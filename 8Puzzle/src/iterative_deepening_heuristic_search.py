"""
iterative_deepening_heuristic_search.py

This module is a concrete subclass that inherits from the SearchAlgorithm class.

Classes:
  IterativeDeepeningHeuristicSearch: Represents the iterative deepening heuristic search algorithm,
  which will be used to solve an 8 puzzle.
"""

from search import memoize, Node
from search_algorithm import SearchAlgorithm
import numpy as np

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

  def _iterative_deepening_astar_search(self, problem, h=None):
    """
    Iterative Deepening A* (IDA*): depth-first contours with f = g + h threshold.

    Args:
      problem (EightPuzzle): An 8 puzzle with a randomized initial state.
      h (func): Heuristic function

    Returns:
      Goal Node or None if an unsolvable initial state was entered.
    
    Note:
      Implemented with the assistance of ChatGPT
    """
    h = memoize(h or problem.h, 'h')
    start = Node(problem.initial)
    # Initial threshold used as a bound in the depth first search.
    threshold = h(start)

    while True:
      # Expand one contour at a time. In the IDS A* algorithm, a contour is a bounded depth first
      # search that is bounded by an f-cost threshold, where f = g + h (g is the cost so far, and h
      # the heuristic estimate). If no result is found, increase the threshold.
      next_threshold, result = self._iterative_deepening_astar_contour(problem, start, g=0,
                                                                       threshold=threshold, h=h,
                                                                       path_states={start.state})
      if result is not None:
        break
      # In case an unsolvable initial state is received.
      if next_threshold == np.inf:
        result = None
        break
      threshold = next_threshold
    return result
  
  def _iterative_deepening_astar_contour(self, problem, node, g, threshold, h, path_states):
    """
    DFS limited by f = g + h <= threshold.

    Args:
      problem (EightPuzzle): An 8 puzzle with a randomized initial state.
      node (Node): Node in a search tree.
      g (int): Cost so far.
      threshold (int): Threshold used for the depth first search.
      h (func): Heuristic function.
      path_states (set): Current path, used to avoid cycles.

    Returns:
      Tuple containing:
        - min_excess: smallest f that exceeded the threshold (or np.inf if none).
        - goal_node or None: a solution node if found.
    
    Note:
      Implemented with the assistance of ChatGPT
    """
    # Calculate f-cost threshold. If the f-cost exceeds the threshold, then no solution has been
    # found. If the goal state has been found, return the goal state.
    f = g + h(node)
    if f > threshold:
      return f, None
    if problem.goal_test(node.state):
      return f, node
    # Set the smallest f to np.inf to indicante that an unsolvable initial state was provided.
    min_excess = np.inf
    # Expand children
    children = list(node.expand(problem))
    for child in children:
      if child.state in path_states:  # avoid cycles
        continue
      path_states.add(child.state)
      # Recurse with updated g
      t, found = self._iterative_deepening_astar_contour(problem, child, child.path_cost, threshold,
                                                         h, path_states)
      # Determine if a goal node was found. Otherwise, determine if the current excess is smaller
      # than the minimum excess so far.
      if found is not None:
        return t, found
      if t < min_excess:
        min_excess = t

      path_states.remove(child.state)  # backtrack
    # Return minimum excess over the threshold, and None to indicate no solution.
    return min_excess, None